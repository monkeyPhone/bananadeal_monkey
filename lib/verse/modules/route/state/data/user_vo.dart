import 'dart:convert';

List<UserVO> convertUserVO(List<dynamic> data) {
  return data.map((item) => UserVO.fromJson(item as Map<String, dynamic>)).toList();
}

UserVO userVOFromJson(String str) => UserVO.fromJson(json.decode(str));

String userVOToJson(UserVO data) => json.encode(data.toJson());

final class UserVO {
  const UserVO({
    required this.mIdx,
    required this.mEmail,
    required this.mJoinType,
    required this.mName,
    required this.mAdd,
    required this.mLatitude,
    required this.mLongitude,
    required this.mAddDong,
    required this.mPathImg,
    required this.mIsUsed,
    required this.mPauseDuration,
    required this.mPauseReason,
    required this.mRegdate,
    required this.mSearchRange,
    required this.mAppPush,
    required this.mGwanggoPush,
    required this.mChatPush,
    required this.mUuid,
    required this.mModel,
    required this.mMpPush,
    required this.mSpPush,
    required this.mEditDateMp,
    required this.mEditDateSp
  });

  final int mIdx;
  final String mEmail;
  final String mJoinType;
  final String mName;
  final String mAdd;
  final String mLatitude;
  final String mLongitude;
  final String mAddDong;
  final String mPathImg;
  final String mIsUsed;
  final String mPauseDuration;
  final String mPauseReason;
  final String mRegdate;
  final int mSearchRange;
  final String mAppPush;
  final String mGwanggoPush;
  final String mChatPush;
  final String mUuid;
  final String mModel;
  final String mMpPush;
  final String mSpPush;
  final String mEditDateMp;
  final String mEditDateSp;

  factory UserVO.fromJson(Map<String, dynamic> json) => UserVO(
      mIdx: json["M_idx"] ?? 0,
      mEmail: json["M_email"] ?? '',
      mJoinType: json["M_join_type"] ?? '',
      mName: json["M_name"] ?? '',
      mAdd: json["M_add"] ?? '',
      mLatitude: json["M_latitude"] ?? '',
      mLongitude: json["M_longitude"] ?? '',
      mAddDong: json["M_add_dong"] ?? '',
      mPathImg: json["M_path_img"] ?? '',
      mIsUsed: json["M_isUsed"] ?? '',
      mPauseDuration: json["M_pause_duration"] ?? '',
      mPauseReason: json["M_pause_reason"] ?? '',
      mRegdate: json["M_regdate"],
      mSearchRange: json["M_search_range"] ?? 0,
      mAppPush: json["M_app_push"] ?? '',
      mGwanggoPush: json["M_gwanggo_push"] ?? '',
      mChatPush: json["M_chat_push"] ?? '',
      mUuid: json["M_uuid"] ?? '',
      mModel: json["M_model"] ?? '',
      mMpPush: json["M_mp_push"] ?? '',
      mSpPush: json["M_sp_push"] ?? '',
      mEditDateMp: json["M_editdate_mp"] ?? '',
      mEditDateSp: json["M_editdate_sp"] ?? ''
  );

  Map<String, dynamic> toJson() => {
    "M_idx": mIdx,
    "M_email": mEmail,
    "M_join_type": mJoinType,
    "M_name": mName,
    "M_add": mAdd,
    "M_latitude": mLatitude,
    "M_longitude": mLongitude,
    "M_add_dong": mAddDong,
    "M_path_img": mPathImg,
    "M_isUsed": mIsUsed,
    "M_pause_duration": mPauseDuration,
    "M_pause_reason": mPauseReason,
    "M_regdate": mRegdate,
    "M_search_range": mSearchRange,
    "M_app_push": mAppPush,
    "M_gwanggo_push": mGwanggoPush,
    "M_chat_push": mChatPush,
    "M_uuid": mUuid,
    "M_model": mModel,
    "M_sp_push": mSpPush,
    "M_mp_push": mMpPush,
    "M_editdate_mp": mEditDateMp,
    "M_editdate_sp": mEditDateSp
  };
}