class PhoneSpecDetailEntity {
  const PhoneSpecDetailEntity({
    required this.result,
    required this.phoneSpecDetail,
    required this.phoneImg,
    required this.phoneOptionNum,
  });

  final String result;
  final PhoneSpecDetailDto phoneSpecDetail;
  final List<PhoneImg> phoneImg;
  final List<dynamic> phoneOptionNum;

  factory PhoneSpecDetailEntity.fromJson(Map<String, dynamic> json) => PhoneSpecDetailEntity(
    result: json["result"],
    phoneSpecDetail: PhoneSpecDetailDto.fromJson(json["PHONE_SPEC"]),
    phoneImg: List<PhoneImg>.from(json["PHONE_IMG"].map((x) => PhoneImg.fromJson(x))),
    phoneOptionNum: List<dynamic>.from(json["PHONE_OPTION_NUM"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "result": result,
    "PHONE_SPEC": phoneSpecDetail.toJson(),
    "PHONE_IMG": List<dynamic>.from(phoneImg.map((x) => x.toJson())),
    "PHONE_OPTION_NUM": List<dynamic>.from(phoneOptionNum.map((x) => x)),
  };
}

class PhoneImg {
  PhoneImg({
    required this.piIdx,
    required this.psIdx,
    required this.piPath,
    required this.piColorHax,
    required this.piColorName,
    required this.piEditData,
  });

  String piIdx;
  String psIdx;
  String piPath;
  String piColorHax;
  String piColorName;
  DateTime piEditData;

  factory PhoneImg.fromJson(Map<String, dynamic> json) => PhoneImg(
    piIdx: json["PI_idx"] ?? '',
    psIdx: json["ps_idx"] ?? '',
    piPath: json["PI_path"] ?? '',
    piColorHax: json["PI_color_hax"] ?? '',
    piColorName: json["PI_color_name"] ?? '',
    piEditData: DateTime.parse(json["PI_edit_data"]),
  );

  Map<String, dynamic> toJson() => {
    "PI_idx": piIdx,
    "ps_idx": psIdx,
    "PI_path": piPath,
    "PI_color_hax": piColorHax,
    "PI_color_name": piColorName,
    "PI_edit_data": piEditData.toIso8601String(),
  };
}

class PhoneSpecDetailDto {
  const PhoneSpecDetailDto({
    required this.psIdx,
    required this.mkIdx,
    required this.mksIdx,
    required this.psOrder,
    required this.psName,
    required this.psModel,
    required this.psOs,
    required this.psCpu,
    required this.psDisplay,
    required this.psDisplaySize,
    required this.psCameraFront,
    required this.psCameraBack,
    required this.psWeight,
    required this.psHeight,
    required this.psWidth,
    required this.psThickness,
    required this.psInMemory,
    required this.psExMemory,
    required this.psRam,
    required this.psBattery,
    required this.psInfo1,
    required this.psInfo2,
    required this.psExplainImgPath,
    required this.psMobileGrade,
    required this.psTypeAnalytics,
    required this.psReleaseDate,
    required this.psRegiDate,
    required this.psEditDate,
    this.psKeyword,
    required this.psDualNumber,
    required this.psAllImgPath,
    required this.psIsAllImg,
    required this.psSpecNfc,
    required this.psSpecType,
    required this.psSpecFilm,
    required this.psSpecUsim,
    required this.psSpecComponent,
    required this.psSpecDesign,
    required this.psSpecSpecial,
    required this.psSpecCamera,
    required this.psSpecAsinfo,
    required this.psSpecAod,
    required this.psSpecPay,
    required this.psSpecIp
  });

  final String psIdx;
  final String mkIdx;
  final String mksIdx;
  final String psOrder;
  final String psName;
  final String psModel;
  final String psOs;
  final String psCpu;
  final String psDisplay;
  final String psDisplaySize;
  final String psCameraFront;
  final String psCameraBack;
  final String psWeight;
  final String psHeight;
  final String psWidth;
  final String psThickness;
  final String psInMemory;
  final String psExMemory;
  final String psRam;
  final String psBattery;
  final String psInfo1;
  final String psInfo2;
  final String psExplainImgPath;
  final String psMobileGrade;
  final String psTypeAnalytics;
  final DateTime psReleaseDate;
  final DateTime psRegiDate;
  final DateTime psEditDate;
  final dynamic psKeyword;
  final String psDualNumber;
  final String psAllImgPath;
  final String psIsAllImg;
  final String psSpecNfc;
  final String psSpecType;
  final String psSpecFilm;
  final String psSpecUsim;
  final String psSpecComponent;
  final String psSpecDesign;
  final String psSpecSpecial;
  final String psSpecCamera;
  final String psSpecAsinfo;
  final String psSpecAod;
  final String psSpecPay;
  final String psSpecIp;

  factory PhoneSpecDetailDto.fromJson(Map<String, dynamic> json) => PhoneSpecDetailDto(
      psIdx: json["PS_idx"],
      mkIdx: json["mk_idx"],
      mksIdx: json["mks_idx"],
      psOrder: json["PS_order"],
      psName: json["PS_name"],
      psModel: json["PS_model"],
      psOs: json["PS_os"],
      psCpu: json["PS_cpu"],
      psDisplay: json["PS_display"],
      psDisplaySize: json["PS_display_size"],
      psCameraFront: json["PS_camera_front"],
      psCameraBack: json["PS_camera_back"],
      psWeight: json["PS_weight"],
      psHeight: json["PS_height"],
      psWidth: json["PS_width"],
      psThickness: json["PS_thickness"],
      psInMemory: json["PS_inMemory"],
      psExMemory: json["PS_exMemory"],
      psRam: json["PS_ram"],
      psBattery: json["PS_battery"],
      psInfo1: json["PS_info1"],
      psInfo2: json["PS_info2"],
      psExplainImgPath: json["PS_explainImg_path"] ?? '',
      psMobileGrade: json["PS_mobileGrade"],
      psTypeAnalytics: json["PS_type_analytics"],
      psReleaseDate: DateTime.parse(json["PS_release_date"]),
      psRegiDate: DateTime.parse(json["PS_regi_date"]),
      psEditDate: DateTime.parse(json["PS_edit_date"]),
      psKeyword: json["PS_keyword"],
      psDualNumber: json["PS_dual_number"],
      psAllImgPath: json["PS_allImg_path"],
      psIsAllImg: json["PS_isAllImg"],
      psSpecNfc: json["PS_spec_nfc"],
      psSpecType: json["PS_spec_type"],
      psSpecFilm: json["PS_spec_film"],
      psSpecUsim: json["PS_spec_usim"],
      psSpecComponent: json["PS_spec_component"],
      psSpecDesign: json["PS_spec_design"],
      psSpecSpecial: json["PS_spec_special"],
      psSpecCamera: json["PS_spec_camera"],
      psSpecAsinfo: json["PS_spec_asinfo"],
      psSpecAod: json["PS_spec_aod"],
      psSpecPay: json["PS_spec_pay"],
      psSpecIp: json["PS_spec_ip"]
  );

  Map<String, dynamic> toJson() => {
    "PS_idx": psIdx,
    "mk_idx": mkIdx,
    "mks_idx": mksIdx,
    "PS_order": psOrder,
    "PS_name": psName,
    "PS_model": psModel,
    "PS_os": psOs,
    "PS_cpu": psCpu,
    "PS_display": psDisplay,
    "PS_display_size": psDisplaySize,
    "PS_camera_front": psCameraFront,
    "PS_camera_back": psCameraBack,
    "PS_weight": psWeight,
    "PS_height": psHeight,
    "PS_width": psWidth,
    "PS_thickness": psThickness,
    "PS_inMemory": psInMemory,
    "PS_exMemory": psExMemory,
    "PS_ram": psRam,
    "PS_battery": psBattery,
    "PS_info1": psInfo1,
    "PS_info2": psInfo2,
    "PS_explainImg_path": psExplainImgPath,
    "PS_mobileGrade": psMobileGrade,
    "PS_type_analytics": psTypeAnalytics,
    "PS_release_date": "${psReleaseDate.year.toString().padLeft(4, '0')}-${psReleaseDate.month.toString().padLeft(2, '0')}-${psReleaseDate.day.toString().padLeft(2, '0')}",
    "PS_regi_date": psRegiDate.toIso8601String(),
    "PS_edit_date": psEditDate.toIso8601String(),
    "PS_keyword": psKeyword,
    "PS_dual_number": psDualNumber,
    "PS_allImg_path": psAllImgPath,
    "PS_isAllImg": psIsAllImg,
    "PS_spec_nfc": psSpecNfc,
    "PS_spec_type": psSpecType,
    "PS_spec_film": psSpecFilm,
    "PS_spec_usim": psSpecUsim,
    "PS_spec_component": psSpecComponent,
    "PS_spec_design": psSpecDesign,
    "PS_spec_special": psSpecSpecial,
    "PS_spec_camera": psSpecCamera,
    "PS_spec_asinfo": psSpecAsinfo,
    "PS_spec_aod": psSpecAod,
    "PS_spec_pay": psSpecPay,
    "PS_spec_ip": psSpecIp
  };
}