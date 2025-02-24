// To parse this JSON data, do
//
//     final storeListInfo = storeListInfoFromJson(jsonString);

import 'dart:convert';

StoreListInfo storeListInfoFromJson(String str) => StoreListInfo.fromJson(json.decode(str));

String storeListInfoToJson(StoreListInfo data) => json.encode(data.toJson());

class StoreListInfo {
  StoreListInfo({
    required this.status,
    required this.msg,
    required this.result,
  });

  int status;
  String msg;
  List<Sinfo> result;

  factory StoreListInfo.fromJson(Map<String, dynamic> json) => StoreListInfo(
    status: json["status"],
    msg: json["msg"],
    result: List<Sinfo>.from(json["result"].map((x) => Sinfo.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "result": List<dynamic>.from(result.map((x) => x.toJson())),
  };
}

class Sinfo {
  Sinfo({
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
    this.ruBlock,
  });

  String smMId;
  int smIdx;
  String smStoreName;
  String smLatitude;
  String smLongitude;
  String smRegdate;
  String smPathImg0;
  String smStoreIntroduce;
  int inviteDeal;
  int sendDeal;
  int openDeal;
  String avgPoint;
  int reviewCnt;
  int favoriteStore;
  double smRange;
  String participation;
  String? ruBlock;

  factory Sinfo.fromJson(Map<String, dynamic> json) => Sinfo(
    smMId: json["SM_m_id"] ?? '',
    smIdx: json["SM_idx"] ?? 0,
    smStoreName: (json["SM_store_name"] != null && json["SM_store_name"] != '') ? json["SM_store_name"] : '알 수 없음',
    smLatitude: json["SM_latitude"] ?? '',
    smLongitude: json["SM_longitude"] ?? '',
    smStoreIntroduce: json["SM_store_introduce"] ?? '',
    smRegdate: json["SM_regdate"] ?? '',
    smPathImg0: json["SM_path_img0"] ?? '',
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
