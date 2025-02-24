import 'dart:convert';
import 'package:banana_deal_by_monkeycompany/package/api/chat_log/model/data/chat_log_dto.dart';

ChatLogEntity chatLogEntityFromJson(String str) => ChatLogEntity.fromJson(json.decode(str));

String chatLogEntityToJson(ChatLogEntity data) => json.encode(data.toJson());



class ChatLogEntity {
  ChatLogEntity({
    required this.data,
  });

  List<ChatLogDto> data;

  factory ChatLogEntity.fromJson(Map<String, dynamic> json) => ChatLogEntity(
    data: List<ChatLogDto>.from(json["DATA"].map((x) => ChatLogDto.fromJson(x))),
  );
  ChatLogEntity.fromMap(Map map)
      : data = List<ChatLogDto>.from(map['DATA'].map((x) => x));

  Map<String, dynamic> toJson() => {
    "DATA": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}