part of 'banana_home_banner_bloc.dart';

final class BananaHomeBannerState extends Equatable {
  final StatusEnum statusEnum;
  final List<HomeBannerVO> bannerList;

  const BananaHomeBannerState({
    this.statusEnum = StatusEnum.initial,
    this.bannerList = const []
  });

  BananaHomeBannerState copyWith({
    StatusEnum? statusEnum,
    List<HomeBannerVO>? bannerList,
  }) => BananaHomeBannerState(
      statusEnum: statusEnum ?? this.statusEnum,
      bannerList:  bannerList ?? this.bannerList
  );

  @override
  List<Object> get props => [statusEnum, bannerList];

}