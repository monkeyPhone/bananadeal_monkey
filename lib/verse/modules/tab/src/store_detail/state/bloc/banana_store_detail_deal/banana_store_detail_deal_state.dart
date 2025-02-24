part of 'banana_store_detail_deal_bloc.dart';

final class BananaStoreDetailDealState extends Equatable {
  final StatusEnum statusEnum;
  final List<MyDealDetailVO> myDeal;

  const BananaStoreDetailDealState({
    this.statusEnum = StatusEnum.initial,
    this.myDeal = const [],

  });

  BananaStoreDetailDealState copyWith({
    StatusEnum? statusEnum,
    List<MyDealDetailVO>? myDeal,
    // List<EstimateVO>? estimateList,
  }) => BananaStoreDetailDealState(
    statusEnum: statusEnum ?? this.statusEnum,
    myDeal: myDeal ?? this.myDeal,
  );

  @override
  List<Object> get props => [statusEnum, myDeal];
}


// Stream<((StatusEnum, List<MyDealDetailVO>),(StatusEnum, List<MyDealListVO>))> initData();
// Stream<(StatusEnum, List<MyDealDetailVO>)> fetchDealData();
// Stream<(StatusEnum, List<MyDealListVO>)> fetchListData();