part of 'banana_create_deal_init_bloc.dart';

final class BananaCreateDealInitState extends Equatable{
  final (String psIdx, String ldcpName, String ldcpModel, String piPath) initInfo;
  final StepWidgetEnum stepWidget;

  const BananaCreateDealInitState({
    this.initInfo = ("", "", "", ""),
    this.stepWidget = StepWidgetEnum.deal,
  });

  BananaCreateDealInitState copyWith({
    (String psIdx, String ldcpName, String ldcpModel, String piPath)? initInfo,
    StepWidgetEnum? stepWidget
  }) =>
      BananaCreateDealInitState(
          initInfo: initInfo ?? this.initInfo,
          stepWidget: stepWidget ?? this.stepWidget
      );

  @override
  List<Object> get props => [initInfo, stepWidget];

}
