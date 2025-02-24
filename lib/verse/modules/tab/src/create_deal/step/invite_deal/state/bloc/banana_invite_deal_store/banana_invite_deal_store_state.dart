part of 'banana_invite_deal_store_bloc.dart';

final class BananaInviteDealStoreState extends Equatable {
  final StatusEnum statusEnum;
  final List<StoreVO> storeList;

  const BananaInviteDealStoreState({
    this.statusEnum = StatusEnum.initial,
    this.storeList = const []
  });

  BananaInviteDealStoreState copyWith({
    StatusEnum? statusEnum,
    List<StoreVO>? storeList
  }) => BananaInviteDealStoreState(
    statusEnum: statusEnum ?? this.statusEnum,
    storeList: storeList ?? this.storeList,
  );

  @override
  List<Object> get props => [statusEnum, storeList];
}
