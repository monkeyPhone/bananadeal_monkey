// To parse this JSON data, do
//
//     final phoneRatePlanDetail = phoneRatePlanDetailFromJson(jsonString);

import 'dart:convert';

PhoneRatePlanDetail phoneRatePlanDetailFromJson(String str) => PhoneRatePlanDetail.fromJson(json.decode(str));

String phoneRatePlanDetailToJson(PhoneRatePlanDetail data) => json.encode(data.toJson());

class PhoneRatePlanDetail {
  PhoneRatePlanDetail({
    required this.list,
  });

  List<detailList> list;

  factory PhoneRatePlanDetail.fromJson(Map<String, dynamic> json) => PhoneRatePlanDetail(
    list: List<detailList>.from(json["LIST"].map((x) => detailList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "LIST": List<dynamic>.from(list.map((x) => x.toJson())),
  };
}

class detailList {
  detailList({
    this.pIdx,
    this.tkIdx,
    this.pgIdx,
    this.pOrder,
    this.pType,
    this.pLogAgeType,
    this.pPureType,
    this.pPlanName,
    this.pPlanPrice,
    this.pPlanRealPrice,
    this.pPlanMappingPrice,
    this.pPlanPriceChoice20,
    this.pPlanPriceChoice25,
    this.pPlanPriceNone,
    this.pPlanPrice12Month,
    this.pPlanPrice24Month,
    this.pPlanPrice30Month,
    this.pPlanPrice36Month,
    this.pLte,
    this.pTel,
    this.pSms,
    this.pInfo,
    this.pOpenPromotionIdx,
    this.pChoicePromotionIdx,
    this.pRegiDate,
    this.pEditDate,
    this.pBaseDate,
    this.ppIdx,
    this.ppOrder,
    this.ppTitle,
    this.ppPrice,
    this.ppPromoDiscountCondition,
    this.ppRegiDate,
    this.ppEditDate,
    this.ppPromoType,
    this.ppPromoDiscountType,
    this.ppPromoIsSelect,
    this.ppPromoContent,
    this.ppPromoNotice,
    this.ppPromoPriceIdx,
    this.ppPromoCondition,
    this.ppPromoComment,
    this.ppPenalty,
    this.pgIdx1,
    this.pgOrder,
    this.pgName,
    this.pgRegiDate,
    this.pgEditDate,
    this.promoGongsiIdx,
    this.promoGongsiTitle,
    this.promoGongsiPrice,
    this.promoChoiceIdx,
    this.promoChoiceTitle,
    this.promoChoicePrice,
  });

  String? pIdx;
  String? tkIdx;
  String? pgIdx;
  String? pOrder;
  String? pType;
  String? pLogAgeType;
  String? pPureType;
  String? pPlanName;
  String? pPlanPrice;
  String? pPlanRealPrice;
  String? pPlanMappingPrice;
  String? pPlanPriceChoice20;
  String? pPlanPriceChoice25;
  String? pPlanPriceNone;
  String? pPlanPrice12Month;
  String? pPlanPrice24Month;
  String? pPlanPrice30Month;
  String? pPlanPrice36Month;
  String? pLte;
  String? pTel;
  String? pSms;
  String? pInfo;
  String? pOpenPromotionIdx;
  String? pChoicePromotionIdx;
  String? pRegiDate;
  String? pEditDate;
  String? pBaseDate;
  String? ppIdx;
  String? ppOrder;
  String? ppTitle;
  String? ppPrice;
  String? ppPromoDiscountCondition;
  String? ppRegiDate;
  String? ppEditDate;
  String? ppPromoType;
  String? ppPromoDiscountType;
  String? ppPromoIsSelect;
  String? ppPromoContent;
  String? ppPromoNotice;
  String? ppPromoPriceIdx;
  String? ppPromoCondition;
  String? ppPromoComment;
  String? ppPenalty;
  String? pgIdx1;
  String? pgOrder;
  String? pgName;
  String? pgRegiDate;
  String? pgEditDate;
  String? promoGongsiIdx;
  String? promoGongsiTitle;
  String? promoGongsiPrice;
  String? promoChoiceIdx;
  String? promoChoiceTitle;
  String? promoChoicePrice;

  factory detailList.fromJson(Map<String, dynamic> json) => detailList(
    pIdx: json["P_idx"] ?? '',
    tkIdx: json["tk_idx"] ?? '',
    pgIdx: json["pg_idx"] ?? '',
    pOrder: json["P_order"] ?? '',
    pType: json["P_type"] ?? '',
    pLogAgeType: json["P_logAgeType"] ?? '',
    pPureType: json["P_pure_type"] ?? '',
    pPlanName: json["P_plan_name"] ?? '',
    pPlanPrice: json["P_plan_price"] ?? '',
    pPlanRealPrice: json["P_plan_realPrice"] ?? '',
    pPlanMappingPrice: json["P_plan_mappingPrice"] ?? '',
    pPlanPriceChoice20: json["P_plan_price_choice20"] ?? '',
    pPlanPriceChoice25: json["P_plan_price_choice25"] ?? '',
    pPlanPriceNone: json["P_plan_price_none"] ?? '',
    pPlanPrice12Month: json["P_plan_price_12month"] ?? '',
    pPlanPrice24Month: json["P_plan_price_24month"] ?? '',
    pPlanPrice30Month: json["P_plan_price_30month"] ?? '',
    pPlanPrice36Month: json["P_plan_price_36month"] ?? '',
    pLte: json["P_lte"] ?? '',
    pTel: json["P_tel"] ?? '',
    pSms: json["P_sms"] ?? '',
    pInfo: json["P_info"] ?? '',
    pOpenPromotionIdx: json["P_open_promotionIdx"] ?? '',
    pChoicePromotionIdx: json["P_choice_promotionIdx"] ?? '',
    pRegiDate: json["P_regi_date"] ?? '',
    pEditDate: json["P_edit_date"] ?? '',
    pBaseDate: json["P_baseDate"] ?? '',
    ppIdx: json["PP_idx"] ?? '',
    ppOrder: json["PP_order"] ?? '',
    ppTitle: json["PP_title"] ?? '',
    ppPrice: json["PP_price"] ?? '',
    ppPromoDiscountCondition: json["PP_promo_discount_condition"] ?? '',
    ppRegiDate: json["PP_regi_date"] ?? '',
    ppEditDate: json["PP_edit_date"] ?? '',
    ppPromoType: json["PP_promo_type"] ?? '',
    ppPromoDiscountType: json["PP_promo_discount_type"] ?? '',
    ppPromoIsSelect: json["PP_promo_isSelect"] ?? '',
    ppPromoContent: json["PP_promo_content"] ?? '',
    ppPromoNotice: json["PP_promo_notice"] ?? '',
    ppPromoPriceIdx: json["PP_promo_price_idx"] ?? '',
    ppPromoCondition: json["PP_promo_condition"] ?? '',
    ppPromoComment: json["PP_promo_comment"] ?? '',
    ppPenalty: json["PP_penalty"] ?? '',
    pgIdx1: json["PG_idx"] ?? '',
    pgOrder: json["PG_order"] ?? '',
    pgName: json["PG_name"] ?? '',
    pgRegiDate: json["PG_regi_date"] ?? '',
    pgEditDate: json["PG_edit_date"] ?? '',
    promoGongsiIdx: json["promoGongsiIdx"] ?? '',
    promoGongsiTitle: json["promoGongsiTitle"] ?? '',
    promoGongsiPrice: json["promoGongsiPrice"] ?? '',
    promoChoiceIdx: json["promoChoiceIdx"] ?? '',
    promoChoiceTitle: json["promoChoiceTitle"] ?? '',
    promoChoicePrice: json["promoChoicePrice"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "P_idx": pIdx,
    "tk_idx": tkIdx,
    "pg_idx": pgIdx,
    "P_order": pOrder,
    "P_type": pType,
    "P_logAgeType": pLogAgeType,
    "P_pure_type": pPureType,
    "P_plan_name": pPlanName,
    "P_plan_price": pPlanPrice,
    "P_plan_realPrice": pPlanRealPrice,
    "P_plan_mappingPrice": pPlanMappingPrice,
    "P_plan_price_choice20": pPlanPriceChoice20,
    "P_plan_price_choice25": pPlanPriceChoice25,
    "P_plan_price_none": pPlanPriceNone,
    "P_plan_price_12month": pPlanPrice12Month,
    "P_plan_price_24month": pPlanPrice24Month,
    "P_plan_price_30month": pPlanPrice30Month,
    "P_plan_price_36month": pPlanPrice36Month,
    "P_lte": pLte,
    "P_tel": pTel,
    "P_sms": pSms,
    "P_info": pInfo,
    "P_open_promotionIdx": pOpenPromotionIdx,
    "P_choice_promotionIdx": pChoicePromotionIdx,
    "P_regi_date": pRegiDate,
    "P_edit_date": pEditDate,
    "P_baseDate": pBaseDate,
    "PP_idx": ppIdx,
    "PP_order": ppOrder,
    "PP_title": ppTitle,
    "PP_price": ppPrice,
    "PP_promo_discount_condition": ppPromoDiscountCondition,
    "PP_regi_date": ppRegiDate,
    "PP_edit_date": ppEditDate,
    "PP_promo_type": ppPromoType,
    "PP_promo_discount_type": ppPromoDiscountType,
    "PP_promo_isSelect": ppPromoIsSelect,
    "PP_promo_content": ppPromoContent,
    "PP_promo_notice": ppPromoNotice,
    "PP_promo_price_idx": ppPromoPriceIdx,
    "PP_promo_condition": ppPromoCondition,
    "PP_promo_comment": ppPromoComment,
    "PP_penalty": ppPenalty,
    "PG_idx": pgIdx1,
    "PG_order": pgOrder,
    "PG_name": pgName,
    "PG_regi_date": pgRegiDate,
    "PG_edit_date": pgEditDate,
    "promoGongsiIdx": promoGongsiIdx,
    "promoGongsiTitle": promoGongsiTitle,
    "promoGongsiPrice": promoGongsiPrice,
    "promoChoiceIdx": promoChoiceIdx,
    "promoChoiceTitle": promoChoiceTitle,
    "promoChoicePrice": promoChoicePrice,
  };
}
