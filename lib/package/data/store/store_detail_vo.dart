import 'package:banana_deal_by_monkeycompany/package/data/store/json_bool.dart';
import 'package:banana_deal_by_monkeycompany/package/data/store/store_review_vo.dart';

List<StoreDetailVO> convertStoreDetailVO(List<dynamic> data) {
  return data.map((item) => StoreDetailVO.fromJson(item as Map<String, dynamic>)).toList();
}

final class StoreDetailVO {
  const StoreDetailVO({
    required this.smIdx,
    required this.smMId,
    required this.smStoreName,
    required this.smAddress,
    required this.smTel,
    required this.smCity,
    required this.smCity2,
    required this.smCity3,
    required this.smPathImg0,
    required this.smPathImg1,
    required this.smPathImg2,
    required this.smPathImg3,
    required this.smPathImg4,
    required this.smPathImg5,
    required this.smStoreIntroduce,
    required this.smConsultationTime,
    required this.smTimeStart,
    required this.smTimeEnd,
    required this.smEvent1,
    required this.smEvent2,
    required this.smEvent3,
    required this.smIconEvent1,
    required this.smIconEvent2,
    required this.smIconEvent3,
    required this.smMessage,
    required this.smLatitude,
    required this.smLongitude,
    required this.smRegdate,
    required this.dealYN,
    required this.avgPoint,
    required this.reviewCnt,
    required this.favoriteStore,
    required this.isDealing,
    required this.isDeclaration,
    required this.reviewList,
  });
  final int smIdx;
  final String smMId;
  final String smStoreName;
  final String smAddress;
  final String smTel;
  final String smCity;
  final String smCity2;
  final String smCity3;
  final String smPathImg0;
  final String smPathImg1;
  final String smPathImg2;
  final String smPathImg3;
  final String smPathImg4;
  final String smPathImg5;
  final String smStoreIntroduce;
  final String smConsultationTime;
  final String smTimeStart;
  final String smTimeEnd;
  final String smEvent1;
  final String smEvent2;
  final String smEvent3;
  final String smIconEvent1;
  final String smIconEvent2;
  final String smIconEvent3;
  final String smMessage;
  final String smLatitude;
  final String smLongitude;
  final String smRegdate;
  final int dealYN;
  final String avgPoint;
  final int reviewCnt;
  final int favoriteStore;
  final int isDealing;
  final JsonBool isDeclaration;
  final List<StoreReviewVO> reviewList;


  factory StoreDetailVO.fromJson(Map<String, dynamic> json) => StoreDetailVO(
    smIdx: json["SM_idx"] ?? 0,
    smMId: json["SM_m_id"] ?? '',
    smStoreName: (json["SM_store_name"] != null && json["SM_store_name"] != '') ? json["SM_store_name"] : '알 수 없음',
    smAddress: json["SM_address"] ?? '',
    smTel: json["SM_tel"] ?? '',
    smCity: json["SM_city"] ?? '',
    smCity2: json["SM_city2"] ?? '',
    smCity3: json["SM_city3"] ?? '',
    smPathImg0: json["SM_path_img0"] ?? '',
    smPathImg1: json["SM_path_img1"] ?? '',
    smPathImg2: json["SM_path_img2"] ?? '',
    smPathImg3: json["SM_path_img3"] ?? '',
    smPathImg4: json["SM_path_img4"] ?? '',
    smPathImg5: json["SM_path_img5"] ?? '',
    smStoreIntroduce: json["SM_store_introduce"] ?? '',
    smConsultationTime: json["SM_consultation_time"] ?? '',
    smTimeStart: json["SM_time_start"] ?? '',
    smTimeEnd: json["SM_time_end"] ?? '',
    smEvent1: json["SM_event1"] ?? '',
    smEvent2: json["SM_event2"] ?? '',
    smEvent3: json["SM_event3"] ?? '',
    smIconEvent1: json["SM_icon_event1"] ?? '',
    smIconEvent2: json["SM_icon_event2"] ?? '',
    smIconEvent3: json["SM_icon_event3"] ?? '',
    smMessage: json["SM_message"] ?? '',
    smLatitude: json["SM_latitude"] ?? '',
    smLongitude: json["SM_longitude"] ?? '',
    smRegdate: json["SM_regdate"] ?? '',
    dealYN: json["dealYN"] ?? 0,
    avgPoint: json["avg_point"] ?? '0.0',
    reviewCnt: json["review_cnt"] ?? 0,
    favoriteStore: json["favorite_store"] ?? 0,
    isDealing: json["is_dealing"] ?? 0,
    isDeclaration: JsonBoolExtension.fromJson(json["isDeclaration"]),
    reviewList : List<StoreReviewVO>.from(json["reviewList"].map((x) => StoreReviewVO.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "SM_idx" : smIdx,
    "SM_m_id": smMId,
    "SM_store_name": smStoreName,
    "SM_address": smAddress,
    "SM_tel": smTel,
    "SM_city": smCity,
    "SM_city2": smCity2,
    "SM_city3": smCity3,
    "SM_path_img0": smPathImg0,
    "SM_path_img1": smPathImg1,
    "SM_path_img2": smPathImg2,
    "SM_path_img3": smPathImg3,
    "SM_path_img4": smPathImg4,
    "SM_path_img5": smPathImg5,
    "SM_store_introduce": smStoreIntroduce,
    "SM_consultation_time": smConsultationTime,
    "SM_time_start": smTimeStart,
    "SM_time_end": smTimeEnd,
    "SM_event1": smEvent1,
    "SM_event2": smEvent2,
    "SM_event3": smEvent3,
    "SM_icon_event1": smIconEvent1,
    "SM_icon_event2": smIconEvent2,
    "SM_icon_event3": smIconEvent3,
    "SM_message": smMessage,
    "SM_latitude": smLatitude,
    "SM_longitude": smLongitude,
    "SM_regdate": smRegdate,
    "dealYN": dealYN,
    "avg_point": avgPoint,
    "review_cnt": reviewCnt,
    "favorite_store": favoriteStore,
    "is_dealing": isDealing,
    "isDeclaration": isDeclaration.toJson(),
    "reviewList": List<dynamic>.from(reviewList.map((x) => x.toJson())),
  };
}