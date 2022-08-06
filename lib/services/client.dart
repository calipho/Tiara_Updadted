import 'package:dio/dio.dart';

class Client {
  static final dio =
      Dio(BaseOptions(baseUrl: "https://f528-213-132-255-226.eu.ngrok.io/"));
}
