// To parse this JSON data, do
//
//     final dealStatus = dealStatusFromJson(jsonString);

import 'dart:convert';

DealStatus dealStatusFromJson(String str) => DealStatus.fromJson(json.decode(str));

String dealStatusToJson(DealStatus data) => json.encode(data.toJson());

class DealStatus {
  DealStatus({
    required this.status,
    required this.msg,
    required this.result,
  });

  int status;
  String msg;
  List<DealStatusList> result;

  factory DealStatus.fromJson(Map<String, dynamic> json) => DealStatus(
    status: json["status"],
    msg: json["msg"],
    result: List<DealStatusList>.from(json["result"].map((x) => DealStatusList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "result": List<dynamic>.from(result.map((x) => x.toJson())),
  };
}

class DealStatusList {
  DealStatusList({
    required this.diIdx,
    required this.diHopePhone,
    required this.diHopePhoneModel,
    required this.diStatus,
    required this.diEstimateCnt,
    required this.diRegdate,
    required this.diHopePhoneImg,
    required this.diIsShow,
  });

  int diIdx;
  String diHopePhone;
  String diHopePhoneModel;
  String diStatus;
  int diEstimateCnt;
  String diRegdate;
  String diHopePhoneImg;
  String diIsShow;

  factory DealStatusList.fromJson(Map<String, dynamic> json) => DealStatusList(
    diIdx: json["DI_idx"] ?? 0,
    diHopePhone: json["DI_hope_phone"] ?? '',
    diHopePhoneModel: json["DI_hope_phone_model"] ?? '',
    diStatus: json["DI_status"] ?? '',
    diEstimateCnt: json["DI_estimate_cnt"] ?? 0,
    diRegdate: json["DI_regdate"] ?? '',
    diHopePhoneImg: json["DI_hope_phone_img"] ?? '',
    diIsShow: json["DI_isShow"] ?? ''
  );

  Map<String, dynamic> toJson() => {
    "DI_idx": diIdx,
    "DI_hope_phone": diHopePhone,
    "DI_hope_phone_model": diHopePhoneModel,
    "DI_status": diStatus,
    "DI_estimate_cnt": diEstimateCnt,
    "DI_regdate": diRegdate,
    "DI_hope_phone_img": diHopePhoneImg,
    "DI_isShow": diIsShow
  };
}
