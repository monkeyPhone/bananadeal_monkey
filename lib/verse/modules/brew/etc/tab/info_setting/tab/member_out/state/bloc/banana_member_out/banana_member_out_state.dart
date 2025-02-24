part of 'banana_member_out_bloc.dart';

final class BananaMemberOutState extends Equatable {
  final int currentIndex;
  final String answer;
  final StatusEnum statusEnum;
  const BananaMemberOutState({
    this.currentIndex = 5,
    this.answer = '',
    this.statusEnum = StatusEnum.initial
  });

  BananaMemberOutState copyWith({
    int? currentIndex,
    String? answer,
    StatusEnum? statusEnum,
  }) => BananaMemberOutState(
    currentIndex: currentIndex ?? this.currentIndex,
    answer: answer ?? this.answer,
    statusEnum: statusEnum ?? this.statusEnum
  );

  @override
  List<Object> get props => [currentIndex, answer, statusEnum];

}
