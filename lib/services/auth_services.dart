import 'package:bank_project/services/client.dart';
import 'package:dio/dio.dart';
import 'package:bank_project/models/user.dart';

class AuthServices {
  // final _dio = Dio();

  Future<String> signUp(User user) async {
    String token = "";
    try {
      FormData data = FormData.fromMap({
        "username": user.username,
        "password": user.password,
      });
      Response res = await Client.dio.post("register/", data: data);
      print(res.data["token"]);
      token = res.data["token"];
    } on DioError catch (error) {
      print(error);
    }
    return token;
  }

  Future<void> update(User user) async {
    try {
      FormData data = FormData.fromMap({
        "username": user.username,
        "password": user.password,
        "image": await MultipartFile.fromFile(
          user.image!,
        ),
      });
      await Client.dio.put("update/", data: data);
    } on DioError catch (error) {
      print(error);
    }
  }

  Future<String> signIn(User user) async {
    Response res = await Client.dio.post("login/", data: user.toJson());
    print(res.data["access"]);
    return res.data["access"];
  }
}
