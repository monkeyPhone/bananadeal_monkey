class PlanGroupEntity {
  const PlanGroupEntity({
    required this.list,
  });

  final List<PlanGroupDto> list;

  factory PlanGroupEntity.fromJson(Map<String, dynamic> json) => PlanGroupEntity(
    list: List<PlanGroupDto>.from(json["LIST"].map((x) => PlanGroupDto.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "LIST": List<dynamic>.from(list.map((x) => x.toJson())),
  };
}

class PlanGroupDto {
  const PlanGroupDto({
    required this.pgIdx,
    required this.tkIdx,
    required this.pgOrder,
    required this.pgName,
    required this.pgRegiDate,
    required this.pgEditDate,
  });

  final String pgIdx;
  final String tkIdx;
  final String pgOrder;
  final String pgName;
  final String pgRegiDate;
  final String pgEditDate;

  factory PlanGroupDto.fromJson(Map<String, dynamic> json) => PlanGroupDto(
    pgIdx: json["PG_idx"] ?? '',
    tkIdx: json["tk_idx"] ?? '',
    pgOrder: json["PG_order"] ?? '',
    pgName: json["PG_name"] ?? '',
    pgRegiDate: json["PG_regi_date"] ?? '',
    pgEditDate: json["PG_edit_date"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "PG_idx": pgIdx,
    "tk_idx": tkIdx,
    "PG_order": pgOrder,
    "PG_name": pgName,
    "PG_regi_date": pgRegiDate,
    "PG_edit_date": pgEditDate,
  };
}