// To parse this JSON data, do
//
//     final userBlock = userBlockFromJson(jsonString);

import 'dart:convert';

UserBlock userBlockFromJson(String str) => UserBlock.fromJson(json.decode(str));

String userBlockToJson(UserBlock data) => json.encode(data.toJson());

class UserBlock {
  int status;
  String msg;
  List<UserBlockList> result;

  UserBlock({
    required this.status,
    required this.msg,
    required this.result,
  });

  factory UserBlock.fromJson(Map<String, dynamic> json) => UserBlock(
    status: json["status"],
    msg: json["msg"],
    result: List<UserBlockList>.from(json["result"].map((x) => UserBlockList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "result": List<dynamic>.from(result.map((x) => x.toJson())),
  };
}

class UserBlockList {
  int buIdx;
  String? mName;
  String? mPathImg;
  String? smStoreName;
  String? smPathImg0;

  UserBlockList({
    required this.buIdx,
    this.mName,
    this.mPathImg,
    this.smStoreName,
    this.smPathImg0,
  });

  factory UserBlockList.fromJson(Map<String, dynamic> json) => UserBlockList(
    buIdx: json["BU_idx"] ?? 0,
    mName: json["M_name"] ?? '',
    mPathImg: json["M_path_img"] ?? '',
    smStoreName: json["SM_store_name"] ?? '',
    smPathImg0: json["SM_path_img0"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "BU_idx": buIdx,
    "M_name": mName,
    "M_path_img": mPathImg,
    "SM_store_name": smStoreName,
    "SM_path_img0": smPathImg0,
  };
}
