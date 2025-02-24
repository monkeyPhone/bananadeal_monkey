part of 'banana_broad_deal_list_bloc.dart';


final class BananaBroadDealListState extends Equatable {
  final StatusEnum statusEnum;
  final List<MyDealListVO> dealList;
  final int currentPage;
  final int totalPages;
  const BananaBroadDealListState({
    this.statusEnum = StatusEnum.initial,
    this.dealList = const [],
    this.currentPage = 1,
    this.totalPages = 0,
  });

  BananaBroadDealListState copyWith({
    StatusEnum? statusEnum,
    List<MyDealListVO>? dealList,
    int? currentPage,
    int? totalPages,
  }) => BananaBroadDealListState(
      statusEnum: statusEnum ?? this.statusEnum,
      dealList: dealList ?? this.dealList,
      currentPage: currentPage ?? this.currentPage,
      totalPages: totalPages ?? this.totalPages
  );

  @override
  List<Object> get props => [statusEnum, dealList, currentPage, totalPages];
}
