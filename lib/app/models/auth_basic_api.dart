// To parse this JSON data, do
//
//     final authBagicApi = authBagicApiFromJson(jsonString);

import 'dart:convert';

AuthBagicApi authBagicApiFromJson(String str) => AuthBagicApi.fromJson(json.decode(str));

String authBagicApiToJson(AuthBagicApi data) => json.encode(data.toJson());

class AuthBagicApi {
  AuthBagicApi({
    required this.status,
    required this.msg,
    required this.result,
  });

  int status;
  String msg;
  List<int> result;

  factory AuthBagicApi.fromJson(Map<String, dynamic> json) => AuthBagicApi(
    status: json["status"] ?? 0,
    msg: json["msg"] ?? '',
    result: List<int>.from(json["result"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "result": List<dynamic>.from(result.map((x) => x)),
  };
}


AuthBagicApi2 authBagicApi2FromJson(String str) => AuthBagicApi2.fromJson(json.decode(str));

String authBagicApi2ToJson(AuthBagicApi data) => json.encode(data.toJson());

class AuthBagicApi2 {
  AuthBagicApi2({
    required this.status,
    required this.msg,
    required this.result,
  });

  int status;
  String msg;
  List<String> result;

  factory AuthBagicApi2.fromJson(Map<String, dynamic> json) => AuthBagicApi2(
    status: json["status"] ?? 0,
    msg: json["msg"] ?? '',
    result: List<String>.from(json["result"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "result": List<dynamic>.from(result.map((x) => x)),
  };
}

AuthBagicApi3 authBagicApi3FromJson(String str) => AuthBagicApi3.fromJson(json.decode(str));

String authBagicApi3ToJson(AuthBagicApi data) => json.encode(data.toJson());

class AuthBagicApi3 {
  AuthBagicApi3({
    required this.status,
    required this.msg,
    required this.result,
  });

  int status;
  String msg;
  List result;

  factory AuthBagicApi3.fromJson(Map<String, dynamic> json) => AuthBagicApi3(
    status: json["status"] ?? 0,
    msg: json["msg"] ?? '',
    result: List.from(json["result"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "result": List<dynamic>.from(result.map((x) => x)),
  };
}


class SmId {
  SmId({
    required this.smId
});
  String smId;
}


// To parse this JSON data, do
//
//     final inviteStore = inviteStoreFromJson(jsonString);


InviteStore inviteStoreFromJson(String str) => InviteStore.fromJson(json.decode(str));

String inviteStoreToJson(InviteStore data) => json.encode(data.toJson());

class InviteStore {
  int status;
  String msg;
  List<InviteStoreList> result;

  InviteStore({
    required this.status,
    required this.msg,
    required this.result,
  });

  factory InviteStore.fromJson(Map<String, dynamic> json) => InviteStore(
    status: json["status"],
    msg: json["msg"],
    result: List<InviteStoreList>.from(json["result"].map((x) => InviteStoreList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "result": List<dynamic>.from(result.map((x) => x.toJson())),
  };
}

class InviteStoreList {
  int dIdx;
  String smMId;

  InviteStoreList({
    required this.dIdx,
    required this.smMId,
  });

  factory InviteStoreList.fromJson(Map<String, dynamic> json) => InviteStoreList(
    dIdx: json["D_idx"],
    smMId: json["SM_m_id"],
  );

  Map<String, dynamic> toJson() => {
    "D_idx": dIdx,
    "SM_m_id": smMId,
  };
}

