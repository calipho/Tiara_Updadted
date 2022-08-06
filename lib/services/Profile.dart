import 'package:dio/dio.dart';
import 'package:bank_project/models/user.dart';
import 'package:bank_project/services/auth_services.dart';
import 'package:bank_project/services/client.dart';
import '../models/user.dart';
import 'package:bank_project/services/profile.dart';
import 'package:bank_project/models/profile.dart';

class ProfileService {
  // get profile data from api
  Future<Profile> getUserProfile() async {
    Profile profile = Profile();
    try {
      Response res = await Client.dio.get("profile/");
      profile = Profile.fromJson(res.data);
    } on DioError catch (error) {
      print(error);
    }
    print(profile);
    return profile;
  }

  // Update Profile
  Future<Profile> updateProfile({required Profile profile}) async {
    try {
      if (profile.image == "") {
        FormData data = FormData.fromMap({
          "user": profile.user,
          "first_name": profile.first_name,
          "last_name": profile.last_name,
          "birth_date": profile.birth_date,
          "gender": profile.gender,
          "bio": profile.bio,
        });
        Response res = await Client.dio.patch("my-profile/", data: data);
        profile = Profile.fromJson(res.data);
      } else {
        FormData data = FormData.fromMap({
          "user": profile.user,
          "first_name": profile.first_name,
          "last_name": profile.last_name,
          "birth_date": profile.birth_date,
          "gender": profile.gender,
          "bio": profile.bio,
          "image": await MultipartFile.fromFile(
            profile.image!,
          ),
        });
        Response res = await Client.dio.patch("profile/", data: data);
        profile = Profile.fromJson(res.data);
      }
    } on DioError catch (error) {
      print(error.message);
    }

    return profile;
  }

  //
}
