import 'package:banana_deal_by_monkeycompany/app/modules/naver_maps/pages/naver_marker_static/widgets/helper/naver_map_static.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/naver_maps/pages/naver_marker_static/widgets/helper/naver_map_view_static_stack_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../css/size.dart';


class NaverMapViewStatic extends StatelessWidget {
  final double latitude;
  final double longtitude;
  const NaverMapViewStatic({
    required this.latitude,
    required this.longtitude,
    super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: WidgetSize(context).widthCommon,
        height: GetPlatform.isIOS ? WidgetSize(context).staticMapSize : WidgetSize(context).staticMapSize - WidgetSize(context).sizedBox16,
        child: Stack(
          children: [
            NaverMapStatic(latitude: latitude, longtitude: longtitude,),
            NaverMapViewStaticStackIcon(),
          ],
        )
    );
  }
}
