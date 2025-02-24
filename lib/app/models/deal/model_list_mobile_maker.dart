import 'dart:convert';

class ModeListMobileMaker {
  final List<ModeListMobileMakerList> list;

  ModeListMobileMaker({
    required this.list,
  });

  factory ModeListMobileMaker.fromRawJson(String str) => ModeListMobileMaker.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ModeListMobileMaker.fromJson(Map<String, dynamic> json) => ModeListMobileMaker(
    list: List<ModeListMobileMakerList>.from(json["LIST"].map((x) => ModeListMobileMakerList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "LIST": List<dynamic>.from(list.map((x) => x.toJson())),
  };
}

class ModeListMobileMakerList {
  final String mkName;
  final String mkIdx;
  ModeListMobileMakerList({
    required this.mkName,
    required this.mkIdx,
  });

  factory ModeListMobileMakerList.fromRawJson(String str) => ModeListMobileMakerList.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ModeListMobileMakerList.fromJson(Map<String, dynamic> json) => ModeListMobileMakerList(
    mkName: json["MK_name"],
    mkIdx: json["MK_idx"]
  );

  Map<String, dynamic> toJson() => {
    "MK_name": mkName,
    "MK_idx": mkIdx
  };
}