part of 'banana_rank_all_bloc.dart';

sealed class BananaRankAllEvent extends Equatable {
  const BananaRankAllEvent();

  @override
  List<Object> get props => [];

}

final class GetAllRank extends BananaRankAllEvent{
  final List<RankVO> rankAll;
  final List<RankVO> rankPremium;
  final List<RankVO> rankHigh;
  final List<RankVO> rankNormal;
  final List<RankVO> rankWorthy;

  const GetAllRank({
    required this.rankAll,
    required this.rankPremium,
    required this.rankHigh,
    required this.rankNormal,
    required this.rankWorthy,
  });
}

final class ChangeCategory extends BananaRankAllEvent {
  final RankEnum rankEnum;

  const ChangeCategory(this.rankEnum);
}


final class ChangeList extends BananaRankAllEvent{

  const ChangeList();
}

