part of 'banana_store_bloc.dart';

final class BananaStoreState extends Equatable {
  final StatusEnum statusEnum;
  final List<StoreVO> storeShow;

  const BananaStoreState({
    this.statusEnum = StatusEnum.initial,
    this.storeShow = const [],
  });

  BananaStoreState copyWith({
    StatusEnum? statusEnum,
    // List<StoreVO>? storeDistance,
    // List<StoreVO>? storeAvgPoint,
    // List<StoreVO>? storeParticipation,
    // List<StoreVO>? storeFavorite,
    List<StoreVO>? storeShow
  }) => BananaStoreState(
      statusEnum: statusEnum ?? this.statusEnum,
      storeShow: storeShow ?? this.storeShow
  );

  @override
  List<Object> get props => [
    statusEnum, storeShow
  ];
}