import 'dart:convert';

AddressSearchEntity addressSearchEntityFromJson(String str) => AddressSearchEntity.fromJson(json.decode(str));

String addressSearchEntityToJson(AddressSearchEntity data) => json.encode(data.toJson());

class AddressSearchEntity {
  const AddressSearchEntity({
    required this.results,
  });

  final AddressSearchDTO results;

  factory AddressSearchEntity.fromJson(Map<String, dynamic> json) => AddressSearchEntity(
    results: AddressSearchDTO.fromJson(json["results"] ?? ''),
  );

  Map<String, dynamic> toJson() => {
    "results": results.toJson(),
  };
}

class AddressSearchDTO {
  const AddressSearchDTO({
    required this.common,
    required this.juso,
  });

  final Common common;
  final List<Juso> juso;

  factory AddressSearchDTO.fromJson(Map<String, dynamic> json) => AddressSearchDTO(
    common: Common.fromJson(json["common"]),
    juso: List<Juso>.from(json["juso"].map((x) => Juso.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "common": common.toJson(),
    "juso": List<dynamic>.from(juso.map((x) => x.toJson())),
  };
}

class Common {
  const Common({
    required this.errorMessage,
    required this.countPerPage,
    required this.totalCount,
    required this.errorCode,
    required this.currentPage,
  });

  final String errorMessage;
  final String countPerPage;
  final String totalCount;
  final String errorCode;
  final String currentPage;

  factory Common.fromJson(Map<String, dynamic> json) => Common(
    errorMessage: json["errorMessage"] ?? '',
    countPerPage: json["countPerPage"] ?? '',
    totalCount: json["totalCount"] ?? '',
    errorCode: json["errorCode"] ?? '',
    currentPage: json["currentPage"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "errorMessage": errorMessage,
    "countPerPage": countPerPage,
    "totalCount": totalCount,
    "errorCode": errorCode,
    "currentPage": currentPage,
  };
}

class Juso {
  const Juso({
    required this.detBdNmList,
    required this.engAddr,
    required this.rn,
    required this.emdNm,
    required this.zipNo,
    required this.roadAddrPart2,
    required this.emdNo,
    required this.sggNm,
    required this.jibunAddr,
    required this.siNm,
    required this.roadAddrPart1,
    required this.bdNm,
    required this.admCd,
    required this.udrtYn,
    required this.lnbrMnnm,
    required this.roadAddr,
    required this.lnbrSlno,
    required this.buldMnnm,
    required this.bdKdcd,
    required this.liNm,
    required this.rnMgtSn,
    required this.mtYn,
    required this.bdMgtSn,
    required this.buldSlno,
  });

  final String detBdNmList;
  final String engAddr;
  final String rn;
  final String emdNm;
  final String zipNo;
  final  String roadAddrPart2;
  final String emdNo;
  final  String sggNm;
  final  String jibunAddr;
  final  String siNm;
  final  String roadAddrPart1;
  final   String bdNm;
  final   String admCd;
  final String udrtYn;
  final  String lnbrMnnm;
  final  String roadAddr;
  final  String lnbrSlno;
  final  String buldMnnm;
  final  String bdKdcd;
  final  String liNm;
  final  String rnMgtSn;
  final  String mtYn;
  final  String bdMgtSn;
  final  String buldSlno;

  factory Juso.fromJson(Map<String, dynamic> json) => Juso(
    detBdNmList: json["detBdNmList"],
    engAddr: json["engAddr"],
    rn: json["rn"],
    emdNm: json["emdNm"],
    zipNo: json["zipNo"],
    roadAddrPart2: json["roadAddrPart2"],
    emdNo: json["emdNo"],
    sggNm: json["sggNm"],
    jibunAddr: json["jibunAddr"],
    siNm: json["siNm"],
    roadAddrPart1: json["roadAddrPart1"],
    bdNm: json["bdNm"],
    admCd: json["admCd"],
    udrtYn: json["udrtYn"],
    lnbrMnnm: json["lnbrMnnm"],
    roadAddr: json["roadAddr"],
    lnbrSlno: json["lnbrSlno"],
    buldMnnm: json["buldMnnm"],
    bdKdcd: json["bdKdcd"],
    liNm: json["liNm"],
    rnMgtSn: json["rnMgtSn"],
    mtYn: json["mtYn"],
    bdMgtSn: json["bdMgtSn"],
    buldSlno: json["buldSlno"],
  );

  Map<String, dynamic> toJson() => {
    "detBdNmList": detBdNmList,
    "engAddr": engAddr,
    "rn": rn,
    "emdNm": emdNm,
    "zipNo": zipNo,
    "roadAddrPart2": roadAddrPart2,
    "emdNo": emdNo,
    "sggNm": sggNm,
    "jibunAddr": jibunAddr,
    "siNm": siNm,
    "roadAddrPart1": roadAddrPart1,
    "bdNm": bdNm,
    "admCd": admCd,
    "udrtYn": udrtYn,
    "lnbrMnnm": lnbrMnnm,
    "roadAddr": roadAddr,
    "lnbrSlno": lnbrSlno,
    "buldMnnm": buldMnnm,
    "bdKdcd": bdKdcd,
    "liNm": liNm,
    "rnMgtSn": rnMgtSn,
    "mtYn": mtYn,
    "bdMgtSn": bdMgtSn,
    "buldSlno": buldSlno,
  };
}
