part of 'banana_broad_deal_list_bloc.dart';

sealed class BananaBroadDealListEvent extends Equatable {
  const BananaBroadDealListEvent();

  @override
  List<Object> get props => [];
}

final class InitDealList extends BananaBroadDealListEvent {
  const InitDealList();
}

final class ReloadDealList extends BananaBroadDealListEvent {
  const ReloadDealList();
}

final class FetchDealList extends BananaBroadDealListEvent {
  const FetchDealList();
}
