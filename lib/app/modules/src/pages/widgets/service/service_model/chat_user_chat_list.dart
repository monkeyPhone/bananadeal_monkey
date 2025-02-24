// To parse this JSON data, do
//
//     final chatUserChatList = chatUserChatListFromJson(jsonString);

import 'dart:convert';

ChatUserChatList chatUserChatListFromJson(String str) => ChatUserChatList.fromJson(json.decode(str));

String chatUserChatListToJson(ChatUserChatList data) => json.encode(data.toJson());

class ChatUserChatList {
  ChatUserChatList({
    required this.status,
    required this.msg,
    required this.result,
  });

  int status;
  String msg;
  List<ChatLogList> result;

  factory ChatUserChatList.fromJson(Map<String, dynamic> json) => ChatUserChatList(
    status: json["status"],
    msg: json["msg"],
    result: List<ChatLogList>.from(json["result"].map((x) => ChatLogList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "result": List<dynamic>.from(result.map((x) => x.toJson())),
  };
}

class ChatLogList {
  ChatLogList({
    required this.cIdx,
    required this.cRoomIdx,
    required this.cMessage,
    required this.cType,
    required this.cIsRead,
    required this.cRegdate,
  });

  int cIdx;
  int cRoomIdx;
  String cMessage;
  String cType;
  String cIsRead;
  String cRegdate;

  factory ChatLogList.fromJson(Map<String, dynamic> json) => ChatLogList(
    cIdx: json["C_idx"] ?? 0,
    cRoomIdx: json["C_room_idx"] ?? 0,
    cMessage: json["C_message"] ?? '',
    cType: json["C_type"] ?? '',
    cIsRead: json["C_isRead"] ?? '',
    cRegdate: json["C_regdate"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "C_idx": cIdx,
    "C_room_idx": cRoomIdx,
    "C_message": cMessage,
    "C_type": cType,
    "C_isRead": cIsRead,
    "C_regdate": cRegdate,
  };
}
