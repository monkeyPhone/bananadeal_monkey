part of 'banana_invite_deal_store_bloc.dart';


sealed class BananaInviteDealStoreEvent extends Equatable {
  const BananaInviteDealStoreEvent();

  @override
  List<Object> get props => [];
}

final class StoreInitData extends BananaInviteDealStoreEvent {
  const StoreInitData();
}

final class ChangeStoreStatus extends BananaInviteDealStoreEvent {
  final StatusEnum status;
  const ChangeStoreStatus(this.status);
}

final class FetchStoreData extends BananaInviteDealStoreEvent {
  final int page;
  const FetchStoreData({
    required this.page
  });
}

final class LoadingBar extends BananaInviteDealStoreEvent {
  const LoadingBar();
}