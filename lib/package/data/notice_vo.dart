List<NoticeVO> convertNoticeVO(List<dynamic> data) {
  return data.map((item) => NoticeVO.fromJson(item as Map<String, dynamic>)).toList();
}

class NoticeVO {
  int bnIdx;
  String bnUser;
  int bnOrder;
  String bnTitle;
  String bnContent;
  String bnContent2;
  String bnPathImg;
  DateTime bnRegdate;

  NoticeVO({
    required this.bnIdx,
    required this.bnUser,
    required this.bnOrder,
    required this.bnTitle,
    required this.bnContent,
    required this.bnContent2,
    required this.bnPathImg,
    required this.bnRegdate,
  });

  factory NoticeVO.fromJson(Map<String, dynamic> json) => NoticeVO(
    bnIdx: json["BN_idx"] ?? 0,
    bnUser: json["BN_user"] ?? '',
    bnOrder: json["BN_order"] ?? 0,
    bnTitle: json["BN_title"] ?? '',
    bnContent: json["BN_content"] ?? '',
    bnContent2: json["BN_content2"] ?? '',
    bnPathImg: json["BN_path_img"] ?? '',
    bnRegdate: DateTime.parse(json["BN_regdate"]),
  );

  Map<String, dynamic> toJson() => {
    "BN_idx": bnIdx,
    "BN_user": bnUser,
    "BN_order": bnOrder,
    "BN_title": bnTitle,
    "BN_content": bnContent,
    "BN_content2": bnContent2,
    "BN_path_img": bnPathImg,
    "BN_regdate": bnRegdate.toIso8601String(),
  };
}
