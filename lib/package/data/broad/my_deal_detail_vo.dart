List<MyDealDetailVO> convertMyDealDetailVO(List<dynamic>? data) {
  if (data == null || data.isEmpty) {
    return [];
  }
  return data.map((item) => MyDealDetailVO.fromJson(item as Map<String, dynamic>)).toList();
}

final class MyDealDetailVO {

  const MyDealDetailVO({
    required this.diIdx,
    required this.diRegUserIdx,
    required this.diStatus,
    required this.diJoinType,
    required this.diSupportType,
    required this.diBeforeTkIdx,
    required this.diAfterTkIdx,
    required this.diHopePhone,
    required this.diHopePhoneModel,
    required this.diHopePhoneIdx,
    required this.diHopePlanIdx,
    required this.diHopePlan,
    required this.diAgeType,
    required this.diMaxInstallmentMonth,
    required this.diCombination,
    required this.diWelfare,
    required this.diRequests,
    required this.diRegdate,
    required this.diHopePhoneImg,
  });

  final int diIdx;
  final int diRegUserIdx;
  final String diStatus;
  final String diJoinType;
  final String diSupportType;
  final String diBeforeTkIdx;
  final String diAfterTkIdx;
  final String diHopePhone;
  final String diHopePhoneModel;
  final String diHopePhoneIdx;
  final String diHopePlanIdx;
  final String diHopePlan;
  final String diAgeType;
  final int diMaxInstallmentMonth;
  final String diCombination;
  final String diWelfare;
  final String diRequests;
  final DateTime diRegdate;
  final String diHopePhoneImg;

  factory MyDealDetailVO.fromJson(Map<String, dynamic> json) => MyDealDetailVO(
      diIdx: json["DI_idx"] ?? 0,
      diRegUserIdx: json["DI_reg_user_idx"] ?? 0,
      diStatus: json["DI_status"] ?? '',
      diJoinType: json["DI_join_type"],
      diSupportType: json["DI_support_type"] ?? '',
      diBeforeTkIdx: json["DI_before_tk_idx"] ?? '',
      diAfterTkIdx: json["DI_after_tk_idx"] ?? '',
      diHopePhone: json["DI_hope_phone"] ?? '',
      diHopePhoneModel: json["DI_hope_phone_model"] ?? '',
      diHopePhoneIdx: json["DI_hope_phone_idx"] ?? '',
      diHopePlanIdx: json["DI_hope_plan_idx"] ?? '',
      diHopePlan: json["DI_hope_plan"] ?? '',
      diAgeType: json["DI_age_type"] ?? '',
      diMaxInstallmentMonth: json["DI_max_installment_month"] ?? 0,
      diCombination: json["DI_combination"] ?? '',
      diWelfare: json["DI_welfare"] ?? '',
      diRequests: json["DI_requests"] ?? '',
      diRegdate: DateTime.parse(json["DI_regdate"]),
      diHopePhoneImg: json["DI_hope_phone_img"] ?? ''
  );

  Map<String, dynamic> toJson() => {
    "DI_idx": diIdx,
    "DI_reg_user_idx": diRegUserIdx,
    "DI_status": diStatus,
    "DI_join_type": diJoinType,
    "DI_support_type": diSupportType,
    "DI_before_tk_idx": diBeforeTkIdx,
    "DI_after_tk_idx": diAfterTkIdx,
    "DI_hope_phone": diHopePhone,
    "DI_hope_phone_model": diHopePhoneModel,
    "DI_hope_phone_idx": diHopePhoneIdx,
    "DI_hope_plan_idx": diHopePlanIdx,
    "DI_hope_plan": diHopePlan,
    "DI_age_type": diAgeType,
    "DI_max_installment_month": diMaxInstallmentMonth,
    "DI_combination": diCombination,
    "DI_welfare": diWelfare,
    "DI_requests": diRequests,
    "DI_regdate": diRegdate.toIso8601String(),
    "DI_hope_phone_img": diHopePhoneImg
  };

}