import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../css/size.dart';
import 'helper/body/map_view/map/naver_map_stack_map/naver_map_stack_map.dart';

class NaverMapView extends StatelessWidget {
  const NaverMapView({
    super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: WidgetSize(context).widthCommon,
      height: GetPlatform.isIOS ? WidgetSize(context).staticMapSize : WidgetSize(context).staticMapSize - WidgetSize(context).sizedBox16,
      child: NaverMapStackMap()
    );
  }
}


