// To parse this JSON data, do
//
//     final checkmessage = checkmessageFromJson(jsonString);

import 'dart:convert';

ImageMessage imageMessageFromJson(String str) => ImageMessage.fromJson(json.decode(str));

String imageMessageToJson(ImageMessage data) => json.encode(data.toJson());

class ImageMessage {
  ImageMessage({
    required this.result,
    required this.message,
  });

  String result;
  String message;

  factory ImageMessage.fromJson(Map<String, dynamic> json) => ImageMessage(
    result: json["result"] ?? '',
    message: json["message"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "result": result,
    "message": message,
  };
}