import 'dart:convert';

class MakerKindEntity {
  final List<MakerKindDto> list;

  MakerKindEntity({
    required this.list,
  });

  factory MakerKindEntity.fromRawJson(String str) => MakerKindEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MakerKindEntity.fromJson(Map<String, dynamic> json) => MakerKindEntity(
    list: List<MakerKindDto>.from(json["LIST"].map((x) => MakerKindDto.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "LIST": List<dynamic>.from(list.map((x) => x.toJson())),
  };
}

class MakerKindDto {
  final String mkName;
  final String mkIdx;
  MakerKindDto({
    required this.mkName,
    required this.mkIdx,
  });

  factory MakerKindDto.fromRawJson(String str) => MakerKindDto.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MakerKindDto.fromJson(Map<String, dynamic> json) => MakerKindDto(
      mkName: json["MK_name"],
      mkIdx: json["MK_idx"]
  );

  Map<String, dynamic> toJson() => {
    "MK_name": mkName,
    "MK_idx": mkIdx
  };
}