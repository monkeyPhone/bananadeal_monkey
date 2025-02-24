import 'dart:convert';

DataEntity dataEntityFromJson(String str) => DataEntity.fromJson(json.decode(str));

String dataEntityToJson(DataEntity data) => json.encode(data.toJson());

class DataEntity {
  const DataEntity({
    required this.status,
    required this.msg,
    required this.result,
  });

  final int status;
  final String msg;
  final List<dynamic> result;

  factory DataEntity.fromJson(Map<String, dynamic> json) {
    int status = json["status"] ?? 0;
    String msg = json["msg"] ?? '';
    List<dynamic> result = [];

    if (json.containsKey("result") && json["result"] != null) {
      result = List<dynamic>.from(json["result"].map((x) => x));
    }

    return DataEntity(
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