part of 'banana_home_rank_bloc.dart';

final class BananaHomeRankState extends Equatable {
  final StatusEnum status;
  final List<RankVO> rankAll;
  final List<RankVO> rankPremium;
  final List<RankVO> rankHigh;
  final List<RankVO> rankNormal;
  final List<RankVO> rankWorthy;

  const BananaHomeRankState({
    this.status = StatusEnum.initial,
    this.rankAll = const [],
    this.rankPremium = const [],
    this.rankHigh = const [],
    this.rankNormal = const [],
    this.rankWorthy = const [],
  });

  BananaHomeRankState copyWith({
    StatusEnum? status,
    List<RankVO>? rankAll,
    List<RankVO>? rankPremium,
    List<RankVO>? rankHigh,
    List<RankVO>? rankNormal,
    List<RankVO>? rankWorthy,
  }) => BananaHomeRankState(
      status: status ?? this.status,
      rankAll: rankAll ?? this.rankAll,
      rankPremium: rankPremium ?? this.rankPremium,
      rankHigh: rankHigh ?? this.rankHigh,
      rankNormal: rankNormal ?? this.rankNormal,
      rankWorthy: rankWorthy ?? this.rankWorthy,
  );

  @override
  List<Object> get props => [status, rankAll,
    rankPremium, rankHigh, rankNormal, rankWorthy];

}