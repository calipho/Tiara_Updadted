import 'dart:convert';
import 'dart:io';

import 'package:bank_project/models/user.dart';
import 'package:bank_project/providers/trans_providers.dart';
import 'package:bank_project/services/client.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/auth_services.dart';

class AuthProviders extends ChangeNotifier {
  User? user;
  late String token = "";
  Future<void> signUp(User user) async {
    token = await AuthServices().signUp(user);
    await setToken(token);
    notifyListeners();
  }

  Future<void> update(User user) async {
    await AuthServices().update(user);
    this.user = user;
    notifyListeners();
  }

  Future<void> signIn(User user) async {
    token = await AuthServices().signIn(user);

    setToken(token);
    notifyListeners();
  }

  void signOut() {
    token = "";
    notifyListeners();
  }

  Future<void> setToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("token", token);
    var json = Jwt.parseJwt(token);
    print(Jwt.parseJwt(token));
    print(User.fromJson2(json));
    user = User.fromJson2(json);

    Client.dio.options.headers = {
      HttpHeaders.authorizationHeader: 'Bearer $token',
    };
    notifyListeners();
  }

  Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('access') ?? "";

    return token;
    notifyListeners();
  }

  bool get isAuth {
    if (token.isNotEmpty && Jwt.getExpiryDate(token)!.isAfter(DateTime.now())) {
      var json = Jwt.parseJwt(token);
      user = User.fromJson2(json);
      return true;
    }
    logout();
    return false;
  }

  void logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("token");
    token = "";
    notifyListeners();
  }
}
