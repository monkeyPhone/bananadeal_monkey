// To parse this JSON data, do
//
//     final etcNotice = etcNoticeFromJson(jsonString);

import 'dart:convert';

EtcNotice etcNoticeFromJson(String str) => EtcNotice.fromJson(json.decode(str));

String etcNoticeToJson(EtcNotice data) => json.encode(data.toJson());

class EtcNotice {
  int status;
  String msg;
  List<EtcNoticeList> result;

  EtcNotice({
    required this.status,
    required this.msg,
    required this.result,
  });

  factory EtcNotice.fromJson(Map<String, dynamic> json) => EtcNotice(
    status: json["status"],
    msg: json["msg"],
    result: List<EtcNoticeList>.from(json["result"].map((x) => EtcNoticeList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "result": List<dynamic>.from(result.map((x) => x.toJson())),
  };
}

class EtcNoticeList {
  int bnIdx;
  String bnUser;
  int bnOrder;
  String bnTitle;
  String bnContent;
  String bnContent2;
  String bnPathImg;
  DateTime bnRegdate;

  EtcNoticeList({
    required this.bnIdx,
    required this.bnUser,
    required this.bnOrder,
    required this.bnTitle,
    required this.bnContent,
    required this.bnContent2,
    required this.bnPathImg,
    required this.bnRegdate,
  });

  factory EtcNoticeList.fromJson(Map<String, dynamic> json) => EtcNoticeList(
    bnIdx: json["BN_idx"] ?? 0,
    bnUser: json["BN_user"] ?? '',
    bnOrder: json["BN_order"] ?? 0,
    bnTitle: json["BN_title"] ?? '',
    bnContent: json["BN_content"] ?? '',
    bnContent2: json["BN_content2"] ?? '',
    bnPathImg: json["BN_path_img"] ?? '',
    bnRegdate: DateTime.parse(json["BN_regdate"]),
  );

  Map<String, dynamic> toJson() => {
    "BN_idx": bnIdx,
    "BN_user": bnUser,
    "BN_order": bnOrder,
    "BN_title": bnTitle,
    "BN_content": bnContent,
    "BN_content2": bnContent2,
    "BN_path_img": bnPathImg,
    "BN_regdate": bnRegdate.toIso8601String(),
  };
}
