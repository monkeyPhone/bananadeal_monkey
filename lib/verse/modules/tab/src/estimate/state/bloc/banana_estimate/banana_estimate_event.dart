part of 'banana_estimate_bloc.dart';

sealed class BananaEstimateEvent extends Equatable{
  const BananaEstimateEvent();

  @override
  List<Object> get props => [];
}

final class InitEstimate extends BananaEstimateEvent{
  const InitEstimate();
}

final class RisingEstimate extends BananaEstimateEvent{
  final int current;
  const RisingEstimate(this.current);
}

final class FetchEstimate extends BananaEstimateEvent{
  final StatusEnum statusEnum;
  final List<EstimateVO> valueList;
  const FetchEstimate({
    required this.valueList,
    required this.statusEnum
  });
}

final class FetchStatus extends BananaEstimateEvent{

  const FetchStatus();
}

// final class SortEstimate extends BananaEstimateEvent{
//   final int index;
//   const SortEstimate(this.index);
//
// }
