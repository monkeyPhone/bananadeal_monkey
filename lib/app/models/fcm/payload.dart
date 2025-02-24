import 'dart:convert';

NotiPayLoad notiPayLoadFromJson(String str) => NotiPayLoad.fromJson(json.decode(str));

String notiPayLoadToJson(NotiPayLoad data) => json.encode(data.toJson());


class NotiPayLoad {
  NotiPayLoad({
    required this.idx,
    required this.title,
    required this.msg,
    required this.profile,
    required this.type,
    required this.name,
    required this.time,
    required this.img,
    required this.send,
  });

  int idx;
  String title;
  String msg;
  String profile;
  String type;
  String name;
  String time;
  String img;
  String send;

  factory NotiPayLoad.fromJson(Map<String, dynamic> json) => NotiPayLoad(
    idx: json["idx"] ?? 0,
    title: json["title"] ?? '',
    msg: json["msg"] ?? '',
    profile: json["profile"] ?? '',
    type: json["type"] ?? '',
    name: json["name"] ?? '',
    time: json["time"] ?? '',
    img: json["img"] ?? '',
    send: json["send"] ?? ''
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
    "send": send
  };

}