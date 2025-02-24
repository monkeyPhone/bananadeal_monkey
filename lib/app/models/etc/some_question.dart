// To parse this JSON data, do
//
//     final someQuestion = someQuestionFromJson(jsonString);

import 'dart:convert';

SomeQuestion someQuestionFromJson(String str) => SomeQuestion.fromJson(json.decode(str));

String someQuestionToJson(SomeQuestion data) => json.encode(data.toJson());

class SomeQuestion {
  int status;
  String msg;
  List<SomeQuestionList> result;

  SomeQuestion({
    required this.status,
    required this.msg,
    required this.result,
  });

  factory SomeQuestion.fromJson(Map<String, dynamic> json) => SomeQuestion(
    status: json["status"],
    msg: json["msg"],
    result: List<SomeQuestionList>.from(json["result"].map((x) => SomeQuestionList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "result": List<dynamic>.from(result.map((x) => x.toJson())),
  };
}

class SomeQuestionList {
  int bfqIdx;
  int bfqOrder;
  String bfqAsk;
  String bfqAnswer;
  String bfqPathImg1;
  String bfqPathImg2;
  String bfqPathImg3;
  String bfqUrl1;
  String bfqUrl2;
  DateTime bfqRegdate;

  SomeQuestionList({
    required this.bfqIdx,
    required this.bfqOrder,
    required this.bfqAsk,
    required this.bfqAnswer,
    required this.bfqPathImg1,
    required this.bfqPathImg2,
    required this.bfqPathImg3,
    required this.bfqUrl1,
    required this.bfqUrl2,
    required this.bfqRegdate,
  });

  factory SomeQuestionList.fromJson(Map<String, dynamic> json) => SomeQuestionList(
    bfqIdx: json["BFQ_idx"] ?? 0,
    bfqOrder: json["BFQ_order"] ?? 0,
    bfqAsk: json["BFQ_ask"] ?? '',
    bfqAnswer: json["BFQ_answer"] ?? '',
    bfqPathImg1: json["BFQ_path_img1"] ?? '',
    bfqPathImg2: json["BFQ_path_img2"] ?? '',
    bfqPathImg3: json["BFQ_path_img3"] ?? '',
    bfqUrl1: json["BFQ_url1"] ?? '',
    bfqUrl2: json["BFQ_url2"] ?? '',
    bfqRegdate: DateTime.parse(json["BFQ_regdate"]),
  );

  Map<String, dynamic> toJson() => {
    "BFQ_idx": bfqIdx,
    "BFQ_order": bfqOrder,
    "BFQ_ask": bfqAsk,
    "BFQ_answer": bfqAnswer,
    "BFQ_path_img1": bfqPathImg1,
    "BFQ_path_img2": bfqPathImg2,
    "BFQ_path_img3": bfqPathImg3,
    "BFQ_url1": bfqUrl1,
    "BFQ_url2": bfqUrl2,
    "BFQ_regdate": bfqRegdate.toIso8601String(),
  };
}
