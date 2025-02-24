part of 'banana_broad_deal_bloc.dart';


sealed class BananaBroadDealEvent extends Equatable{
  const BananaBroadDealEvent();

  @override
  List<Object> get props => [];

}

final class InitDealData extends BananaBroadDealEvent{
  const InitDealData();
}

final class GotoModelListDetailEvent extends BananaBroadDealEvent{
  final BuildContext context;
  final String psIdx;
  final bool? isIntro;
  final String ldcpName;

  const GotoModelListDetailEvent({
    required this.context,
    required this.psIdx,
    this.isIntro,
    required this.ldcpName,
  });

}

final class ExceptionMessageEvent extends BananaBroadDealEvent{
  final BuildContext context;

  const ExceptionMessageEvent({
    required this.context,
  });

}

final class RankTileClickEvent extends BananaBroadDealEvent{
  final BuildContext context;
  final RankVO rank;

  const RankTileClickEvent({
    required this.context,
    required this.rank,
  });

}





