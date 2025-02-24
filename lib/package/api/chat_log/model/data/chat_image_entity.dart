import 'package:banana_deal_by_monkeycompany/package/api/chat_log/model/data/chat_image_dto.dart';

class ChatImageEntity {
  ChatImageEntity({
    required this.status,
    required this.msg,
    required this.result,
  });

  int status;
  String msg;
  List<ChatImageDto> result;

  factory ChatImageEntity.fromJson(Map<String, dynamic> json) => ChatImageEntity(
    status: json["status"] ?? 0,
    msg: json["msg"] ?? '',
    result: List<ChatImageDto>.from(json["result"].map((x) => ChatImageDto.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "result": List<dynamic>.from(result.map((x) => x.toJson())),
  };
}