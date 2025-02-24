part of 'banana_range_bloc.dart';

final class BananaRangeState extends Equatable {
  final int selectRange;
  final int selectIndex;
  final int currentRange;
  final int currentIndex;

  const BananaRangeState({
    this.selectRange = 0,
    this.selectIndex = 0,
    this.currentRange = 0,
    this.currentIndex = 0
  });

  BananaRangeState copyWith({
    int? selectRange,
    int? selectIndex,
    int? currentRange,
    int? currentIndex
  }) => BananaRangeState(
      selectRange: selectRange ?? this.selectRange,
      selectIndex: selectIndex ?? this.selectIndex,
      currentRange: currentRange ?? this.currentRange,
      currentIndex: currentIndex ?? this.currentIndex
  );

  @override
  List<Object> get props => [selectRange, selectIndex, currentRange, currentIndex];
}