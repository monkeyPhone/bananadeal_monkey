// To parse this JSON data, do
//
//     final guestStoreDetail = guestStoreDetailFromJson(jsonString);

import 'dart:convert';

GuestStoreDetail guestStoreDetailFromJson(String str) => GuestStoreDetail.fromJson(json.decode(str));

String guestStoreDetailToJson(GuestStoreDetail data) => json.encode(data.toJson());

class GuestStoreDetail {
  int status;
  String msg;
  List<GuestStoreDetailList> result;

  GuestStoreDetail({
    required this.status,
    required this.msg,
    required this.result,
  });

  factory GuestStoreDetail.fromJson(Map<String, dynamic> json) => GuestStoreDetail(
    status: json["status"],
    msg: json["msg"],
    result: List<GuestStoreDetailList>.from(json["result"].map((x) => GuestStoreDetailList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "result": List<dynamic>.from(result.map((x) => x.toJson())),
  };
}

class GuestStoreDetailList {
  String smMId;
  String smStoreName;
  String smAddress;
  String smTel;
  String smCity;
  String smCity2;
  String smCity3;
  String smPathImg0;
  String smPathImg1;
  String smPathImg2;
  String smPathImg3;
  String smPathImg4;
  String smPathImg5;
  String smLatitude;
  String smLongitude;
  String smStoreIntroduce;
  String smConsultationTime;
  String smTimeStart;
  String smTimeEnd;
  String smEvent1;
  String smEvent2;
  String smEvent3;
  String smIconEvent1;
  String smIconEvent2;
  String smIconEvent3;
  DateTime smRegdate;

  GuestStoreDetailList({
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
    required this.smLatitude,
    required this.smLongitude,
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
    required this.smRegdate,
  });

  factory GuestStoreDetailList.fromJson(Map<String, dynamic> json) => GuestStoreDetailList(
    smMId: json["SM_m_id"],
    smStoreName: json["SM_store_name"],
    smAddress: json["SM_address"],
    smTel: json["SM_tel"],
    smCity: json["SM_city"],
    smCity2: json["SM_city2"],
    smCity3: json["SM_city3"],
    smPathImg0: json["SM_path_img0"],
    smPathImg1: json["SM_path_img1"],
    smPathImg2: json["SM_path_img2"],
    smPathImg3: json["SM_path_img3"],
    smPathImg4: json["SM_path_img4"],
    smPathImg5: json["SM_path_img5"],
    smLatitude: json["SM_latitude"],
    smLongitude: json["SM_longitude"],
    smStoreIntroduce: json["SM_store_introduce"],
    smConsultationTime: json["SM_consultation_time"],
    smTimeStart: json["SM_time_start"],
    smTimeEnd: json["SM_time_end"],
    smEvent1: json["SM_event1"],
    smEvent2: json["SM_event2"],
    smEvent3: json["SM_event3"],
    smIconEvent1: json["SM_icon_event1"],
    smIconEvent2: json["SM_icon_event2"],
    smIconEvent3: json["SM_icon_event3"],
    smRegdate: DateTime.parse(json["SM_regdate"]),
  );

  Map<String, dynamic> toJson() => {
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
    "SM_latitude": smLatitude,
    "SM_longitude": smLongitude,
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
    "SM_regdate": smRegdate.toIso8601String(),
  };
}
