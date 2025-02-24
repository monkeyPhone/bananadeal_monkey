// To parse this JSON data, do
//
//     final modelListPhoneSpec = modelListPhoneSpecFromJson(jsonString);

import 'dart:convert';

ModelListPhoneSpec modelListPhoneSpecFromJson(String str) => ModelListPhoneSpec.fromJson(json.decode(str));

String modelListPhoneSpecToJson(ModelListPhoneSpec data) => json.encode(data.toJson());

class ModelListPhoneSpec {
  ModelListPhoneSpec({
    required this.list,
  });

  List<ModelListPhoneSpecList> list;

  factory ModelListPhoneSpec.fromJson(Map<String, dynamic> json) => ModelListPhoneSpec(
    list: List<ModelListPhoneSpecList>.from(json["LIST"].map((x) => ModelListPhoneSpecList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "LIST": List<dynamic>.from(list.map((x) => x.toJson())
    ),
  };
}

class ModelListPhoneSpecList {
  ModelListPhoneSpecList({
    required this.psIdx,
    required this.psName,
    required this.psModel,
    required this.psKeyword,
    required this.piPath,
    required this.psReleaseDate,
  });

  String psIdx;
  String psName;
  String psModel;
  List<String> psKeyword;
  String piPath; // TODO:// 딜 이미지 넣기 위해서 넣은 키워드 수정 금지....
  DateTime psReleaseDate;

  factory ModelListPhoneSpecList.fromJson(Map<String, dynamic> json) => ModelListPhoneSpecList(
    psIdx: json["PS_idx"] ?? '',
    psName: json["PS_name"] ?? '',
    psModel: json["PS_model"] ?? '',
    psKeyword: List<String>.from(json["PS_keyword"].map((x) => x)),
    piPath: json["PI_path"] ?? '',
    psReleaseDate: DateTime.parse(json["PS_release_date"] ?? 0)
  );

  Map<String, dynamic> toJson() => {
    "PS_idx": psIdx,
    "PS_name": psName,
    "PS_model": psModel,
    "PS_keyword": List<dynamic>.from(psKeyword.map((x) => x)),
    "PI_path": piPath,
    "PS_release_date": psReleaseDate.toIso8601String()
  };
}
