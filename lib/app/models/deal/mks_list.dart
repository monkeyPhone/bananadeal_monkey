// To parse this JSON data, do
//
//     final mksElement = mksElementFromJson(jsonString);

import 'dart:convert';

MksElement mksElementFromJson(String str) => MksElement.fromJson(json.decode(str));

String mksElementToJson(MksElement data) => json.encode(data.toJson());

class MksElement {
  String result;
  MksList list;

  MksElement({
    required this.result,
    required this.list,
  });

  factory MksElement.fromJson(Map<String, dynamic> json) => MksElement(
    result: json["result"],
    list: MksList.fromJson(json["LIST"]),
  );

  Map<String, dynamic> toJson() => {
    "result": result,
    "LIST": list.toJson(),
  };
}

class MksList {
  String mksIdx;
  String mksName;
  String mksOrder;
  String mksImgPath;

  MksList({
    required this.mksIdx,
    required this.mksName,
    required this.mksOrder,
    required this.mksImgPath,
  });

  factory MksList.fromJson(Map<String, dynamic> json) => MksList(
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
