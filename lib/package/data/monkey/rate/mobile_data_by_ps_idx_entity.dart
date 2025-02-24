import 'dart:convert';

MobileDataByPsIdxEntity mobileDataByPsIdxEntityFromJson(String str) => MobileDataByPsIdxEntity.fromJson(json.decode(str));

String mobileDataByPsIdxEntityToJson(MobileDataByPsIdxEntity data) => json.encode(data.toJson());

class MobileDataByPsIdxEntity {
  MobileDataByPsIdxEntity({
    required this.list,
  });

  List<MobileDataByPsIdxDto> list;

  factory MobileDataByPsIdxEntity.fromJson(Map<String, dynamic> json) => MobileDataByPsIdxEntity(
    list: List<MobileDataByPsIdxDto>.from(json["LIST"].map((x) => MobileDataByPsIdxDto.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "LIST": List<dynamic>.from(list.map((x) => x.toJson())),
  };
}

class MobileDataByPsIdxDto {
  MobileDataByPsIdxDto({
    required this.psOrder,
    required this.mdIdx,
    required this.mdModel,
    required this.mdType,
    required this.mdPriceType,
    required this.mdReleasePrice,
    required this.mdIsHalbuMonth48,
    required this.mdReservat,
    required this.pDefaultPlanIdx,
    required this.psIdx,
    required this.psName,
    required this.mkIdx,
    required this.mkName,
    required this.md2GnAgreement,
    required this.chChulgoDate,
    required this.psReleaseDate,
    required this.mdReleaseDate,
    required this.icName,
    required this.psKeyword,
    required this.psDualNumber,
    required this.mdIsType,
    required this.mdGrantLimit,
  });

  String psOrder;
  String mdIdx;
  String mdModel;
  String mdType;
  String mdPriceType;
  String mdReleasePrice;
  String mdIsHalbuMonth48;
  String mdReservat;
  String pDefaultPlanIdx;
  String psIdx;
  String psName;
  String mkIdx;
  String mkName;
  String md2GnAgreement;
  String chChulgoDate;
  String psReleaseDate;
  String mdReleaseDate;
  String icName;
  String psKeyword;
  String psDualNumber;
  String mdIsType;
  String mdGrantLimit;

  factory MobileDataByPsIdxDto.fromJson(Map<String, dynamic> json) => MobileDataByPsIdxDto(
    psOrder: json["PS_order"] ?? "",
    mdIdx: json["MD_idx"] ?? "",
    mdModel: json["MD_model"] ?? "",
    mdType: json["MD_type"] ?? "",
    mdPriceType: json["MD_price_type"] ?? "",
    mdReleasePrice: json["MD_release_price"] ?? "",
    mdIsHalbuMonth48: json["MD_isHalbuMonth48"] ?? "",
    mdReservat: json["MD_reservat"] ?? "",
    pDefaultPlanIdx: json["p_defaultPlan_idx"] ?? "",
    psIdx: json["PS_idx"] ?? "",
    psName: json["PS_name"] ?? "",
    mkIdx: json["MK_idx"] ?? "",
    mkName: json["MK_name"] ?? "",
    md2GnAgreement: json["MD_2GnAgreement"] ?? "",
    chChulgoDate: json["CH_chulgo_date"] ?? "",
    psReleaseDate: json["PS_release_date"] ?? "",
    mdReleaseDate: json["MD_release_date"] ?? "",
    icName: json["IC_name"] ?? "",
    psKeyword: json["PS_keyword"] ?? "",
    psDualNumber: json["PS_dual_number"] ?? "",
    mdIsType: json["MD_isType"] ?? "",
    mdGrantLimit: json["MD_grant_limit"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "PS_order": psOrder,
    "MD_idx": mdIdx,
    "MD_model": mdModel,
    "MD_type": mdType,
    "MD_price_type": mdPriceType,
    "MD_release_price": mdReleasePrice,
    "MD_isHalbuMonth48": mdIsHalbuMonth48,
    "MD_reservat": mdReservat,
    "p_defaultPlan_idx": pDefaultPlanIdx,
    "PS_idx": psIdx,
    "PS_name": psName,
    "MK_idx": mkIdx,
    "MK_name": mkName,
    "MD_2GnAgreement": md2GnAgreement,
    "CH_chulgo_date": chChulgoDate,
    "PS_release_date": psReleaseDate,
    "MD_release_date": mdReleaseDate,
    "IC_name": icName,
    "PS_keyword": psKeyword,
    "PS_dual_number": psDualNumber,
    "MD_isType": mdIsType,
    "MD_grant_limit": mdGrantLimit,
  };
}
