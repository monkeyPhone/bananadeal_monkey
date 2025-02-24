part of 'banana_store_search_option_bloc.dart';

final class BananaStoreSearchOptionState extends Equatable {
  final int page;
  final String keyword;
  final bool isUpdate;
  final bool isFavorite;

  const BananaStoreSearchOptionState({
    this.page = 0,
    this.keyword = '',
    this.isUpdate = false,
    this.isFavorite = false,
  });

  BananaStoreSearchOptionState copyWith({
    int? page,
    String? keyword,
    bool? isUpdate,
    bool? isFavorite,
  }) => BananaStoreSearchOptionState(
      page: page ?? this.page,
      keyword: keyword ?? this.keyword,
      isUpdate: isUpdate ?? this.isUpdate,
      isFavorite: isFavorite ?? this.isFavorite
  );

  @override
  List<Object> get props => [
    page, keyword, isUpdate, isFavorite
  ];

}