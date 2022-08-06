import 'dart:io';

import 'package:bank_project/pages/transactions_page.dart';
import 'package:bank_project/services/client.dart';
import 'package:dio/dio.dart';
import 'package:bank_project/providers/auth_providers.dart';

class TripsServices {
  // final _dio = Dio();
  Future<List<Trips>?> getTrips() async {
    List<Trips>? trips = [];
    try {
      Response res = await Client.dio.get("list/");
      trips = (res.data as List)
          .map((trips) => Trips.fromJson(trips))
          .cast<Trips>()
          .toList();
    } on DioError catch (error) {
      print("NetWork Error $Error");
    }
    return trips;
  }
}

Future<bool> CreateTrip(String s,
    {required String title,
    required String description,
    required File image}) async {
  String token = await AuthProviders().getToken();
  String url = image.path.toString();
  print(token);
  bool check = false;
  try {
    FormData data = FormData.fromMap({
      "title": title,
      "description": description,
      "image": await MultipartFile.fromFile(url, filename: title),
    });
    Response res = await Client.dio.post("create/", data: data);
    print(res.data);
    check = true;
  } on DioError catch (error) {
    print(error);
  }
  return check;
}
