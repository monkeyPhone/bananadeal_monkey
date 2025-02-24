import 'dart:convert';

WalfareEntity walfareEntityFromJson(String str) => WalfareEntity.fromJson(json.decode(str));

String walfareEntityToJson(WalfareEntity data) => json.encode(data.toJson());

class WalfareEntity {
  WalfareEntity({
    required this.result,
    required this.list,
  });

  String result;
  List<WalfareDto> list;

  factory WalfareEntity.fromJson(Map<String, dynamic> json) => WalfareEntity(
    result: json["result"],
    list: List<WalfareDto>.from(json["LIST"].map((x) => WalfareDto.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "result": result,
    "LIST": List<dynamic>.from(list.map((x) => x.toJson())),
  };
}

class WalfareDto {
  WalfareDto({
    required this.pwIdx,
    required this.pwName,
    required this.pwDiscountText,
    required this.pwWelfareText,
    required this.pwOrder,
    required this.pwRegidate,
  });

  String pwIdx;
  String pwName;
  String pwDiscountText;
  String pwWelfareText;
  String pwOrder;
  DateTime pwRegidate;

  factory WalfareDto.fromJson(Map<String, dynamic> json) => WalfareDto(
    pwIdx: json["PW_idx"] ?? '',
    pwName: json["PW_name"] ?? '',
    pwDiscountText: json["PW_discountText"] ?? '',
    pwWelfareText: json["PW_welfareText"] ?? '',
    pwOrder: json["PW_order"] ?? '',
    pwRegidate: DateTime.parse(json["PW_regidate"]),
  );

  Map<String, dynamic> toJson() => {
    "PW_idx": pwIdx,
    "PW_name": pwName,
    "PW_discountText": pwDiscountText,
    "PW_welfareText": pwWelfareText,
    "PW_order": pwOrder,
    "PW_regidate": pwRegidate.toIso8601String(),
  };
}