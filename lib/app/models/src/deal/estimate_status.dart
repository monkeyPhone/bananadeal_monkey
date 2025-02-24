import 'dart:convert';

EstimateStatus estimateStatusFromJson(String str) => EstimateStatus.fromJson(json.decode(str));

String estimateStatusToJson(EstimateStatus data) => json.encode(data.toJson());

class EstimateStatus {
  int status;
  String msg;
  List<EstimateStatusList> result;

  EstimateStatus({
    required this.status,
    required this.msg,
    required this.result,
  });

  factory EstimateStatus.fromJson(Map<String, dynamic> json) => EstimateStatus(
    status: json["status"],
    msg: json["msg"],
    result: List<EstimateStatusList>.from(json["result"].map((x) => EstimateStatusList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "result": List<dynamic>.from(result.map((x) => x.toJson())),
  };
}

class EstimateStatusList {
  String dStatus;

  EstimateStatusList({
    required this.dStatus,
  });

  factory EstimateStatusList.fromJson(Map<String, dynamic> json) => EstimateStatusList(
    dStatus: json["DI_status"],
  );

  Map<String, dynamic> toJson() => {
    "DI_status": dStatus,
  };
}
