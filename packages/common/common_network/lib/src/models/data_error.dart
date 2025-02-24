import 'dart:convert';

DataError dataErrorFromJson(String str) => DataError.fromJson(json.decode(str));

String dataErrorToJson(DataError data) => json.encode(data.toJson());


class DataError {
  const DataError({
    required this.url,
    required this.status,
    required this.where,
    required this.dioExceptionType,
  });

  final String url;
  final int status;
  final String where;
  final String dioExceptionType;

  factory DataError.fromJson(Map<String, dynamic> json) {
    String url = json["url"] ?? '';
    int status = json["status"] ?? 0;
    String where = json["where"] ?? '';
    String  dioExceptionType = json["dioExceptionType"] ?? '';



    return DataError(
      url: url,
      status: status,
      where: where,
      dioExceptionType: dioExceptionType,
    );
  }

  Map<String, dynamic> toJson() => {
    "url": url,
    "status": status,
    "where": where,
    "dioExceptionType": dioExceptionType,
  };
}