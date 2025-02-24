import 'dart:convert';

JsonData jsonDataFromJson(String str) => JsonData.fromJson(json.decode(str));

String jsonDataToJson(JsonData data) => json.encode(data.toJson());

class JsonData {
  const JsonData({
    required this.status,
    required this.msg,
    required this.result,
  });

  final int status;
  final String msg;
  final List<dynamic> result;

  factory JsonData.fromJson(Map<String, dynamic> json) {
    int status = json["status"] ?? 0;
    String msg = json["msg"] ?? '';
    List<dynamic> result = [];

    if (json.containsKey("result") && json["result"] != null) {
      result = List<dynamic>.from(json["result"].map((x) => x));
    }

    return JsonData(
      status: status,
      msg: msg,
      result: result,
    );
  }

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "result": List<dynamic>.from(result.map((x) => x)),
  };
}