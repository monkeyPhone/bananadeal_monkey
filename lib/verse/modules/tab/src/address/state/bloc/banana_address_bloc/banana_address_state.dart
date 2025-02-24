part of 'banana_address_bloc.dart';

final class BananaAddressState extends Equatable {
  final AddressSearchEntity addressSearch;
  final String search;
  final AddressVO addressVO;
  final int currentPage;
  final int maxPage;

  const BananaAddressState({
    this.addressSearch = ModelConfig.addressSearchEntity,
    this.search = '',
    this.addressVO = ModelConfig.addressVO,
    this.currentPage = 1,
    this.maxPage = 0,
  });

  BananaAddressState copyWith({
    AddressSearchEntity? addressSearch,
    String? search,
    AddressVO? addressVO,
    int? currentPage,
    int? maxPage,

  }) => BananaAddressState(
      addressSearch: addressSearch ?? this.addressSearch,
      search: search ?? this.search,
      addressVO: addressVO ?? this.addressVO,
      currentPage: currentPage ?? this.currentPage,
      maxPage: maxPage ?? this.maxPage
  );

  @override
  List<Object?> get props => [addressSearch, search, addressVO, currentPage, maxPage,];

}