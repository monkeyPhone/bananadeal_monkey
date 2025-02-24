import 'dart:convert';

InviteStoreIdx inviteStoreIdxFromJson(String str) => InviteStoreIdx.fromJson(json.decode(str));

String inviteStoreIdxToJson(InviteStoreIdx data) => json.encode(data.toJson());

class InviteStoreIdx {
  int status;
  String msg;
  List<InviteStoreIdxResult> result;

  InviteStoreIdx({
    required this.status,
    required this.msg,
    required this.result,
  });

  factory InviteStoreIdx.fromJson(Map<String, dynamic> json) => InviteStoreIdx(
    status: json["status"],
    msg: json["msg"],
    result: List<InviteStoreIdxResult>.from(json["result"].map((x) => InviteStoreIdxResult.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "result": List<dynamic>.from(result.map((x) => x.toJson())),
  };
}

class InviteStoreIdxResult {
  int dIdx;

  InviteStoreIdxResult({
    required this.dIdx,
  });

  factory InviteStoreIdxResult.fromJson(Map<String, dynamic> json) => InviteStoreIdxResult(
    dIdx: json["D_idx"],
  );

  Map<String, dynamic> toJson() => {
    "D_idx": dIdx,
  };
}
