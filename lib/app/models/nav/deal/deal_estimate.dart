// To parse this JSON data, do
//
//     final dealEstimate = dealEstimateFromJson(jsonString);

import 'dart:convert';


DealEstimate dealEstimateFromJson(String str) => DealEstimate.fromJson(json.decode(str));

String dealEstimateToJson(DealEstimate data) => json.encode(data.toJson());

class DealEstimate {
  DealEstimate({
    required this.status,
    required this.msg,
    required this.result,
  });

  int status;
  String msg;
  List<DealEstimateList> result;

  factory DealEstimate.fromJson(Map<String, dynamic> json) => DealEstimate(
    status: json["status"] ?? 0,
    msg: json["msg"] ?? '',
    result: List<DealEstimateList>.from(json["result"].map((x) => DealEstimateList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "result": List<dynamic>.from(result.map((x) => x.toJson())),
  };
}

class DealEstimateList {
  DealEstimateList({
    required this.deIdx,
    required this.deDIdx,
    required this.deDiIdx,
    required this.deSmMId,
    required this.deType,
    required this.deJoinTkIdx,
    required this.dePsName,
    required this.deFactoryPrice,
    required this.deSupportPrice,
    required this.deAddSupportPrice,
    required this.deTransPrice,
    required this.deAddTransPrice,
    required this.deTransYN,
    required this.deContractPlan,
    required this.dePlan,
    required this.deInstallmentMonth,
    required this.deSupportType,
    required this.deSale,
    required this.deSuggestions,
    required this.deInstallmentPrincipal,
    required this.deInstallmentInterest,
    required this.deInstallmentMonthPrice,
    required this.dePlanBasic,
    required this.deOptionalSale,
    required this.deAgreementSale,
    required this.dePromotionName,
    required this.dePromotionSale,
    required this.deOptionalMonth,
    required this.deMonthPrice,
    required this.deMonthTotalPrice,
    required this.deEditCnt,
    required this.deRegdate,
    required this.deWelfareSale,
    required this.dStatus,
    required this.deCash,
    required this.smIdx,
    required this.smStoreName,
    required this.smLatitude,
    required this.smLongitude,
    required this.smToken,
    required this.distance,
    required this.inviteDeal,
    required this.sendDeal,
    required this.openDeal,
    required this.avgPoint,
  });

  int deIdx;
  int deDIdx;
  int deDiIdx;
  String deSmMId;
  String deType;
  int deJoinTkIdx;
  String dePsName;
  int deFactoryPrice;
  int deSupportPrice;
  int deAddSupportPrice;
  int deTransPrice;
  int deAddTransPrice;
  String deTransYN;
  String deContractPlan;
  String dePlan;
  int deInstallmentMonth;
  String deSupportType;
  int deSale;
  String deSuggestions;
  int deInstallmentPrincipal;
  int deInstallmentInterest;
  int deInstallmentMonthPrice;
  int dePlanBasic;
  int deOptionalSale;
  int deAgreementSale;
  List<String> dePromotionName;
  List<String> dePromotionSale;
  String deOptionalMonth;
  int deMonthPrice;
  int deMonthTotalPrice;
  int deEditCnt;
  DateTime deRegdate;
  int deWelfareSale;
  String dStatus;
  int deCash;
  int smIdx;
  String smStoreName;
  String smLatitude;
  String smLongitude;
  String smToken;
  double distance;
  int inviteDeal;
  int sendDeal;
  int openDeal;
  String avgPoint;

  factory DealEstimateList.fromJson(Map<String, dynamic> json) {
    final String promotionNameString = json["DE_promotion_name"] ?? '';
    final String promotionSaleString = json["DE_promotion_sale"] ?? '';

    // 문자열을 리스트로 분할
    final List<String> promotionNameList =
    promotionNameString == '' ? [] : promotionNameString.contains(',') ? promotionNameString.split(',') : [promotionNameString];
    final List<String> promotionSaleList =
    promotionSaleString == '' ? [] : promotionSaleString.contains(',') ? promotionSaleString.split(',') : [promotionSaleString];



    // promotionSaleList의 각 항목을 정수로 변환

    return DealEstimateList(
      deIdx: json["DE_idx"] ?? 0, // Provide a default value (0 in this case) if the value is null
      deDIdx: json["DE_d_idx"] ?? 0,
      deDiIdx: json["DE_di_idx"] ?? 0,
      deSmMId: json["DE_sm_m_id"] ?? '',
      deType: json["DE_type"] ?? '',
      deJoinTkIdx: json["DE_join_tk_idx"] ?? 0,
      dePsName: json["DE_ps_name"] ?? '',
      deFactoryPrice: json["DE_factory_price"] ?? 0,
      deSupportPrice: json["DE_support_price"] ?? 0,
        deTransPrice: json["DE_trans_price"] ?? 0,
        deAddTransPrice: json["DE_add_trans_price"] ?? 0,
      deContractPlan: json["DE_contract_plan"] ?? '',
      deTransYN: json["DE_trans_YN"] ?? '',
      deAddSupportPrice: json["DE_add_support_price"] ?? 0,
      dePlan: json["DE_plan"] ?? '',
      deInstallmentMonth: json["DE_installment_month"] ?? 0,
      deSupportType: json["DE_support_type"] ?? '',
      deSale: json["DE_sale"] ?? 0,
      deSuggestions: json["DE_suggestions"] ?? '',
      deInstallmentPrincipal: json["DE_installment_principal"] ?? 0,
      deInstallmentInterest: json["DE_installment_interest"] ?? 0,
      deInstallmentMonthPrice: json["DE_installment_month_price"] ?? 0,
      dePlanBasic: json["DE_plan_basic"] ?? 0,
      deOptionalSale: json["DE_optional_sale"] ?? 0,
      deAgreementSale: json["DE_agreement_sale"] ?? 0,
      dePromotionName: promotionNameList ,
      dePromotionSale: promotionSaleList,
      deOptionalMonth: json["DE_optional_month"] ?? '',
      deMonthPrice: json["DE_month_price"] ?? 0,
      deMonthTotalPrice: json["DE_month_total_price"] ?? 0,
      deEditCnt: json["DE_edit_cnt"] ?? 0,
      deRegdate: DateTime.parse(json["DE_regdate"] ?? ''), // Provide a default value (empty string in this case)
      deWelfareSale: json["DE_welfare_sale"] ?? 0,
      dStatus: json["D_status"] ?? '',
      deCash: json["DE_cash"] ?? 0,
      smIdx: json["SM_idx"] ?? 0,
      smStoreName: json["SM_store_name"] ?? '',
      smLatitude: json["SM_latitude"] ?? '',
      smLongitude: json["SM_longitude"] ?? '',
      smToken: json["SM_token"] ?? '',
      distance: json["distance"] == null
          ? 0.0
          : double.tryParse(json["distance"].toString()) ?? 0.0,
      inviteDeal: json["invite_deal"] ?? 0,
      sendDeal: json["send_deal"] ?? 0,
      openDeal: json["open_deal"] ?? 0,
      avgPoint: json["avg_point"] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    "DE_idx": deIdx,
    "D_status": dStatus,
    "DE_d_idx": deDIdx,
    "DE_di_idx": deDiIdx,
    "DE_sm_m_id": deSmMId,
    "DE_type": deType,
    "DE_join_tk_idx": deJoinTkIdx,
    "DE_ps_name": dePsName,
    "DE_factory_price": deFactoryPrice,
    "DE_cash": deCash,
    "DE_support_price": deSupportPrice,
    "DE_add_support_price": deAddSupportPrice,
    "DE_plan": dePlan,
    "DE_installment_month": deInstallmentMonth,
    "DE_support_type": deSupportType,
    "DE_trans_price": deTransPrice,
    "DE_add_trans_price": deAddTransPrice,
    "DE_trans_YN": deTransYN,
    "DE_contract_plan": deContractPlan,
    "DE_sale": deSale,
    "DE_suggestions": deSuggestions,
    "DE_installment_principal": deInstallmentPrincipal,
    "DE_installment_interest": deInstallmentInterest,
    "DE_installment_month_price": deInstallmentMonthPrice,
    "DE_plan_basic": dePlanBasic,
    "DE_optional_sale": deOptionalSale,
    "DE_optional_month": deOptionalMonth,
    "DE_agreement_sale": deAgreementSale,
    "DE_welfare_sale": deWelfareSale,
    "DE_promotion_sale": dePromotionSale,
    "DE_promotion_name": dePromotionName,
    "DE_month_price": deMonthPrice,
    "DE_month_total_price": deMonthTotalPrice,
    "DE_edit_cnt": deEditCnt,
    "DE_regdate": deRegdate.toIso8601String(),
    "SM_idx": smIdx,
    "SM_store_name": smStoreName,
    "SM_latitude": smLatitude,
    "SM_longitude": smLongitude,
    "SM_token": smToken,
    "distance": distance,
    "invite_deal": inviteDeal,
    "send_deal": sendDeal,
    "open_deal": openDeal,
    "avg_point": avgPoint,
  };
}
