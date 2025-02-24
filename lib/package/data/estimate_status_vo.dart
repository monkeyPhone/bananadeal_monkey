import 'dart:convert';

List<EstimateStatusVO> convertEstimateStatusVO(List<dynamic> data) {
  return data.map((item) => EstimateStatusVO.fromJson(item as Map<String, dynamic>)).toList();
}

EstimateStatusVO estimateStatusVOFromJson(String str) => EstimateStatusVO.fromJson(json.decode(str));

String estimateStatusVOToJson(EstimateStatusVO data) => json.encode(data.toJson());

class EstimateStatusVO {
  String diStatus;

  EstimateStatusVO({
    required this.diStatus,
  });

  factory EstimateStatusVO.fromJson(Map<String, dynamic> json) => EstimateStatusVO(
    diStatus: json["DI_status"],
  );

  Map<String, dynamic> toJson() => {
    "DI_status": diStatus,
  };
}