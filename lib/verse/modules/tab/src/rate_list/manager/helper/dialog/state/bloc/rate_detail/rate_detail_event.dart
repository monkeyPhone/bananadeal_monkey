part of 'rate_detail_bloc.dart';

sealed class RateDetailEvent extends Equatable{
  const RateDetailEvent();

  @override
  List<Object> get props => [];
}

final class InitData extends RateDetailEvent {
  const InitData();
}
