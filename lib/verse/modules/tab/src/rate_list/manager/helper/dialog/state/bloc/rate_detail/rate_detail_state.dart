part of 'rate_detail_bloc.dart';

final class RateDetailState extends Equatable {
  final StatusEnum statusEnum;
  final List<PlanDetailDto> detail;
  const RateDetailState({
    this.statusEnum = StatusEnum.initial,
    this.detail = const []
  });

  RateDetailState copyWith({
    StatusEnum? statusEnum,
    List<PlanDetailDto>? detail
  }) => RateDetailState(
    statusEnum: statusEnum ?? this.statusEnum,
    detail: detail ?? this.detail
  );

  @override
  List<Object> get props => [statusEnum, detail];
}
