List<RankVO> convertRankVO(List<dynamic>? data) {
  if (data == null || data.isEmpty) {
    return [];
  }
  return data.map((item) => RankVO.fromJson(item as Map<String, dynamic>)).toList();
}

class RankVO {
  RankVO({
    required this.psIdx,
    required this.psName,
    required this.psModel,
    required this.psMobileGrade,
    required this.piPath,
    required this.cnt,
  });

  final int psIdx;
  final String psName;
  final String psModel;
  final String psMobileGrade;
  final String piPath;
  final int cnt;

  factory RankVO.fromJson(Map<String, dynamic> json) => RankVO(
    psIdx: json["PR_ps_idx"] ?? 0,
    psName: json["PR_ps_name"] ?? '',
    psModel: json["PR_ps_model"] ?? '',
    psMobileGrade: json["PR_ps_mobileGrade"] ?? '',
    piPath: json["PR_pi_path"] ?? '',
    cnt: json["PR_cnt"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "PR_ps_idx": psIdx,
    "PR_ps_name": psName,
    "PR_ps_model": psModel,
    "PR_ps_mobileGrade": psMobileGrade,
    "PR_pi_path": piPath,
    "PR_cnt": cnt,
  };
}