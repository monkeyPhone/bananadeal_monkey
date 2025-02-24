// To parse this JSON data, do
//
//     final inQuestion = inQuestionFromJson(jsonString);

import 'dart:convert';

InQuestion inQuestionFromJson(String str) => InQuestion.fromJson(json.decode(str));

String inQuestionToJson(InQuestion data) => json.encode(data.toJson());

class InQuestion {
  int status;
  String msg;
  List<QuestionList> result;

  InQuestion({
    required this.status,
    required this.msg,
    required this.result,
  });

  factory InQuestion.fromJson(Map<String, dynamic> json) => InQuestion(
    status: json["status"],
    msg: json["msg"],
    result: List<QuestionList>.from(json["result"].map((x) => QuestionList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "result": List<dynamic>.from(result.map((x) => x.toJson())),
  };
}

class QuestionList {
  int miIdx;
  int miMIdx;
  String miName;
  String miTitle;
  String miContent;
  String miQPathImg1;
  String miQPathImg2;
  String miQPathImg3;
  String miQRegdate;
  String miStatus;
  String miComment;
  String miAPathImg1;
  String miAPathImg2;
  String miAPathImg3;
  String miMemo;
  String miManager;
  String miARegdate;

  QuestionList({
    required this.miIdx,
    required this.miMIdx,
    required this.miName,
    required this.miTitle,
    required this.miContent,
    required this.miQPathImg1,
    required this.miQPathImg2,
    required this.miQPathImg3,
    required this.miQRegdate,
    required this.miStatus,
    required this.miComment,
    required this.miAPathImg1,
    required this.miAPathImg2,
    required this.miAPathImg3,
    required this.miMemo,
    required this.miManager,
    required this.miARegdate,
  });

  factory QuestionList.fromJson(Map<String, dynamic> json) => QuestionList(
    miIdx: json["MI_idx"] ?? 0,
    miMIdx: json["MI_m_idx"] ?? 0,
    miName: json["MI_name"] ?? '',
    miTitle: json["MI_title"] ?? '',
    miContent: json["MI_content"] ?? '',
    miQPathImg1: json["MI_q_path_img1"] ?? '',
    miQPathImg2: json["MI_q_path_img2"] ?? '',
    miQPathImg3: json["MI_q_path_img3"] ?? '',
    miQRegdate: json["MI_q_regdate"],
    miStatus: json["MI_status"] ?? '',
    miComment: json["MI_comment"] ?? '',
    miAPathImg1: json["MI_a_path_img1"] ?? '',
    miAPathImg2: json["MI_a_path_img2"] ?? '',
    miAPathImg3: json["MI_a_path_img3"] ?? '',
    miMemo: json["MI_memo"] ?? '',
    miManager: json["MI_manager"] ?? '',
    miARegdate: json["MI_a_regdate"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "MI_idx": miIdx,
    "MI_m_idx": miMIdx,
    "MI_name": miName,
    "MI_title": miTitle,
    "MI_content": miContent,
    "MI_q_path_img1": miQPathImg1,
    "MI_q_path_img2": miQPathImg2,
    "MI_q_path_img3": miQPathImg3,
    "MI_q_regdate": miQRegdate,
    "MI_status": miStatus,
    "MI_comment": miComment,
    "MI_a_path_img1": miAPathImg1,
    "MI_a_path_img2": miAPathImg2,
    "MI_a_path_img3": miAPathImg3,
    "MI_memo": miMemo,
    "MI_manager": miManager,
    "MI_a_regdate": miARegdate,
  };
}
