part of 'banana_broad_deal_bloc.dart';

final class BananaBroadDealState extends Equatable {
  final StatusEnum statusEnum;
  final List<MyDealDetailVO> myDealInfo;
  final List<EstimateVO> estimateList1;
  final List<EstimateVO> estimateList2;

  const BananaBroadDealState({
    this.statusEnum = StatusEnum.initial,
    this.myDealInfo = const [],
    this.estimateList1 = const [],
    this.estimateList2 = const []
  });

  BananaBroadDealState copyWith({
    StatusEnum? statusEnum,
    List<MyDealDetailVO>? myDealInfo,
    List<EstimateVO>? estimateList1,
    List<EstimateVO>? estimateList2,
  }) => BananaBroadDealState(
      statusEnum: statusEnum ?? this.statusEnum,
      myDealInfo: myDealInfo ?? this.myDealInfo,
      estimateList1: estimateList1 ?? this.estimateList1,
      estimateList2: estimateList2 ?? this.estimateList2,
  );

  @override
  List<Object> get props => [statusEnum, myDealInfo, estimateList1, estimateList2];

}
