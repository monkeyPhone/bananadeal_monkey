import 'dart:convert';

NotiEntity notiEntityFromJson(String str) => NotiEntity.fromJson(json.decode(str));

String notiEntityToJson(NotiEntity data) => json.encode(data.toJson());


class NotiEntity {
  NotiEntity({
    required this.idx,
    required this.title,
    required this.msg,
    required this.profile,
    required this.type,
    required this.name,
    required this.time,
    required this.img,
    required this.send,
    required this.isRead,
  });

  final int idx;
  final String title;
  final String msg;
  final String profile;
  final String type;
  final String name;
  final String time;
  final String img;
  final String send;
  bool isRead;

  factory NotiEntity.fromJson(Map<String, dynamic> json) => NotiEntity(
    idx: json["idx"] ?? 0,
    title: json["title"] ?? '',
    msg: json["msg"] ?? '',
    profile: json["profile"] ?? '',
    type: json["type"] ?? '',
    name: json["name"] ?? '',
    time: json["time"] ?? '',
    img: json["img"] ?? '',
    send: json["send"] ?? '',
    isRead: json["isRead"] ?? false,
  );

  Map<String, dynamic> toJson() => {
    "idx": idx,
    "title": title,
    "msg": msg,
    "profile": profile,
    "type": type,
    "name": name,
    "time": time,
    "img": img,
    "send": send,
    "isRead" : isRead
  };

}