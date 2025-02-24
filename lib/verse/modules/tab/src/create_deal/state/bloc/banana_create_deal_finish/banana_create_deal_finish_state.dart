part of 'banana_create_deal_finish_bloc.dart';

final class BananaCreateDealFinishState extends Equatable {
  final StatusEnum apiStatus;
  final int diIdx;
  final (String, String, String, String, String, String, String, String, String) showCase;
  final int userIdx;
  final String joinType;
  final String currentAgency;
  final String requestAgency;
  final String joinerPhoneName;
  final String joinerPhoneModel;
  final String joinerPhoneIdx;
  final String joinerPhoneImg;
  final String joinerRatePlan;
  final String joinerRatePlanIdx;
  final String ageType;
  final int maxInstallment;
  final String guyHap;
  final String welfare;
  final String sup;
  final String etc;

  const BananaCreateDealFinishState({
    this.apiStatus = StatusEnum.initial,
    this.diIdx = 0,
    this.showCase = ('', '', '', '', '', '', '', '', ''),
    this.userIdx = 0,
    this.joinType = '',
    this.currentAgency = '',
    this.requestAgency = '',
    this.joinerPhoneName = '',
    this.joinerPhoneModel = '',
    this.joinerPhoneIdx = '',
    this.joinerPhoneImg = '',
    this.joinerRatePlan = '',
    this.joinerRatePlanIdx = '',
    this.ageType = '',
    this.maxInstallment = 0,
    this.guyHap = '',
    this.welfare = '',
    this.sup = '',
    this.etc = '',
  });

  BananaCreateDealFinishState copyWith({
    StatusEnum? apiStatus,
    (String, String, String, String, String, String, String, String, String,)? showCase,
    int? diIdx,
    int? userIdx,
    String? joinType,
    String? currentAgency,
    String? requestAgency,
    String? joinerPhoneName,
    String? joinerPhoneModel,
    String? joinerPhoneIdx,
    String? joinerPhoneImg,
    String? joinerRatePlan,
    String? joinerRatePlanIdx,
    String? ageType,
    int? maxInstallment,
    String? guyHap,
    String? welfare,
    String? sup,
    String? etc,
  }) =>  BananaCreateDealFinishState(
    apiStatus: apiStatus ?? this.apiStatus,
    showCase: showCase ?? this.showCase,
    diIdx: diIdx ?? this.diIdx,
    userIdx: userIdx ?? this.userIdx,
    joinType: joinType ?? this.joinType,
    currentAgency: currentAgency ?? this.currentAgency,
    requestAgency: requestAgency ?? this.requestAgency,
    joinerPhoneName: joinerPhoneName ?? this.joinerPhoneName,
    joinerPhoneModel: joinerPhoneModel ?? this.joinerPhoneModel,
    joinerPhoneIdx: joinerPhoneIdx ?? this.joinerPhoneIdx,
    joinerPhoneImg: joinerPhoneImg ?? this.joinerPhoneImg,
    joinerRatePlan: joinerRatePlan ?? this.joinerRatePlan,
    joinerRatePlanIdx: joinerRatePlanIdx ?? this.joinerRatePlanIdx,
    ageType: ageType ?? this.ageType,
    maxInstallment: maxInstallment ?? this.maxInstallment,
    guyHap: guyHap ?? this.guyHap,
    welfare: welfare ?? this.welfare,
    sup: sup ?? this.sup,
    etc: etc ?? this.etc,
  );


  @override
  List<Object> get props => [
    apiStatus,
    diIdx,
    showCase,
    userIdx,
    joinType,
    currentAgency,
    requestAgency,
    joinerPhoneName,
    joinerPhoneModel,
    joinerPhoneIdx,
    joinerPhoneImg,
    joinerRatePlan,
    joinerRatePlanIdx,
    ageType,
    maxInstallment,
    guyHap,
    welfare,
    sup,
    etc,
  ];
}

