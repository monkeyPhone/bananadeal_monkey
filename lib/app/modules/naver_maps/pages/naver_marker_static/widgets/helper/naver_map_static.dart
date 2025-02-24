import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:get/get.dart';
import '../../naver_marker_static_controller.dart';

class NaverMapStatic extends GetView<NaverMarkerStaticController> {
  final double latitude;
  final double longtitude;
  const NaverMapStatic({
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
            tiltGesturesEnable: false,
            scrollGesturesEnable: false,
            zoomGesturesEnable: true,
            locale: Locale('ko')
        ),
      onMapReady: controller.onMapReadyCase1,
    );
  }
}
