import 'dart:convert';

MobileDataEntity mobileDataEntityFromJson(String str) => MobileDataEntity.fromJson(json.decode(str));

String mobileDataEntityToJson(MobileDataEntity data) => json.encode(data.toJson());

class MobileDataEntity {
  MobileDataEntity({
    required this.list,
  });

  List<MobileDataDto> list;

  factory MobileDataEntity.fromJson(Map<String, dynamic> json) => MobileDataEntity(
    list: List<MobileDataDto>.from(json["LIST"].map((x) => MobileDataDto.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "LIST": List<dynamic>.from(list.map((x) => x.toJson())),
  };
}

class MobileDataDto {
  MobileDataDto({
    required this.psOrder,

    required this.mdModel,
    required this.mdReleasePrice,
    required this.mdIsHalbuMonth48,

    required this.psIdx,
    required this.psName,
    required this.mkIdx,
    required this.mkName,
    required this.mdReleaseDate,
    required this.piPath,
  });

  String psOrder;

  String mdModel;


  String mdReleasePrice;
  String mdIsHalbuMonth48;

  String psIdx;
  String psName;
  String mkIdx;
  String mkName;
  DateTime mdReleaseDate;
  String piPath;

  factory MobileDataDto.fromJson(Map<String, dynamic> json) => MobileDataDto(
    psOrder: json["PS_order"] ?? '',

    mdModel: json["MD_model"] ?? '',


    mdReleasePrice: json["MD_release_price"] ?? '',
    mdIsHalbuMonth48: json["MD_isHalbuMonth48"] ?? '',

    psIdx: json["PS_idx"] ?? '',
    psName: json["PS_name"] ?? '',
    mkIdx: json["MK_idx"] ?? '',
    mkName: json["MK_name"] ?? '',
    mdReleaseDate: DateTime.parse(json["MD_release_date"]),

    piPath: json["PI_path"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "PS_order": psOrder,

    "MD_model": mdModel,


    "MD_release_price": mdReleasePrice,
    "MD_isHalbuMonth48": mdIsHalbuMonth48,

    "PS_idx": psIdx,
    "PS_name": psName,
    "MK_idx": mkIdx,
    "MK_name": mkName,
    "MD_release_date": "${mdReleaseDate.year.toString().padLeft(4, '0')}-${mdReleaseDate.month.toString().padLeft(2, '0')}-${mdReleaseDate.day.toString().padLeft(2, '0')}",

    "PI_path": piPath
  };
}