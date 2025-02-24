import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:get/get.dart';
import '../../../../../../naver_marker_controller.dart';


class NaverStackMapInit extends GetView<NaverMarkerController> {
  final double latitude;
  final double longtitude;
  const NaverStackMapInit({
    required this.latitude,
    required this.longtitude,
    super.key});

  @override
  Widget build(BuildContext context) {
    return NaverMap(
      options: NaverMapViewOptions(
          initialCameraPosition: NCameraPosition(
              target: NLatLng(
                  latitude,
                  longtitude
              ),
              zoom: 17
          ),
          logoClickEnable: false,
          locationButtonEnable: false,
          mapType: NMapType.basic,
          locale: Locale('ko')
      ),
      forceGesture: true,
      onMapReady: controller.onMapReady,
      onMapTapped: controller.onMapTap,
      onCameraChange: controller.cameraChange,
      onCameraIdle: controller.cameraFinish,
    );
  }
}
