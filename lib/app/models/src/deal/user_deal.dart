// To parse this JSON data, do
//
//     final userDeal = userDealFromJson(jsonString);

import 'dart:convert';

UserDeal userDealFromJson(String str) => UserDeal.fromJson(json.decode(str));

String userDealToJson(UserDeal data) => json.encode(data.toJson());

class UserDeal {
  UserDeal({
    required this.status,
    required this.msg,
    required this.result,
  });

  int status;
  String msg;
  List<UserDealInfo> result;

  factory UserDeal.fromJson(Map<String, dynamic> json) => UserDeal(
    status: json["status"],
    msg: json["msg"],
    result: List<UserDealInfo>.from(json["result"].map((x) => UserDealInfo.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "result": List<dynamic>.from(result.map((x) => x.toJson())),
  };
}

class UserDealInfo {
  UserDealInfo({
    required this.diIdx,
    required this.diRegUserIdx,
    required this.diStatus,
    required this.diJoinType,
    required this.diSupportType,
    required this.diBeforeTkIdx,
    required this.diAfterTkIdx,
    required this.diHopePhone,
    required this.diHopePhoneModel,
    required this.diHopePhoneIdx,
    required this.diHopePlanIdx,
    required this.diHopePlan,
    required this.diAgeType,
    required this.diMaxInstallmentMonth,
    required this.diCombination,
    required this.diWelfare,
    required this.diRequests,
    required this.diRegdate,
    required this.diHopePhoneImg,
  });

  int diIdx;
  int diRegUserIdx;
  String diStatus;
  String diJoinType;
  String diSupportType;
  String diBeforeTkIdx;
  String diAfterTkIdx;
  String diHopePhone;
  String diHopePhoneModel;
  String diHopePhoneIdx;
  String diHopePlanIdx;
  String diHopePlan;
  String diAgeType;
  int diMaxInstallmentMonth;
  String diCombination;
  String diWelfare;
  String diRequests;
  DateTime diRegdate;
  String diHopePhoneImg;

  factory UserDealInfo.fromJson(Map<String, dynamic> json) => UserDealInfo(
    diIdx: json["DI_idx"] ?? 0,
    diRegUserIdx: json["DI_reg_user_idx"] ?? 0,
    diStatus: json["DI_status"] ?? '',
    diJoinType: json["DI_join_type"] ?? '',
    diSupportType: json["DI_support_type"] ?? '',
    diBeforeTkIdx: json["DI_before_tk_idx"] ?? '',
    diAfterTkIdx: json["DI_after_tk_idx"] ?? '',
    diHopePhone: json["DI_hope_phone"] ?? '',
    diHopePhoneModel: json["DI_hope_phone_model"] ?? '',
    diHopePhoneIdx: json["DI_hope_phone_idx"] ?? '',
    diHopePlanIdx: json["DI_hope_plan_idx"] ?? '',
    diHopePlan: json["DI_hope_plan"] ?? '',
    diAgeType: json["DI_age_type"] ?? '',
    diMaxInstallmentMonth: json["DI_max_installment_month"] ?? 0,
    diCombination: json["DI_combination"] ?? '',
    diWelfare: json["DI_welfare"] ?? '',
    diRequests: json["DI_requests"] ?? '',
    diRegdate: DateTime.parse(json["DI_regdate"] ?? '0'),
    diHopePhoneImg: json["DI_hope_phone_img"] ?? ''
  );

  Map<String, dynamic> toJson() => {
    "DI_idx": diIdx,
    "DI_reg_user_idx": diRegUserIdx,
    "DI_status": diStatus,
    "DI_join_type": diJoinType,
    "DI_support_type": diSupportType,
    "DI_before_tk_idx": diBeforeTkIdx,
    "DI_after_tk_idx": diAfterTkIdx,
    "DI_hope_phone": diHopePhone,
    "DI_hope_phone_model": diHopePhoneModel,
    "DI_hope_phone_idx": diHopePhoneIdx,
    "DI_hope_plan_idx": diHopePlanIdx,
    "DI_hope_plan": diHopePlan,
    "DI_age_type": diAgeType,
    "DI_max_installment_month": diMaxInstallmentMonth,
    "DI_combination": diCombination,
    "DI_welfare": diWelfare,
    "DI_requests": diRequests,
    "DI_regdate": diRegdate.toIso8601String(),
    "DI_hope_phone_img": diHopePhoneImg
  };
}
