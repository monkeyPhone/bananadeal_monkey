part of 'banana_home_rank_bloc.dart';

sealed class BananaHomeRankEvent extends Equatable {
  const BananaHomeRankEvent();

  @override
  List<Object> get props => [];
}

final class GetHomeRank extends BananaHomeRankEvent {
  final bool isLoading;
  const GetHomeRank({
    required this.isLoading,
  });
}


final class GotoRankAll extends BananaHomeRankEvent{
  final BuildContext context;
  final void Function(RankVO rank) callback;
  const GotoRankAll({
    required this.context,
    required this.callback,
  });
}