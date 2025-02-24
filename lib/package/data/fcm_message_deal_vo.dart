import 'dart:convert';

FcmMessageDealVO fcmMessageDealVOFromJson(String str) => FcmMessageDealVO.fromJson(json.decode(str));

String fcmMessageDealVOToJson(FcmMessageDealVO data) => json.encode(data.toJson());


class FcmMessageDealVO {
  FcmMessageDealVO({
    required this.name,
    required this.deMonthTotalPrice,
    required this.deMonthPrice,
    required this.deOptionalSale,
    required this.deOptionalMonth,
    required this.dePlanBasic,
    required this.deInstallmentPrincipal,
    required this.deCash,
    required this.deSupportPrice,
    required this.deFactoryPrice,
    required this.deSupportType,
    required this.deInstallmentMonth,
    required this.dePlan,
    required this.dePsName,
    required this.deJoinTkIdx,
    required this.deType,
  });

  String name;
  int deMonthTotalPrice;
  int deMonthPrice;
  int deOptionalSale;
  String deOptionalMonth;
  int dePlanBasic;
  int deInstallmentPrincipal;
  int deCash;
  int deSupportPrice;
  int deFactoryPrice;
  String deSupportType;
  int deInstallmentMonth;
  String dePlan;
  String dePsName;
  int deJoinTkIdx;
  String deType;

  factory FcmMessageDealVO.fromJson(Map<String, dynamic> json) => FcmMessageDealVO(
    name: json["name"] ?? '',
    deMonthTotalPrice: json["DE_month_total_price"] ?? 0,
    deMonthPrice: json["DE_month_price"] ?? 0,
    deOptionalSale: json["DE_optional_sale"] ?? 0,
    deOptionalMonth: json["DE_optional_month"] ?? '',
    dePlanBasic: json["DE_plan_basic"] ?? 0,
    deInstallmentPrincipal: json["DE_installment_principal"] ?? 0,
    deCash : json["DE_cash"] ?? 0,
    deSupportPrice: json["DE_support_price"] ?? 0,
    deFactoryPrice: json["DE_factory_price"] ?? 0,
    deSupportType: json["DE_support_type"] ?? '',
    deInstallmentMonth: json["DE_installment_month"] ?? 0,
    dePlan: json["DE_plan"] ?? '',
    dePsName: json["DE_ps_name"] ?? '',
    deJoinTkIdx: json["DE_join_tk_idx"] ?? 0,
    deType: json["DE_type"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "DE_month_total_price": deMonthTotalPrice,
    "DE_month_price" : deMonthPrice,
    "DE_optional_sale" : deOptionalSale,
    "DE_optional_month" : deOptionalMonth,
    "DE_plan_basic" : dePlanBasic,
    "DE_installment_principal" : deInstallmentPrincipal,
    "DE_cash" : deCash,
    "DE_support_price" : deSupportPrice,
    "DE_factory_price" : deFactoryPrice,
    "DE_support_type" : deSupportType,
    "DE_installment_month" : deInstallmentMonth,
    "DE_plan" : dePlan,
    "DE_ps_name" : dePsName,
    "DE_join_tk_idx" : deJoinTkIdx,
    "DE_type" : deType,
  };

}