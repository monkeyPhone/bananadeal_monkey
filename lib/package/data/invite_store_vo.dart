List<InviteStoreVO> convertInviteStoreVO(List<dynamic> data) {
  return data.map((item) => InviteStoreVO.fromJson(item as Map<String, dynamic>)).toList();
}


class InviteStoreVO {
  int dIdx;
  String smMId;

  InviteStoreVO({
    required this.dIdx,
    required this.smMId,
  });

  factory InviteStoreVO.fromJson(Map<String, dynamic> json) => InviteStoreVO(
    dIdx: json["D_idx"],
    smMId: json["SM_m_id"],
  );

  Map<String, dynamic> toJson() => {
    "D_idx": dIdx,
    "SM_m_id": smMId,
  };
}