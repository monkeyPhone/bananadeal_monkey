part of 'banana_store_search_bloc.dart';


sealed class BananaStoreSearchEvent extends Equatable{
  const BananaStoreSearchEvent();

  @override
  List<Object> get props => [];
}


final class FetchStore extends BananaStoreSearchEvent {
  final (int page, String keyword) option;

  const FetchStore({
    required this.option
  });
}



final class InitStore extends BananaStoreSearchEvent {

  const InitStore();

}

final class UpdateFavorite extends BananaStoreSearchEvent {
  final bool isFavorite;
  final int mIdx;
  final String smId;
  const UpdateFavorite({
    required this.isFavorite,
    required this.mIdx,
    required this.smId,
  });
}

final class UpdateAllShow extends BananaStoreSearchEvent{
  final (int page, String keyword) option;

  const UpdateAllShow({
    required this.option,
  });
}