List<HomeBannerVO> convertHomeBannerVO(List<dynamic> data) {
  return data.map((item) => HomeBannerVO.fromJson(item as Map<String, dynamic>)).toList();
}

class HomeBannerVO {
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

  HomeBannerVO({
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

  factory HomeBannerVO.fromJson(Map<String, dynamic> json) => HomeBannerVO(
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