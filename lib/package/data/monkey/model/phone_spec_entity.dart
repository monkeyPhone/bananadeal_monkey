import 'dart:convert';

PhoneSpecEntity phoneSpecEntityFromJson(String str) => PhoneSpecEntity.fromJson(json.decode(str));

String phoneSpecEntityToJson(PhoneSpecEntity data) => json.encode(data.toJson());

class PhoneSpecEntity {
  PhoneSpecEntity({
    required this.list,
  });

  List<PhoneSpecDto> list;

  factory PhoneSpecEntity.fromJson(Map<String, dynamic> json) => PhoneSpecEntity(
    list: List<PhoneSpecDto>.from(json["LIST"].map((x) => PhoneSpecDto.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "LIST": List<dynamic>.from(list.map((x) => x.toJson())
    ),
  };
}

class PhoneSpecDto {
  PhoneSpecDto({
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

  factory PhoneSpecDto.fromJson(Map<String, dynamic> json) => PhoneSpecDto(
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
