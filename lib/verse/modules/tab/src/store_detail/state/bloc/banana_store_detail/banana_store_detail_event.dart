part of 'banana_store_detail_bloc.dart';


sealed class BananaStoreDetailEvent extends Equatable {
  const BananaStoreDetailEvent();

  @override
  List<Object> get props => [];

}

final class StoreDetailGetInfo extends BananaStoreDetailEvent {
  const StoreDetailGetInfo();
}

final class UpdateFavorite extends BananaStoreDetailEvent {
  const UpdateFavorite();
}