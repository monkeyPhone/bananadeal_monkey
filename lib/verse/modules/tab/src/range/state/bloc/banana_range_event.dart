part of 'banana_range_bloc.dart';


sealed class BananaRangeEvent extends Equatable {
  const BananaRangeEvent();

  @override
  List<Object> get props => [];
}

final class FetchCurrent extends BananaRangeEvent {
  final int currentRange;
  const FetchCurrent({
    required this.currentRange,
  });
}

final class FetchSelect extends BananaRangeEvent {
  final int selectIndex;
  const FetchSelect({
    required this.selectIndex,
  });
}