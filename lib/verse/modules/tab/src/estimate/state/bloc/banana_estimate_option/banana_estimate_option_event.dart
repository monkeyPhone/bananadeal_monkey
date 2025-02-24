part of 'banana_estimate_option_bloc.dart';

sealed class BananaEstimateOptionEvent extends Equatable{
  const BananaEstimateOptionEvent();

  @override
  List<Object> get props => [];
}

final class InitOption extends BananaEstimateOptionEvent {
  const InitOption();
}

final class ConvertDStatus extends BananaEstimateOptionEvent {
  final int diIdx;
  final String diStatus;
  const ConvertDStatus({
    required this.diIdx,
    required this.diStatus
  });
}

final class ChangeUpdate extends BananaEstimateOptionEvent{
  final bool isUpdate;

  const ChangeUpdate({
    required this.isUpdate,
  });
}

final class ChangePage extends BananaEstimateOptionEvent{
  final int index;

  const ChangePage({
    required this.index,
  });
}

final class ChangeSort extends BananaEstimateOptionEvent{
  final int index;
  const ChangeSort({
    required this.index
  });
}

final class SetController extends BananaEstimateOptionEvent{
  final ScrollController controller;
  const SetController(this.controller);
}
