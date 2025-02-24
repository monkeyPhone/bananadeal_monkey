part of 'banana_store_detail_deal_bloc.dart';

sealed class BananaStoreDetailDealEvent extends Equatable {
  const BananaStoreDetailDealEvent();

  @override
  List<Object> get props => [];

}

final class InitDealData extends BananaStoreDetailDealEvent{
  const InitDealData();
}
