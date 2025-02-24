import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';

List<MyDealListEntity> convertMyDealListEntity(List<dynamic>? data) {
  if (data == null || data.isEmpty) {
    return [];
  }
  return data.map((item) => MyDealListEntity.fromJson(item as Map<String, dynamic>)).toList();
}


class MyDealListEntity {
  int total;
  int totalPages;
  List<MyDealListDto> list;

  MyDealListEntity({
    required this.total,
    required this.totalPages,
    required this.list,
  });

  factory MyDealListEntity.fromJson(Map<String, dynamic> json) => MyDealListEntity(
    total: json["total"],
    totalPages: json["totalPages"],
    list: List<MyDealListDto>.from(json["list"].map((x) => MyDealListDto.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "totalPages": totalPages,
    "list": List<dynamic>.from(list.map((x) => x.toJson())),
  };
}





List<MyDealListDto> convertMyDealListVO(List<dynamic>? data) {
  if (data == null || data.isEmpty) {
    return [];
  }
  return data.map((item) => MyDealListDto.fromJson(item as Map<String, dynamic>)).toList();
}

final class MyDealListDto{
  final int diIdx;
  final String diHopePhone;
  final String diHopePhoneModel;
  final String diStatus;
  final int diEstimateCnt;
  final String diRegdate;
  final String diHopePhoneImg;
  final String diIsShow;

  const MyDealListDto({
    required this.diIdx,
    required this.diHopePhone,
    required this.diHopePhoneModel,
    required this.diStatus,
    required this.diEstimateCnt,
    required this.diRegdate,
    required this.diHopePhoneImg,
    required this.diIsShow,
  });

  factory MyDealListDto.fromJson(Map<String, dynamic> json) => MyDealListDto(
      diIdx: json["DI_idx"] ?? 0,
      diHopePhone: json["DI_hope_phone"] ?? '',
      diHopePhoneModel: json["DI_hope_phone_model"] ?? '',
      diStatus: json["DI_status"] ?? '',
      diEstimateCnt: json["DI_estimate_cnt"] ?? 0,
      diRegdate: json["DI_regdate"] ?? '',
      diHopePhoneImg: json["DI_hope_phone_img"] ?? '',
      diIsShow: json["DI_isShow"] ?? ''
  );

  Map<String, dynamic> toJson() => {
    "DI_idx": diIdx,
    "DI_hope_phone": diHopePhone,
    "DI_hope_phone_model": diHopePhoneModel,
    "DI_status": diStatus,
    "DI_estimate_cnt": diEstimateCnt,
    "DI_regdate": diRegdate,
    "DI_hope_phone_img": diHopePhoneImg,
    "DI_isShow": diIsShow
  };

}


class MyDealListVO {
  final StatusEnum statusEnum;
  final int total;
  final List<MyDealListDto> dealList;

  const MyDealListVO({
    required this.statusEnum,
    required this.total,
    required this.dealList,
  });
}