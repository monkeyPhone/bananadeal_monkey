import 'package:banana_deal_by_monkeycompany/app/modules/naver_maps/pages/naver_marker/naver_marker_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:get/get.dart';
import '../../../../../../../../../src/src_components/controllers/src_info_controller.dart';


class NaverMapStackMapSet extends GetView<NaverMarkerController> {
  const NaverMapStackMapSet({
    super.key});

  @override
  Widget build(BuildContext context) {
    return  NaverMap(
      options: NaverMapViewOptions(
          initialCameraPosition: NCameraPosition(
              target: NLatLng(
                  double.parse(SrcInfoController.to.infoM.value.mLatitude),
                  double.parse(SrcInfoController.to.infoM.value.mLongitude)
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
