import 'package:banana_deal_by_monkeycompany/app/css/app_basic_component/bagic_canvas.dart';
import 'package:banana_deal_by_monkeycompany/app/css/app_basic_component/basic_app_bar.dart';
import 'package:banana_deal_by_monkeycompany/app/css/app_basic_component/basic_app_bar_text.dart';
import 'package:banana_deal_by_monkeycompany/app/css/size.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/naver_maps/pages/naver_marker/naver_marker_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/naver_maps/pages/naver_marker/widgets/helper/appbar/init_position_icon.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/naver_maps/pages/naver_marker/widgets/helper/bottom_nav/naver_map_nav_bar.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/naver_maps/pages/naver_marker/widgets/helper/body/bottom_view/naver_map_bottom_view.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/naver_maps/pages/naver_marker/widgets/naver_map_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class NaverMarkerView extends StatelessWidget {
  final int routeCase;
  const NaverMarkerView({
    required this.routeCase,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasicCanvas(
        canPop: false,
        body: Column(
          children: [
            _Appbar(),
            Expanded(
                child: Column(
                  children: [
                    NaverMapView(),
                    Expanded(
                      child: SingleChildScrollView(
                          child: NaverMapBottomView()
                      ),
                    )
                  ],
                ),
            )
          ],
        ),
      bottomNavigationBar: NaverMapNavBar(routeCase: routeCase,),
    );
  }
}

class _Appbar extends GetView<NaverMarkerController> {
  const _Appbar();

  @override
  Widget build(BuildContext context) {
    return ObxValue((complete) =>
        complete.value
            ?  BasicAppbar(
          title: BasicAppBarText(text: '지도에서 위치 선택',),
          actions: InitPositionIcon(),
        ) :
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


