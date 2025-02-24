part of 'banana_store_search_option_bloc.dart';

sealed class BananaStoreSearchOptionEvent extends Equatable {
  const BananaStoreSearchOptionEvent();

  @override
  List<Object> get props => [];

}


final class ChangePage1 extends BananaStoreSearchOptionEvent{
  final int page;
  const ChangePage1(this.page);
}

final class ChangeUpdate extends BananaStoreSearchOptionEvent{
  final bool value;

  const ChangeUpdate(this.value);
}

final class ChangeFavorite extends BananaStoreSearchOptionEvent{
  final bool value;

  const ChangeFavorite(this.value);
}

final class FetchKeyword extends BananaStoreSearchOptionEvent {
  final String keyword;
  const FetchKeyword(this.keyword);
}