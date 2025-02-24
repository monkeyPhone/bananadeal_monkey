part of 'banana_info_user_bloc.dart';

sealed class BananaInfoUserEvent extends Equatable {
  const BananaInfoUserEvent();

  @override
  List<Object> get props => [];
}

final class BananaInfoUserFetchWidgetStatus extends BananaInfoUserEvent{
  final InfoUserStateEnum infoStateEnum;

  const BananaInfoUserFetchWidgetStatus(this.infoStateEnum);
}

final class BananaInfoUserFetchThumbNail extends BananaInfoUserEvent{
  final String thumbnail;

  const BananaInfoUserFetchThumbNail(this.thumbnail);
}

final class BananaInfoUserFetchNickName extends BananaInfoUserEvent{
  final String nickname;
  final String validate;
  const BananaInfoUserFetchNickName({
    required this.nickname,
    required this.validate
  });
}

final class BananaInfoUserCheckNickName extends BananaInfoUserEvent{
  const BananaInfoUserCheckNickName();
}

final class BananaInfoUserFetchCrop extends BananaInfoUserEvent{
  const BananaInfoUserFetchCrop();
}


final class BananaInfoUserFetchAddress extends BananaInfoUserEvent{
  final AddressVO data;

  const BananaInfoUserFetchAddress({
    required this.data
  });
}

final class BananaInfoUserFetchFinish extends BananaInfoUserEvent{
  const BananaInfoUserFetchFinish();
}

final class BackSpaceEvent extends BananaInfoUserEvent{
  final BuildContext context;
  const BackSpaceEvent(this.context);
}

final class OnTapEvent extends BananaInfoUserEvent{
  const OnTapEvent();
}

final class NavEvent extends BananaInfoUserEvent{
  const NavEvent();
}

final class WebCropEvent extends BananaInfoUserEvent{
  final BuildContext context;
  final bool isCamera;
  const WebCropEvent({
    required this.context,
    required this.isCamera
  });
}

final class ThumbNailFetchEvent extends BananaInfoUserEvent{
  final BuildContext context;
  final int index;
  final void Function(String thumbNail) callBack;
  const ThumbNailFetchEvent({
    required this.context,
    required this.index,
    required this.callBack
  });
}