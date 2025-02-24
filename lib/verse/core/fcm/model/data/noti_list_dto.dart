import 'dart:convert';
import 'package:banana_deal_by_monkeycompany/verse/core/fcm/model/data/noti_entity.dart';

NotiListDto notiListDtoFromJson(String str) => NotiListDto.fromJson(json.decode(str));

String notiListDtoToJson(NotiListDto lit) => json.encode(lit.toJson());

class NotiListDto {
   NotiListDto({
    required this.data,
  });

   List<NotiEntity> data;


  factory NotiListDto.fromJson(Map<String, dynamic> json) {
    return NotiListDto(
      data: json["DATA"] != null ? List<NotiEntity>.from(json["DATA"].map((x) => NotiEntity.fromJson(x))) : [],
    );
  }

  Map<String, dynamic> toJson() => {
    "DATA": List<dynamic>.from(data.map((x) => x.toJson())),
  };

}