import 'package:banana_deal_by_monkeycompany/app/modules/naver_maps/pages/components/map_draw_triangle.dart';
import 'package:flutter/material.dart';
import '../../../../../../css/size.dart';
import '../../../../../../css/style.dart';
import '../../../../../../routes/const_element.dart';


class NaverMapViewStaticStackIcon extends StatelessWidget {
  const NaverMapViewStaticStackIcon({
    super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        child: Center(
          child: Stack(
            children: [
              Container(
                color: Colors.transparent,
                width: WidgetSize(context).width01,
                height: WidgetSize(context).sizedBox114,
              ),
              //막대기 콘
              Positioned(
                  top: 0,
                  child: Stack(
                    children: [
                      Container(
                        width: WidgetSize(context).width01,
                        height: WidgetSize(context).sizedBox57,
                        decoration: const BoxDecoration(color: Colors.transparent),
                      ),
                      Positioned(
                          bottom: 0,
                          child: Container(
                              width: WidgetSize(context).width01,
                              height: WidgetSize(context).sizedBox28,
                              decoration: const BoxDecoration(
                                color: Colors.transparent,
                              ),
                              child: CustomPaint(
                                painter: MapDrawTriangle(),
                              )))
                    ],
                  )
              ),
              //아이콘
              Positioned(
                  top: 0,
                  child: Container(
                    padding:
                    EdgeInsets.symmetric(horizontal: WidgetSize(context).sizedBox7_5),
                    width: WidgetSize(context).width01,
                    height: WidgetSize(context).width01,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(WidgetSize(context).widthCommon),
                        color: Style.yellow),
                    child: Image.asset(
                      AppElement.iconBananaBrown,
                      fit: BoxFit.fitWidth,
                    ),
                  )),
            ],
          ),
        )
    );
  }
}
