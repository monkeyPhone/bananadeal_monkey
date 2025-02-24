List<CheckEmailVO> convertCheckEmailVO(List<dynamic> data) {
  return data.map((item) => CheckEmailVO.fromJson(item as Map<String, dynamic>)).toList();
}

class CheckEmailVO {
  const CheckEmailVO({
    required this.msg,
    required this.joinType,
    required this.authNumber,
  });

  final String msg;
  final String joinType;
  final String authNumber;

  factory CheckEmailVO.fromJson(Map<String, dynamic> json) => CheckEmailVO(
    msg: json["msg"] ?? '',
    joinType: json["join_type"] ?? '',
    authNumber: json["authNumber"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "msg": msg,
    "join_type": joinType,
    "authNumber": authNumber,
  };
}