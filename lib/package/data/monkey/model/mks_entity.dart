import 'dart:convert';

MksEntity mksEntityFromJson(String str) => MksEntity.fromJson(json.decode(str));

String mksEntityToJson(MksEntity data) => json.encode(data.toJson());

class MksEntity {
  String result;
  MksDto list;

  MksEntity({
    required this.result,
    required this.list,
  });

  factory MksEntity.fromJson(Map<String, dynamic> json) => MksEntity(
    result: json["result"],
    list: MksDto.fromJson(json["LIST"]),
  );

  Map<String, dynamic> toJson() => {
    "result": result,
    "LIST": list.toJson(),
  };
}

class MksDto {
  String mksIdx;
  String mksName;
  String mksOrder;
  String mksImgPath;

  MksDto({
    required this.mksIdx,
    required this.mksName,
    required this.mksOrder,
    required this.mksImgPath,
  });

  factory MksDto.fromJson(Map<String, dynamic> json) => MksDto(
    mksIdx: json["MKS_idx"] ?? '',
    mksName: json["MKS_name"] ?? '',
    mksOrder: json["MKS_order"] ?? '',
    mksImgPath: json["MKS_img_path"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "MKS_idx": mksIdx,
    "MKS_name": mksName,
    "MKS_order": mksOrder,
    "MKS_img_path": mksImgPath,
  };
}
