import 'dart:convert';

List<ChatImageDto> convertChatImageDto(List<dynamic> data) {
  return data.map((item) => ChatImageDto.fromJson(item as Map<String, dynamic>)).toList();
}

ChatImageDto chatImageDtoFromJson(String str) => ChatImageDto.fromJson(json.decode(str));

String chatImageDtoToJson(ChatImageDto data) => json.encode(data.toJson());

class ChatImageDto {
  String imageUrl;
  int width;
  int height;
  String type;

  ChatImageDto({
    required this.imageUrl,
    required this.width,
    required this.height,
    required this.type,
  });

  factory ChatImageDto.fromJson(Map<String, dynamic> json) => ChatImageDto(
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