// To parse this JSON data, do
//
//     final authInfo = authInfoFromJson(jsonString);

import 'dart:convert';

import 'init_list.dart';


AuthInfo authInfoFromJson(String str) => AuthInfo.fromJson(json.decode(str));

String authInfoToJson(AuthInfo data) => json.encode(data.toJson());

class AuthInfo {
  AuthInfo({
    required this.status,
    required this.msg,
    required this.result,
  });

  int status;
  String msg;
  List<InfoMember> result;

  factory AuthInfo.fromJson(Map<String, dynamic> json) => AuthInfo(
    status: json["status"] ?? 0,
    msg: json["msg"] ?? '',
    result: List<InfoMember>.from(json["result"].map((x) => InfoMember.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "result": List<dynamic>.from(result.map((x) => x.toJson())),
  };
}

// class UserInfo {
//   UserInfo({
//     required this.mIdx,
//     required this.mEmail,
//     required this.mJoinType,
//     required this.mName,
//     required this.mAdd,
//     required this.mLatitude,
//     required this.mLongitude,
//     required this.mAddDong,
//     required this.mPathImg,
//     required this.mIsUsed,
//     required this.mMemo,
//     required this.mPauseDuration,
//     required this.mPauseReason,
//     required this.mPauseMemo,
//     required this.mRegdate,
//   });
//
//   int mIdx;
//   String mEmail;
//   String mJoinType;
//   String mName;
//   String mAdd;
//   String mLatitude;
//   String mLongitude;
//   String mAddDong;
//   String mPathImg;
//   String mIsUsed;
//   String mMemo;
//   String mPauseDuration;
//   String mPauseReason;
//   String mPauseMemo;
//   DateTime mRegdate;
//
//   factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
//     mIdx: json["M_idx"],
//     mEmail: json["M_email"],
//     mJoinType: json["M_join_type"],
//     mName: json["M_name"],
//     mAdd: json["M_add"],
//     mLatitude: json["M_latitude"],
//     mLongitude: json["M_longitude"],
//     mAddDong: json["M_add_dong"],
//     mPathImg: json["M_path_img"],
//     mIsUsed: json["M_isUsed"],
//     mMemo: json["M_memo"],
//     mPauseDuration: json["M_pause_duration"],
//     mPauseReason: json["M_pause_reason"],
//     mPauseMemo: json["M_pause_memo"],
//     mRegdate: DateTime.parse(json["M_regdate"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "M_idx": mIdx,
//     "M_email": mEmail,
//     "M_join_type": mJoinType,
//     "M_name": mName,
//     "M_add": mAdd,
//     "M_latitude": mLatitude,
//     "M_longitude": mLongitude,
//     "M_add_dong": mAddDong,
//     "M_path_img": mPathImg,
//     "M_isUsed": mIsUsed,
//     "M_memo": mMemo,
//     "M_pause_duration": mPauseDuration,
//     "M_pause_reason": mPauseReason,
//     "M_pause_memo": mPauseMemo,
//     "M_regdate": mRegdate.toIso8601String(),
//   };
// }
