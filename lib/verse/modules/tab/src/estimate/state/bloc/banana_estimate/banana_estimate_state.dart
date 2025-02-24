part of 'banana_estimate_bloc.dart';

final class BananaEstimateState extends Equatable {
  final StatusEnum statusEnum;
  final List<EstimateVO> estimateList;
  const BananaEstimateState({
    this.statusEnum = StatusEnum.initial,
    this.estimateList = const []
  });

  BananaEstimateState copyWith({
    StatusEnum? statusEnum,
    List<EstimateVO>? estimateList
  }) => BananaEstimateState(
    statusEnum: statusEnum ?? this.statusEnum,
    estimateList: estimateList ?? this.estimateList
  );

  @override
  List<Object> get props => [statusEnum, estimateList];
}
