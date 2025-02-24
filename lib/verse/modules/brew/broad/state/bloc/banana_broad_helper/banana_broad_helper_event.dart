part of 'banana_broad_helper_bloc.dart';

sealed class BananaBroadHelperEvent extends Equatable{
  const BananaBroadHelperEvent();

  @override
  List<Object> get props => [];

}

final class UpdateUserEvent extends BananaBroadHelperEvent {
  final Map<String, dynamic> dataMap;
  final int idx;
  final BuildContext context;
  const UpdateUserEvent({
    required this.dataMap,
    required this.idx,
    required this.context,
  });
}

final class LaunchUrlEvent extends BananaBroadHelperEvent{
  final String url;
  final BuildContext context;

  const LaunchUrlEvent({
    required this.url,
    required this.context,
  });
}

final class MapEvent extends BananaBroadHelperEvent{
  final BuildContext context;
  final UserVO userVO;
  final void Function(AddressVO addressVO) addressCallback;
  final void Function(int range) rangeCallback;
  const MapEvent({
    required this.context,
    required this.userVO,
    required this.addressCallback,
    required this.rangeCallback
  });
}

final class GotoBannerEvent extends BananaBroadHelperEvent{
  final BuildContext context;
  final HomeBannerVO banner;
  const GotoBannerEvent({
    required this.context,
    required this.banner,
  });
}

final class CarouselTapEvent extends BananaBroadHelperEvent{
  final BuildContext context;
  final HomeBannerVO? banner;
  const CarouselTapEvent({
    required this.context,
    required this.banner,
  });
}