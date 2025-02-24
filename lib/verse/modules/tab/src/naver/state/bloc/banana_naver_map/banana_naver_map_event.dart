part of 'banana_naver_map_bloc.dart';

sealed class BananaNaverMapEvent extends Equatable {
  const BananaNaverMapEvent();

  @override
  List<Object> get props => [];
}

final class OnMapReady extends BananaNaverMapEvent{
  final NaverMapController controller;
  const OnMapReady({
    required this.controller,
  });
}

final class OnMapTap extends BananaNaverMapEvent{
  final NLatLng latLng;
  const OnMapTap({
    required this.latLng,
  });
}

final class CameraChange extends BananaNaverMapEvent{
  const CameraChange();
}

final class CameraFinish extends BananaNaverMapEvent{
  const CameraFinish();
}

final class InitPosition extends BananaNaverMapEvent{
  final (double, double) currentNat;
  final double zoom;
  const InitPosition({
    required this.currentNat,
    required this.zoom,
  });
}

final class Dispose extends BananaNaverMapEvent{
  const Dispose();
}

