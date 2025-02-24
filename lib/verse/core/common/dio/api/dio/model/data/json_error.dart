import 'dart:convert';

JsonError jsonErrorFromJson(String str) => JsonError.fromJson(json.decode(str));

String jsonErrorToJson(JsonError data) => json.encode(data.toJson());


class JsonError {
  const JsonError({
    required this.apiUrl,
    required this.status,
    required this.apiLocation,
    required this.dioExceptionType,
  });

  final int status;
  final String apiLocation;
  final String apiUrl;
  final String dioExceptionType;

  factory JsonError.fromJson(Map<String, dynamic> json) {
    String apiUrl = json["apiUrl"] ?? '';
    int status = json["status"] ?? 0;
    String apiLocation = json["apiLocation"] ?? '';
    String  dioExceptionType = json["dioExceptionType"] ?? '';



    return JsonError(
      apiUrl: apiUrl,
      status: status,
      apiLocation: apiLocation,
      dioExceptionType: dioExceptionType,
    );
  }

  Map<String, dynamic> toJson() => {
    "apiUrl": apiUrl,
    "status": status,
    "dioExceptionType": dioExceptionType,
  };
}