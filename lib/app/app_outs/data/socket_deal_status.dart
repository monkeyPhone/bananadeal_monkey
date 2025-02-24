import 'dart:convert';

SocketDealStatus socketDealStatusFromJson(String str) => SocketDealStatus.fromJson(json.decode(str));

String socketDealStatusToJson(SocketDealStatus data) => json.encode(data.toJson());

class SocketDealStatus {
  int status;
  String msg;
  List<SocketDeal> result;

  SocketDealStatus({
    required this.status,
    required this.msg,
    required this.result,
  });

  factory SocketDealStatus.fromJson(Map<String, dynamic> json) => SocketDealStatus(
    status: json["status"],
    msg: json["msg"],
    result: List<SocketDeal>.from(json["result"].map((x) => SocketDeal.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "result": List<dynamic>.from(result.map((x) => x.toJson())),
  };
}

class SocketDeal {
  String dStatus;
  int dDiIdx;
  String diStatus;

  SocketDeal({
    required this.dStatus,
    required this.dDiIdx,
    required this.diStatus,
  });

  factory SocketDeal.fromJson(Map<String, dynamic> json) => SocketDeal(
    dStatus: json["D_status"] ?? '',
    dDiIdx: json["D_di_idx"] ?? 0,
    diStatus: json["DI_status"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "D_status": dStatus,
    "D_di_idx": dDiIdx,
    "DI_status": diStatus,
  };
}