part of 'banana_create_deal_init_bloc.dart';

sealed class BananaCreateDealInitEvent extends Equatable{
  const BananaCreateDealInitEvent();

  @override
  List<Object> get props => [];

}

final class InitInfo extends BananaCreateDealInitEvent{
  final (String psIdx, String ldcpName, String ldcpModel, String piPath)? selectModel;


  const InitInfo({
    required this.selectModel
  });
}

final class ChangeStepWidget extends BananaCreateDealInitEvent{
  final StepWidgetEnum step;
  const ChangeStepWidget(this.step);
}