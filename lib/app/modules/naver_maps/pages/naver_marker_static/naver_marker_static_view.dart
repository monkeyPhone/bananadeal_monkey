import 'package:banana_deal_by_monkeycompany/app/css/app_basic_component/basic_app_bar_text.dart';
import 'package:banana_deal_by_monkeycompany/app/css/size.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/naver_maps/pages/naver_marker_static/naver_marker_static_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/naver_maps/pages/naver_marker_static/widgets/helper/naver_map_static_appbar.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/naver_maps/pages/naver_marker_static/widgets/helper/naver_map_static_nav_bar.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/naver_maps/pages/naver_marker_static/widgets/naver_map_static_bottom.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/naver_maps/pages/naver_marker_static/widgets/naver_map_view_static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../css/app_basic_component/bagic_canvas.dart';


class NaverMarkerStaticView extends StatelessWidget {
  final String? name;
  final String road;
  final double latitude;
  final double longtitude;
  const NaverMarkerStaticView({
          this.name,
          required this.road,
          required this.latitude,
          required this.longtitude,
          Key? key
        }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasicCanvas(
        canPop: false,
        body: Column(
          children: [
            _Appbar(
              name: name ?? '',
            ),
            Expanded(
                child: Column(
                  children: [
                    NaverMapViewStatic(
                      latitude: latitude,
                      longtitude: longtitude,
                    ),
                    NaverMapStaticBottom(road: road,)
                  ],
                )
            )
          ],
        ),
        bottomNavigationBar: NaverMapStaticNavBar());
  }

}


class _Appbar extends GetView<NaverMarkerStaticController> {
  final String name;
  const _Appbar({
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return ObxValue((complete) =>
    complete.value
        ?   NaverMapStaticAppBar(name: name)
        :
    SizedBox(
      height: WidgetSize(context).height60px,
      width: WidgetSize(context).widthCommon,
      child: Padding(
        padding: EdgeInsets.only(left: WidgetSize(context).sizedBox8, right: WidgetSize(context).sizedBox5),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: WidgetSize(context).sizedBox5),
          child: BasicAppBarText(text: '잠시만 기다려주세요.',),
        ),
      ),
    )
        , controller.isComplete);
  }
}
