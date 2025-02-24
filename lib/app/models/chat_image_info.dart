import 'dart:convert';



class AuthBagicApiChat {
  AuthBagicApiChat({
    required this.status,
    required this.msg,
    required this.result,
  });

  int status;
  String msg;
  List<ChatImageInfo> result;

  factory AuthBagicApiChat.fromJson(Map<String, dynamic> json) => AuthBagicApiChat(
    status: json["status"] ?? 0,
    msg: json["msg"] ?? '',
    result: List<ChatImageInfo>.from(json["result"].map((x) => ChatImageInfo.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "result": List<dynamic>.from(result.map((x) => x.toJson())),
  };
}


ChatImageInfo chatImageInfoFromJson(String str) => ChatImageInfo.fromJson(json.decode(str));

String chatImageInfoToJson(ChatImageInfo data) => json.encode(data.toJson());

class ChatImageInfo {
  String imageUrl;
  int width;
  int height;
  String type;

  ChatImageInfo({
    required this.imageUrl,
    required this.width,
    required this.height,
    required this.type,
  });

  factory ChatImageInfo.fromJson(Map<String, dynamic> json) => ChatImageInfo(
    imageUrl: json["imageUrl"],
    width: json["width"],
    height: json["height"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "imageUrl": imageUrl,
    "width": width,
    "height": height,
    "type": type,
  };
}