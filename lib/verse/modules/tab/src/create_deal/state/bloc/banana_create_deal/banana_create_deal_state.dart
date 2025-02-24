part of 'banana_create_deal_bloc.dart';

final class BananaCreateDealState extends Equatable {
  final StepEnum step;
  final String age;
  final String currentAgency;
  final String requestAgency;
  final (String psIdx, String ldcpName, String ldcpModel, String piPath) selectModel;
  final String recModel;
  final (int planIdx, String plan) selectRate;
  final String recRate;
  final String maxInstallment;
  final String supportType;
  final String combination;
  final String welfare;
  final String request;


  const BananaCreateDealState({
    this.step = StepEnum.age,
    this.age = '',
    this.currentAgency = '',
    this.requestAgency = '',
    this.selectModel = ('','','',''),
    this.recModel = '',
    this.selectRate = (0, ''),
    this.recRate = '',
    this.maxInstallment = '',
    this.supportType = '',
    this.combination = '',
    this.welfare = '',
    this.request = ''
  });

  BananaCreateDealState copyWith({
    StepEnum? step,
    String? age,
    String? currentAgency,
    String? requestAgency,
    (String psIdx, String ldcpName, String ldcpModel, String piPath)? selectModel,
    String? recModel,
    (int planIdx, String plan)? selectRate,
    String? recRate,
    String? maxInstallment,
    String? supportType,
    String? combination,
    String? welfare,
    String? request,
  }) => BananaCreateDealState(
    step: step ?? this.step,
    age: age ?? this.age,
    currentAgency: currentAgency ?? this.currentAgency,
    requestAgency: requestAgency ?? this.requestAgency,
    selectModel: selectModel ?? this.selectModel,
    recModel: recModel ?? this.recModel,
    selectRate: selectRate ?? this.selectRate,
    recRate: recRate ?? this.recRate,
    maxInstallment: maxInstallment ?? this.maxInstallment,
    supportType: supportType ?? this.supportType,
    combination: combination ?? this.combination,
    welfare: welfare ?? this.welfare,
    request: request ?? this.request,
  );

  @override
  List<Object> get props => [
    step, age, currentAgency, requestAgency, selectModel, recModel, selectRate, recRate, maxInstallment, supportType, combination, welfare, request
  ];
}
