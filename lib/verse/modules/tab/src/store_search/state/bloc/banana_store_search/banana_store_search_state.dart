part of 'banana_store_search_bloc.dart';

final class BananaStoreSearchState extends Equatable {
  final StatusEnum statusEnum;
  final List<StoreVO> storeShow;

  const BananaStoreSearchState({
    this.statusEnum = StatusEnum.initial,
    this.storeShow = const [],
  });

  BananaStoreSearchState copyWith({
    StatusEnum? statusEnum,
    List<StoreVO>? storeShow
  }) => BananaStoreSearchState(
      statusEnum: statusEnum ?? this.statusEnum,
      storeShow: storeShow ?? this.storeShow
  );

  @override
  List<Object> get props => [
    statusEnum, storeShow
  ];
}