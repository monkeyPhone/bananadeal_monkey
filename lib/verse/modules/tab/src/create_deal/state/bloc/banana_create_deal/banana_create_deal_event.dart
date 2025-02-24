part of 'banana_create_deal_bloc.dart';

sealed class BananaCreateDealEvent extends Equatable {
  const BananaCreateDealEvent();

  @override
  List<Object> get props => [];
}


final class NextStep extends BananaCreateDealEvent{

  const NextStep();
}

final class PreviousStep extends BananaCreateDealEvent{

  const PreviousStep();
}

final class ChangeCreateState extends BananaCreateDealEvent {
  final dynamic value;

  const ChangeCreateState({
    required this.value
  });
}

final class InitModel extends BananaCreateDealEvent {
  const InitModel();
}



final class SetModel extends BananaCreateDealEvent{
  final (String psIdx, String ldcpName, String ldcpModel, String piPath) selectModel;
  const SetModel({
    required this.selectModel,
  });
}

final class SetPromotion extends BananaCreateDealEvent{
  final PromotionEnum promotionEnum;
  final String value;

  const SetPromotion({
    required this.promotionEnum,
    required this.value
  });
}

final class ShowSheetEvent extends BananaCreateDealEvent{
  final BuildContext context;
  final bool isCurrent;

  const ShowSheetEvent({
    required this.context,
    required this.isCurrent,
  });
}

