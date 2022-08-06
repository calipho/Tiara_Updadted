import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:bank_project/models/profile.dart';
import 'package:bank_project/models/user.dart';
import 'package:bank_project/services/profile.dart';

class ProfileProvider extends ChangeNotifier {
  Profile profile = Profile();
  Future<Profile> getProfileData() async {
    profile = await ProfileService().getUserProfile();
    return profile;
  }

  Future<void> updateProfile(Profile profile) async {
    await ProfileService().updateProfile(profile: profile);
    notifyListeners();
  }
}
