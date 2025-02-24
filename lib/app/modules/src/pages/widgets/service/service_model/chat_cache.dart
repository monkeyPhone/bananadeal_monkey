import 'dart:convert';
import 'chat_user_chat_list.dart';

ChatCache chatCacheFromJson(String str) => ChatCache.fromJson(json.decode(str));

String chatCacheToJson(ChatCache data) => json.encode(data.toJson());



class ChatCache {
  ChatCache({
    required this.data,
  });

  List<ChatLogList> data;

  factory ChatCache.fromJson(Map<String, dynamic> json) => ChatCache(
    data: List<ChatLogList>.from(json["DATA"].map((x) => ChatLogList.fromJson(x))),
  );
  ChatCache.fromMap(Map map)
      : data = List<ChatLogList>.from(map['DATA'].map((x) => x));

  Map<String, dynamic> toJson() => {
    "DATA": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

// factory ChatUserChatList.fromJson(Map<String, dynamic> json) => ChatUserChatList(
// result: json["result"],
// message: json["message"],
// data: List<ChatLogList>.from(json["DATA"].map((x) => ChatLogList.fromJson(x))),
// );
