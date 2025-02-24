import 'dart:convert';

SrcPopup srcPopupFromJson(String str) => SrcPopup.fromJson(json.decode(str));

String srcPopupToJson(SrcPopup data) => json.encode(data.toJson());

class SrcPopup {
  int status;
  String msg;
  List<SrcPopupList> result;

  SrcPopup({
    required this.status,
    required this.msg,
    required this.result,
  });

  factory SrcPopup.fromJson(Map<String, dynamic> json) => SrcPopup(
    status: json["status"],
    msg: json["msg"],
    result: List<SrcPopupList>.from(json["result"].map((x) => SrcPopupList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "result": List<dynamic>.from(result.map((x) => x.toJson())),
  };
}

class SrcPopupList {
  int pmIdx;
  int pmOrder;
  String pmTitle;
  String pmCategory;
  String pmUrl;
  String pmEvent;
  String pmNotice;
  String pmPathImg;
  String pmImgPathImg;
  DateTime pmRegdate;

  SrcPopupList({
    required this.pmIdx,
    required this.pmOrder,
    required this.pmTitle,
    required this.pmCategory,
    required this.pmUrl,
    required this.pmEvent,
    required this.pmNotice,
    required this.pmPathImg,
    required this.pmImgPathImg,
    required this.pmRegdate,
  });

  factory SrcPopupList.fromJson(Map<String, dynamic> json) => SrcPopupList(
    pmIdx: json["PM_idx"] ?? 0,
    pmOrder: json["PM_order"] ?? 0,
    pmTitle: json["PM_title"] ?? '',
    pmCategory: json["PM_category"] ?? '',
    pmUrl: json["PM_url"] ?? '',
    pmEvent: json["PM_event"] ?? '',
    pmNotice: json["PM_notice"] ?? '',
    pmPathImg: json["PM_path_img"] ?? '',
    pmImgPathImg: json["PM_img_path_img"] ?? '',
    pmRegdate: DateTime.parse(json["PM_regdate"] ?? DateTime(0)),
  );

  Map<String, dynamic> toJson() => {
    "PM_idx": pmIdx,
    "PM_order": pmOrder,
    "PM_title": pmTitle,
    "PM_category": pmCategory,
    "PM_url": pmUrl,
    "PM_event": pmEvent,
    "PM_notice": pmNotice,
    "PM_path_img": pmPathImg,
    "PM_img_path_img": pmImgPathImg,
    "PM_regdate": pmRegdate.toIso8601String(),
  };
}
