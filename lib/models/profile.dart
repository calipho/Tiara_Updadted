import 'package:json_annotation/json_annotation.dart';
import 'package:bank_project/models/user.dart';
import 'package:bank_project/services/auth_services.dart';
import 'package:bank_project/services/client.dart';
import 'package:bank_project/models/trips.dart';

// part 'profile.g.dart';

@JsonSerializable()
class Profile {
  int? user;
  String? gender;
  String? username;
  String? birth_date;
  String? first_name;
  String? last_name;
  String? image;
  String? bio;
  String? date_joined;
  List<int>? want_to;
  List<int>? favorite;
  List<Trip>? trips;

  Profile({
    this.user,
    this.gender,
    this.username,
    this.birth_date,
    this.first_name,
    this.last_name,
    this.want_to,
    this.favorite,
    this.image,
    this.bio,
    this.date_joined,
    this.trips,
  });

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
