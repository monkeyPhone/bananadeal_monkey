import 'dart:convert';

import 'package:banana_deal_by_monkeycompany/app/models/fcm/payload.dart';




PayGroup payGroupFromJson(String str) => PayGroup.fromJson(json.decode(str));

String payGroupToJson(PayGroup lit) => json.encode(lit.toJson());

class PayGroup {
  PayGroup({
    required this.data,
  });

  List<NotiPayLoad> data;


  factory PayGroup.fromJson(Map<String, dynamic> json) {
    return PayGroup(
      data: json["DATA"] != null ? List<NotiPayLoad>.from(json["DATA"].map((x) => NotiPayLoad.fromJson(x))) : [],
    );
  }

  Map<String, dynamic> toJson() => {
    "DATA": List<dynamic>.from(data.map((x) => x.toJson())),
  };

}