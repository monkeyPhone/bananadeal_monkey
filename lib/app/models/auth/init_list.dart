import 'dart:convert';

List<BannerMember> bannerMemberFromJson(String str) => List<BannerMember>.from(json.decode(str).map((x) => BannerMember.fromJson(x)));

String bannerMemberToJson(List<BannerMember> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

InfoMember infoMemberFromJson(String str) => InfoMember.fromJson(json.decode(str));

String infoMemberToJson(InfoMember data) => json.encode(data.toJson());


class BannerMember{
  BannerMember({
    required this.pmIdx,
    required this.pmOrder,
    required this.pmTitle,
    required this.pmCategory,
    required this.pmReference,
    required this.pmPathImg,
    required this.pmRegdate,
  });

  int pmIdx;
  int pmOrder;
  String pmTitle;
  String pmCategory;
  String pmReference;
  String pmPathImg;
  DateTime pmRegdate;

  factory BannerMember.fromJson(Map<String, dynamic> json) => BannerMember(
    pmIdx: json["PM_idx"],
    pmOrder: json["PM_order"],
    pmTitle: json["PM_title"],
    pmCategory: json["PM_category"],
    pmReference: json["PM_reference"],
    pmPathImg: json["PM_path_img"],
    pmRegdate: DateTime.parse(json["PM_regdate"]),
  );

  Map<String, dynamic> toJson() => {
    "PM_idx": pmIdx,
    "PM_order": pmOrder,
    "PM_title": pmTitle,
    "PM_category": pmCategory,
    "PM_reference": pmReference,
    "PM_path_img": pmPathImg,
    "PM_regdate": pmRegdate.toIso8601String(),
  };
}

class InfoMember {
  InfoMember({
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
    required this.mEditDateMp,
  });

  int mIdx;
  String mEmail;
  String mJoinType;
  String mName;
  String mAdd;
  String mLatitude;
  String mLongitude;
  String mAddDong;
  String mPathImg;
  String mIsUsed;
  String mPauseDuration;
  String mPauseReason;
  String mRegdate;
  int mSearchRange;
  String mAppPush;
  String mGwanggoPush;
  String mChatPush;
  String mUuid;
  String mModel;
  String mMpPush;
  String mEditDateMp;

  factory InfoMember.fromJson(Map<String, dynamic> json) => InfoMember(
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
    mRegdate: json["M_regdate"] ?? '',
    mSearchRange: json["M_search_range"] ?? 0,
    mAppPush: json["M_app_push"] ?? '',
    mGwanggoPush: json["M_gwanggo_push"] ?? '',
    mChatPush: json["M_chat_push"] ?? '',
    mUuid: json["M_uuid"] ?? '',
    mModel: json["M_model"] ?? '',
    mMpPush: json["M_mp_push"] ?? '',
    mEditDateMp: json["M_editdate_mp"] ?? '',
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
    "M_mp_push": mMpPush,
    "M_editdate_mp": mEditDateMp,
  };
}


