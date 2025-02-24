// To parse this JSON data, do
//
//     final chatUserRoomList = chatUserRoomListFromJson(jsonString);

import 'dart:convert';

IntroImageSet introImageSetFromJson(String str) => IntroImageSet.fromJson(json.decode(str));

String introImageSetToJson(IntroImageSet data) => json.encode(data.toJson());

class IntroImageSet {
  IntroImageSet({
    required this.status,
    required this.msg,
    required this.result,
  });

  int status;
  String msg;
  List<IntroImage> result;

  factory IntroImageSet.fromJson(Map<String, dynamic> json) => IntroImageSet(
    status: json["status"],
    msg: json["msg"],
    result: List<IntroImage>.from(json["result"].map((x) => IntroImage.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "result": List<dynamic>.from(result.map((x) => x.toJson())),
  };
}



List<IntroImage> introImageFromJson(String str) => List<IntroImage>.from(json.decode(str).map((x) => IntroImage.fromJson(x)));

String introImageToJson(List<IntroImage> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class IntroImage {
  IntroImage({
    required this.aiiIdx,
    required this.aiiOrder,
    required this.aiiPathImg,
    required this.aiiRegdate,
  });

  int aiiIdx;
  int aiiOrder;
  String aiiPathImg;
  DateTime aiiRegdate;

  factory IntroImage.fromJson(Map<String, dynamic> json) => IntroImage(
    aiiIdx: json["AII_idx"] ?? 0,
    aiiOrder: json["AII_order"] ?? 0,
    aiiPathImg: json["AII_path_img"] ?? '',
    aiiRegdate: DateTime.parse(json["AII_regdate"]),
  );

  Map<String, dynamic> toJson() => {
    "AII_idx": aiiIdx,
    "AII_order": aiiOrder,
    "AII_path_img": aiiPathImg,
    "AII_regdate": aiiRegdate.toIso8601String(),
  };
}
