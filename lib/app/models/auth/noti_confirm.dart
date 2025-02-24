import 'dart:convert';

NotiConfirm notiConfirmFromJson(String str) => NotiConfirm.fromJson(json.decode(str));

String notiConfirmToJson(NotiConfirm data) => json.encode(data.toJson());


class NotiConfirm {
  NotiConfirm({
    required this.mpTitle,
    required this.mpContent,
    required this.mpPush,
    required this.mpDate,
  });

  String mpTitle;
  String mpContent;
  String mpPush;
  String mpDate;

  factory NotiConfirm.fromJson(Map<String, dynamic> json) => NotiConfirm(
      mpTitle: json["mpTitle"],
      mpContent: json["mpContent"],
      mpPush: json["mpPush"] ?? 'N',
      mpDate: json["mpDate"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "mpTitle": mpTitle,
    "mpContent": mpContent,
    "mpPush": mpPush,
    "mpDate": mpDate,
  };

}