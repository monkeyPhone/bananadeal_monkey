// To parse this JSON data, do
//
//     final chatUserRoomList = chatUserRoomListFromJson(jsonString);

import 'dart:convert';

ChatUserRoomList chatUserRoomListFromJson(String str) => ChatUserRoomList.fromJson(json.decode(str));

String chatUserRoomListToJson(ChatUserRoomList data) => json.encode(data.toJson());

class ChatUserRoomList {
  ChatUserRoomList({
    required this.status,
    required this.msg,
    required this.result,
  });

  int status;
  String msg;
  List<RoomList> result;

  factory ChatUserRoomList.fromJson(Map<String, dynamic> json) => ChatUserRoomList(
    status: json["status"],
    msg: json["msg"],
    result: List<RoomList>.from(json["result"].map((x) => RoomList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "result": List<dynamic>.from(result.map((x) => x.toJson())),
  };
}

class RoomList {
  RoomList({
    required this.crIdx,
    required this.smMId,
    required this.smIsShow,
    required this.crStatus,
    required this.smStoreName,
    required this.smTel,
    required this.smAddress,
    required this.smPathImg0,
    required this.lastMessage,
    required this.lastMessageTime,
    required this.cIsRead,
    required this.isDealing,
    required this.smToken,
    required this.smLatitude,
    required this.smLongitude,
  });

  int crIdx;
  String smMId;
  String smIsShow;
  String crStatus;
  String smStoreName;
  String smTel;
  String smAddress;
  String smPathImg0;
  String lastMessage;
  String lastMessageTime;
  int cIsRead;
  int isDealing;
  String smToken;
  String smLatitude;
  String smLongitude;

  factory RoomList.fromJson(Map<String, dynamic> json) => RoomList(
    crIdx: json["CR_idx"] ?? 0,
    smMId: json["SM_m_id"] ?? '',
    smIsShow: json["SM_isShow"] ?? '',
    crStatus: json["CR_status"] ?? '',
    smStoreName: json["SM_store_name"] ?? '알 수 없음',
    smTel: json["SM_tel"] ?? '',
    smAddress: json["SM_address"] ?? '',
    smPathImg0: json["SM_path_img0"] ?? '',
    lastMessage: json["last_message"] ?? '',
    lastMessageTime: json["last_message_time"] ?? '',
    cIsRead: json["C_isRead"] ?? 0,
    isDealing: json["is_dealing"] ?? 0,
    smToken: json["SM_token"] ?? '',
    smLatitude: json["SM_latitude"] ?? '',
    smLongitude: json["SM_longitude"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "CR_idx": crIdx,
    "SM_m_id": smMId,
    "SM_isShow": smIsShow,
    "SM_store_name": smStoreName,
    "SM_tel": smTel,
    "SM_address": smAddress,
    "SM_path_img0": smPathImg0,
    "last_message": lastMessage,
    "last_message_time": lastMessageTime,
    "C_isRead": cIsRead,
    "is_dealing": isDealing,
    "SM_token": smToken,
    "SM_latitude": smLatitude,
    "SM_longitude": smLongitude
  };
}
