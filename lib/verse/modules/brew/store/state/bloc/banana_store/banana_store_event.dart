part of 'banana_store_bloc.dart';

sealed class BananaStoreEvent extends Equatable{
  const BananaStoreEvent();

  @override
  List<Object> get props => [];
}

final class FirstData extends BananaStoreEvent{
  const FirstData();
}


final class FetchStore extends BananaStoreEvent {
  final int currentSort;
  final (int page, String order, String orderBy) option;

  const FetchStore({
    required this.currentSort,
    required this.option
  });
}

final class CheckUpdate extends BananaStoreEvent {
  final List<StoreVO> store;

  const CheckUpdate({
    required this.store,
  });

}

final class UpdateFavorite extends BananaStoreEvent {
  final bool isFavorite;
  final int mIdx;
  final String smId;
  const UpdateFavorite({
    required this.isFavorite,
    required this.mIdx,
    required this.smId,
  });
}

final class UpdateAllShow extends BananaStoreEvent{
  final int currentSort;
  final (int page, String order, String orderBy) option;

  const UpdateAllShow({
    required this.currentSort,
    required this.option,
  });
}