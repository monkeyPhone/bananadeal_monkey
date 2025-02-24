part of 'banana_broad_nav_bloc.dart';

final class BananaBroadNavState extends Equatable {

  final NavEnum currentPage;

  const BananaBroadNavState({
    this.currentPage = NavEnum.home
  });

  BananaBroadNavState copyWith({
    NavEnum? currentPage,
  }) => BananaBroadNavState(
      currentPage: currentPage ?? this.currentPage
  );

  @override
  List<Object> get props => [currentPage];

}
