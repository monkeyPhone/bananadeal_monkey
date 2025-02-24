// To parse this JSON data, do
//
//     final guyhapData = guyhapDataFromJson(jsonString);

import 'dart:convert';

GuyhapData guyhapDataFromJson(String str) => GuyhapData.fromJson(json.decode(str));

String guyhapDataToJson(GuyhapData data) => json.encode(data.toJson());

class GuyhapData {
  String result;
  List<GuyhapDataList> list;

  GuyhapData({
    required this.result,
    required this.list,
  });

  factory GuyhapData.fromJson(Map<String, dynamic> json) => GuyhapData(
    result: json["result"],
    list: List<GuyhapDataList>.from(json["LIST"].map((x) => GuyhapDataList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "result": result,
    "LIST": List<dynamic>.from(list.map((x) => x.toJson())),
  };
}

class GuyhapDataList {
  String? gpIdx;
  String? tkIdxMobile;
  String? tkIdxCable;
  String? listPcIdx;
  String? gpOrder;
  String? gpProductName;
  String? gpListName;
  String? gpContent;
  String? gpExplain;
  String? gpGyeolhabIcon;
  String? gpIsMobile;
  String? gpIsCable;
  String? gpIsImpossibleNewGyeolhab;
  String? gpDiscountValue;
  String? gpDiscountType;
  String? gpRegiDate;
  String? gpEditDate;
  String? gpPromoIdx;
  String? gpPromoTitle;
  String? gpPromoPrice;

  GuyhapDataList({
    required this.gpIdx,
    required this.tkIdxMobile,
    required this.tkIdxCable,
    required this.listPcIdx,
    required this.gpOrder,
    required this.gpProductName,
    required this.gpListName,
    required this.gpContent,
    required this.gpExplain,
    required this.gpGyeolhabIcon,
    required this.gpIsMobile,
    required this.gpIsCable,
    required this.gpIsImpossibleNewGyeolhab,
    required this.gpDiscountValue,
    required this.gpDiscountType,
    required this.gpRegiDate,
    required this.gpEditDate,
    required this.gpPromoIdx,
    required this.gpPromoTitle,
    required this.gpPromoPrice,
  });

  factory GuyhapDataList.fromJson(Map<String, dynamic> json) => GuyhapDataList(
    gpIdx: json["GP_idx"] ?? '',
    tkIdxMobile: json["tk_idx_mobile"] ?? '',
    tkIdxCable: json["tk_idx_cable"] ?? '',
    listPcIdx: json["pc_idx"] ?? '',
    gpOrder: json["GP_order"] ?? '',
    gpProductName: json["GP_productName"] ?? '',
    gpListName: json["GP_listName"] ?? '',
    gpContent: json["GP_content"] ?? '',
    gpExplain: json["GP_explain"] ?? '',
    gpGyeolhabIcon: json["GP_gyeolhabIcon"] ?? '',
    gpIsMobile: json["GP_isMobile"] ?? '',
    gpIsCable: json["GP_isCable"] ?? '',
    gpIsImpossibleNewGyeolhab: json["GP_isImpossibleNewGyeolhab"] ?? '',
    gpDiscountValue: json["GP_discountValue"] ?? '',
    gpDiscountType: json["GP_discountType"] ?? '',
    gpRegiDate: json["GP_regi_date"] ?? '',
    gpEditDate: json["GP_edit_date"] ?? '',
    gpPromoIdx: json["GP_promoIdx"] ?? '',
    gpPromoTitle: json["GP_promoTitle"] ?? '',
    gpPromoPrice: json["GP_promoPrice"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "GP_idx": gpIdx,
    "tk_idx_mobile": tkIdxMobile,
    "tk_idx_cable": tkIdxCable,
    "pc_idx": listPcIdx,
    "GP_order": gpOrder,
    "GP_productName": gpProductName,
    "GP_listName": gpListName,
    "GP_content": gpContent,
    "GP_explain": gpExplain,
    "GP_gyeolhabIcon": gpGyeolhabIcon,
    "GP_isMobile": gpIsMobile,
    "GP_isCable": gpIsCable,
    "GP_isImpossibleNewGyeolhab": gpIsImpossibleNewGyeolhab,
    "GP_discountValue": gpDiscountValue,
    "GP_discountType": gpDiscountType,
    "GP_regi_date": gpRegiDate,
    "GP_edit_date": gpEditDate,
    "GP_promoIdx": gpPromoIdx,
    "GP_promoTitle": gpPromoTitle,
    "GP_promoPrice": gpPromoPrice,
  };
}
