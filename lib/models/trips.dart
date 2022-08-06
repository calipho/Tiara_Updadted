import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

// part 'trips.g.dart';

@JsonSerializable()
class Trip {
  int id;
  String name;
  String destination;
  String startDate;
  String endDate;
  String image;

  Trip({
    required this.id,
    required this.name,
    required this.destination,
    required this.startDate,
    required this.endDate,
    required this.image,
  });
  // factory Trip.fromJson(Map<String, dynamic> json) => _$TripFromJson(json);
  // Map<String, dynamic> toJson() => _$TripToJson(this);
}
