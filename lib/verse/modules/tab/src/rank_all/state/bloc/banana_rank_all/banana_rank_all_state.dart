part of 'banana_rank_all_bloc.dart';

final class BananaRankAllState extends Equatable {
  final int isList;
  final RankEnum rankEnum;
  final List<RankVO> rankAll;
  final List<RankVO> rankPremium;
  final List<RankVO> rankHigh;
  final List<RankVO> rankNormal;
  final List<RankVO> rankWorthy;

  const BananaRankAllState({
    this.isList = 0,
    this.rankEnum = RankEnum.all,
    this.rankAll = const [],
    this.rankPremium = const [],
    this.rankHigh = const [],
    this.rankNormal = const [],
    this.rankWorthy = const [],
  });

  BananaRankAllState copyWith({
    int? isList,
    RankEnum? rankEnum,
    List<RankVO>? rankAll,
    List<RankVO>? rankPremium,
    List<RankVO>? rankHigh,
    List<RankVO>? rankNormal,
    List<RankVO>? rankWorthy,
  }) => BananaRankAllState(
    isList: isList ?? this.isList,
    rankEnum: rankEnum ?? this.rankEnum,
    rankAll: rankAll ?? this.rankAll,
    rankPremium: rankPremium ?? this.rankPremium,
    rankHigh: rankHigh ?? this.rankHigh,
    rankNormal: rankNormal ?? this.rankNormal,
    rankWorthy: rankWorthy ?? this.rankWorthy,
  );


  @override
  List<Object> get props => [isList, rankEnum ,rankAll,
    rankPremium, rankHigh, rankNormal, rankWorthy,];
}