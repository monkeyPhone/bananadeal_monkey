import 'dart:convert';

List<IntroImageVO> introImageVOFromJson(String str) => List<IntroImageVO>.from(json.decode(str).map((x) => IntroImageVO.fromJson(x)));

String introImageVOToJson(List<IntroImageVO> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

List<IntroImageVO> convertIntroImageVO(List<dynamic> data) {
  return data.map((item) => IntroImageVO.fromJson(item as Map<String, dynamic>)).toList();
}

class IntroImageVO {
  IntroImageVO({
    required this.aiiIdx,
    required this.aiiOrder,
    required this.aiiPathImg,
    required this.aiiRegdate,
  });

  int aiiIdx;
  int aiiOrder;
  String aiiPathImg;
  DateTime aiiRegdate;

  factory IntroImageVO.fromJson(Map<String, dynamic> json) => IntroImageVO(
    aiiIdx: json["AII_idx"] ?? 0,
    aiiOrder: json["AII_order"] ?? 0,
    aiiPathImg: json["AII_path_img"] ?? '',
    aiiRegdate: DateTime.parse(json["AII_regdate"]),
  );

  Map<String, dynamic> toJson() => {
    "AII_idx": aiiIdx,
    "AII_order": aiiOrder,
    "AII_path_img": aiiPathImg,
    "AII_regdate": aiiRegdate.toIso8601String(),
  };
}