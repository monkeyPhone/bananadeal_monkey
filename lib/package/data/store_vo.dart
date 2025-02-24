List<StoreVO> convertStoreVO(List<dynamic> data) {
  return data.map((item) => StoreVO.fromJson(item as Map<String, dynamic>)).toList();
}

class StoreVO {
  const StoreVO({
    required this.smMId,
    required this.smIdx,
    required this.smStoreName,
    required this.smLatitude,
    required this.smLongitude,
    required this.smStoreIntroduce,
    required this.smRegdate,
    required this.smPathImg0,
    required this.inviteDeal,
    required this.sendDeal,
    required this.openDeal,
    required this.avgPoint,
    required this.reviewCnt,
    required this.favoriteStore,
    required this.smRange,
    required this.participation,
    required this.smConsultationTime,
    required this.smTimeStart,
    required this.smTimeEnd,
    this.ruBlock,
  });

  final String smMId;
  final int smIdx;
  final String smStoreName;
  final String smLatitude;
  final String smLongitude;
  final String smRegdate;
  final String smPathImg0;
  final String smStoreIntroduce;
  final int inviteDeal;
  final int sendDeal;
  final int openDeal;
  final String avgPoint;
  final String smConsultationTime;
  final String smTimeStart;
  final String smTimeEnd;
  final int reviewCnt;
  final int favoriteStore;
  final double smRange;
  final String participation;
  final String? ruBlock;

  factory StoreVO.fromJson(Map<String, dynamic> json) => StoreVO(
    smMId: json["SM_m_id"] ?? '',
    smIdx: json["SM_idx"] ?? 0,
    smStoreName: (json["SM_store_name"] != null && json["SM_store_name"] != '') ? json["SM_store_name"] : '알 수 없음',
    smLatitude: json["SM_latitude"] ?? '',
    smLongitude: json["SM_longitude"] ?? '',
    smStoreIntroduce: json["SM_store_introduce"] ?? '',
    smRegdate: json["SM_regdate"] ?? '',
    smPathImg0: json["SM_path_img0"] ?? '',
    smConsultationTime: json["SM_consultation_time"] ?? '',
    smTimeStart: json["SM_time_start"] ?? '',
    smTimeEnd: json["SM_time_end"] ?? '',
    inviteDeal: json["invite_deal"] ?? 0,
    sendDeal: json["send_deal"] ?? 0,
    openDeal: json["open_deal"] ?? 0,
    avgPoint: json["avg_point"] ?? '0.0',
    reviewCnt: json["review_cnt"] ?? 0,
    favoriteStore: json["favorite_store"] ?? 0,
    smRange: json["distance"] == null ? 0.0 :  double.parse(json["distance"].toString()),
    participation: json["participation"] ?? '0.00',
    ruBlock: json["RU_block"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "SM_m_id": smMId,
    "SM_idx": smIdx,
    "SM_store_name": smStoreName,
    "SM_latitude": smLatitude,
    "SM_longitude": smLongitude,
    "SM_store_introduce": smStoreIntroduce,
    "SM_regdate": smRegdate,
    "SM_consultation_time": smConsultationTime,
    "SM_time_start": smTimeStart,
    "SM_time_end": smTimeEnd,
    "SM_path_img0": smPathImg0,
    "invite_deal": inviteDeal,
    "send_deal": sendDeal,
    "open_deal": openDeal,
    "avg_point": avgPoint,
    "review_cnt": reviewCnt,
    "favorite_store": favoriteStore,
    "distance": smRange,
    "participation": participation,
    "RU_block" : ruBlock,
  };
}
