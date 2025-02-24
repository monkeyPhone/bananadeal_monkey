// To parse this JSON data, do
//
//     final phoneRatePlan = phoneRatePlanFromJson(jsonString);

import 'dart:convert';

PhoneRatePlan phoneRatePlanFromJson(String str) => PhoneRatePlan.fromJson(json.decode(str));

String phoneRatePlanToJson(PhoneRatePlan data) => json.encode(data.toJson());

class PhoneRatePlan {
  PhoneRatePlan({
    this.rateList,
  });

  List<RateList>? rateList;

  factory PhoneRatePlan.fromJson(Map<String, dynamic> json) => PhoneRatePlan(
    rateList: List<RateList>.from(json["LIST"].map((x) => RateList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "LIST": List<dynamic>.from(rateList!.map((x) => x.toJson())),
  };
}

class RateList {
  RateList({
     this.pIdx,
     this.pgIdx,
     this.pOrder,
     this.pType,
     this.pPlanName,
     this.pPlanPrice,
     this.pLte,
     this.pTel,
     this.pSms,
     this.pgName,
  });

  String? pIdx;
  String? pgIdx;
  String? pOrder;
  String? pType;
  String? pPlanName;
  String? pPlanPrice;
  String? pLte;
  String? pTel;
  String? pSms;
  String? pgName;

  factory RateList.fromJson(Map<String, dynamic> json) => RateList(
    pIdx: json["P_idx"] ?? '',
    pgIdx: json["pg_idx"] ?? '',
    pOrder: json["P_order"] ?? '',
    pType: json["P_type"] ?? '',
    pPlanName: json["P_plan_name"] ?? '',
    pPlanPrice: json["P_plan_price"] ?? '',
    pLte: json["P_lte"] ?? '',
    pTel: json["P_tel"] ?? '',
    pSms: json["P_sms"] ?? '',
    pgName: json["PG_name"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "P_idx": pIdx,
    "pg_idx": pgIdx,
    "P_order": pOrder,
    "P_type": pType,
    "P_plan_name": pPlanName,
    "P_plan_price": pPlanPrice,
    "P_lte": pLte,
    "P_tel": pTel,
    "P_sms": pSms,
    "PG_name": pgName,
  };
}
