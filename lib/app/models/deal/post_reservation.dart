// To parse this JSON data, do
//
//     final guyhapData = guyhapDataFromJson(jsonString);

import 'dart:convert';

PostReservation postReservationFromJson(String str) => PostReservation.fromJson(json.decode(str));

String postReservationToJson(PostReservation data) => json.encode(data.toJson());

class PostReservation {
  String rType;
  String rName;
  String rPhone;
  String rDay;



  PostReservation({
    required this.rType,
    required this.rName,
    required this.rPhone,
    required this.rDay,
  });

  factory PostReservation.fromJson(Map<String, dynamic> json) => PostReservation(
    rType: json["r_type"],
    rName: json["r_name"],
    rPhone: json["r_phone"],
    rDay: json["r_day"],
  );

  Map<String, dynamic> toJson() => {
    "r_type": rType,
    "r_name": rName,
    "r_phone": rPhone,
    "r_day": rDay,
  };
}

