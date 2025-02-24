import 'dart:convert';

MkEntity mkEntityFromJson(String str) => MkEntity.fromJson(json.decode(str));

String mkEntityToJson(MkEntity data) => json.encode(data.toJson());

class MkEntity {
  List<MkDto> list;

  MkEntity({
    required this.list,
  });

  factory MkEntity.fromJson(Map<String, dynamic> json) => MkEntity(
    list: List<MkDto>.from(json["LIST"].map((x) => MkDto.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "LIST": List<dynamic>.from(list.map((x) => x.toJson())),
  };
}

class MkDto {
  String mkIdx;
  String mkOrder;
  String mkName;
  String mkIsHidden;
  DateTime mkRegiDate;
  DateTime mkEditDate;

  MkDto({
    required this.mkIdx,
    required this.mkOrder,
    required this.mkName,
    required this.mkIsHidden,
    required this.mkRegiDate,
    required this.mkEditDate,
  });

  factory MkDto.fromJson(Map<String, dynamic> json) => MkDto(
    mkIdx: json["MK_idx"] ?? '',
    mkOrder: json["MK_order"] ?? '',
    mkName: json["MK_name"] ?? '',
    mkIsHidden: json["MK_isHidden"] ?? '',
    mkRegiDate: DateTime.parse(json["MK_regi_date"]),
    mkEditDate: DateTime.parse(json["MK_edit_date"]),
  );

  Map<String, dynamic> toJson() => {
    "MK_idx": mkIdx,
    "MK_order": mkOrder,
    "MK_name": mkName,
    "MK_isHidden": mkIsHidden,
    "MK_regi_date": mkRegiDate.toIso8601String(),
    "MK_edit_date": mkEditDate.toIso8601String(),
  };
}