// To parse this JSON data, do
//
//     final srcBanner = srcBannerFromJson(jsonString);

import 'dart:convert';

SrcBanner srcBannerFromJson(String str) => SrcBanner.fromJson(json.decode(str));

String srcBannerToJson(SrcBanner data) => json.encode(data.toJson());

class SrcBanner {
  int status;
  String msg;
  List<SrcBannerList> result;

  SrcBanner({
    required this.status,
    required this.msg,
    required this.result,
  });

  factory SrcBanner.fromJson(Map<String, dynamic> json) => SrcBanner(
    status: json["status"],
    msg: json["msg"],
    result: List<SrcBannerList>.from(json["result"].map((x) => SrcBannerList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "result": List<dynamic>.from(result.map((x) => x.toJson())),
  };
}

class SrcBannerList {
  int bmIdx;
  String bmOrder;
  String bmTitle;
  String bmCategory;
  String bmPathImg;
  String bmUrl;
  String bmImgPathImg;
  String bmNotice;
  String bmNoticePathImg;
  DateTime bmRegdate;

  SrcBannerList({
    required this.bmIdx,
    required this.bmOrder,
    required this.bmTitle,
    required this.bmCategory,
    required this.bmPathImg,
    required this.bmUrl,
    required this.bmImgPathImg,
    required this.bmNotice,
    required this.bmNoticePathImg,
    required this.bmRegdate,
  });

  factory SrcBannerList.fromJson(Map<String, dynamic> json) => SrcBannerList(
    bmIdx: json["BM_idx"] ?? 0,
    bmOrder: json["BM_order"] ?? '',
    bmTitle: json["BM_title"] ?? '',
    bmCategory: json["BM_category"] ?? '',
    bmPathImg: json["BM_path_img"] ?? '',
    bmUrl: json["BM_url"] ?? '',
    bmImgPathImg: json["BM_img_path_img"] ?? '',
    bmNotice: json["BM_notice"] ?? '',
    bmNoticePathImg: json["BM_notice_path_img"] ?? '',
    bmRegdate: DateTime.parse(json["BM_regdate"]),
  );

  Map<String, dynamic> toJson() => {
    "BM_idx": bmIdx,
    "BM_order": bmOrder,
    "BM_title": bmTitle,
    "BM_category": bmCategory,
    "BM_path_img": bmPathImg,
    "BM_url": bmUrl,
    "BM_img_path_img": bmImgPathImg,
    "BM_notice": bmNotice,
    "BM_notice_path_img": bmNoticePathImg,
    "BM_regdate": bmRegdate.toIso8601String(),
  };
}
