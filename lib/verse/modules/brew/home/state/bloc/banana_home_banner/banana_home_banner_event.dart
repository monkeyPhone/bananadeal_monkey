part of 'banana_home_banner_bloc.dart';

sealed class BananaHomeBannerEvent extends Equatable {
  const BananaHomeBannerEvent();

  @override
  List<Object> get props => [];

}

final class HomeBannerListFetch extends BananaHomeBannerEvent {
  final bool isLoading;
  const HomeBannerListFetch({
    required this.isLoading,
  });

}