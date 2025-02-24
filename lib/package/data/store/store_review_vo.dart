import 'package:banana_deal_by_monkeycompany/package/data/store/json_bool.dart';

List<StoreReviewVO> convertStoreReviewVO(List<dynamic> data) {
  return data.map((item) => StoreReviewVO.fromJson(item as Map<String, dynamic>)).toList();
}



final class StoreReviewVO {
  final String mName;
  final int ruIdx;
  final int ruUserIdx;
  final int ruPoint;
  final String ruContent;
  final String ruPathImg1;
  final String ruPathImg2;
  final String ruPathImg3;
  final DateTime ruRegdate;
  final String? raAnswer;
  final JsonBool ruActivate;
  final JsonBool ruBlock;
  final JsonBool ruDeclaration;
  final JsonBool ruDeclarationAnswer;
  final String visible;
  final String bruTitle;

  const StoreReviewVO({
    required this.mName,
    required this.ruIdx,
    required this.ruUserIdx,
    required this.ruPoint,
    required this.ruContent,
    required this.ruPathImg1,
    required this.ruPathImg2,
    required this.ruPathImg3,
    required this.ruRegdate,
    this.raAnswer,
    required this.ruActivate,
    required this.ruBlock,
    required this.ruDeclaration,
    required this.ruDeclarationAnswer,
    required this.visible,
    required this.bruTitle,
  });

  factory StoreReviewVO.fromJson(Map<String, dynamic> json) => StoreReviewVO(
      mName: json["M_name"] ?? '익명',
      ruIdx: json["RU_idx"],
      ruUserIdx: json["RU_user_idx"],
      ruPoint: json["RU_point"],
      ruContent: json["RU_content"],
      ruPathImg1: json["RU_path_img1"],
      ruPathImg2: json["RU_path_img2"],
      ruPathImg3: json["RU_path_img3"],
      ruRegdate: DateTime.parse(json["RU_regdate"]),
      raAnswer: json["RA_answer"],
      ruActivate: JsonBoolExtension.fromJson(json["RU_activate"]),
      ruBlock: JsonBoolExtension.fromJson(json["RU_block"]),
      ruDeclaration: JsonBoolExtension.fromJson(json["RU_declaration"]),
      ruDeclarationAnswer: JsonBoolExtension.fromJson(json["RU_declaration_answer"]) ,
      visible: json['visible'] ?? 'N',
      bruTitle: json['BRU_title'] ?? ''
  );

  Map<String, dynamic> toJson() => {
    "M_name": mName,
    "RU_idx": ruIdx,
    "RU_user_idx": ruUserIdx,
    "RU_point": ruPoint,
    "RU_content": ruContent,
    "RU_path_img1": ruPathImg1,
    "RU_path_img2": ruPathImg2,
    "RU_path_img3": ruPathImg3,
    "RU_regdate": ruRegdate.toIso8601String(),
    "RA_answer": raAnswer,
    "RU_activate": ruActivate,
    "RU_block" : ruBlock,
    "RU_declaration" : ruDeclaration,
    "visible": visible,
    "BRU_title" : bruTitle
  };
}