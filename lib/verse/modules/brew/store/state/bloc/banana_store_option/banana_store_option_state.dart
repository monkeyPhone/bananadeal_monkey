part of 'banana_store_option_bloc.dart';

final class BananaStoreOptionState extends Equatable {
  final int currentSort;
  final String order;
  final String orderBy;
  final int page;
  final int distancePage;
  final int pointPage;
  final int participationPage;
  final int favoritePage;
  final bool isUpdate;

  const BananaStoreOptionState({
    this.currentSort = 0,
    this.order = 'distance',
    this.orderBy = 'ASC',
    this.page = 0,
    this.distancePage = 0,
    this.pointPage = 0,
    this.participationPage = 0,
    this.favoritePage = 0,
    this.isUpdate = false,
  });

  BananaStoreOptionState copyWith({
    int? currentSort,
    String? order,
    String? orderBy,
    int? page,
    int? distancePage,
    int? pointPage,
    int? participationPage,
    int? favoritePage,
    bool? isUpdate,
  }) => BananaStoreOptionState(
      currentSort: currentSort ?? this.currentSort,
      order: order ?? this.order,
      orderBy: orderBy ?? this.orderBy,
      page: page ?? this.page,
      distancePage: distancePage ?? this.distancePage,
      pointPage: pointPage ?? this.pointPage,
      participationPage: participationPage ?? this.participationPage,
      favoritePage: favoritePage ?? this.favoritePage,
      isUpdate: isUpdate ?? this.isUpdate
  );

  @override
  List<Object> get props => [
    currentSort, order, orderBy,
    page, distancePage, pointPage, participationPage, favoritePage, isUpdate
  ];

}
