import 'package:banana_deal_by_monkeycompany/app/modules/naver_maps/pages/components/map_draw_triangle.dart';
import 'package:banana_deal_by_monkeycompany/app/routes/const_element.dart';
import 'package:flutter/material.dart';
import '../../../../../../../../../css/size.dart';
import '../../../../../../../../../css/style.dart';

class NaverMapStackIcon extends StatelessWidget {
  const NaverMapStackIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return  Positioned(
        child: Center(
          child: Stack(
            children: [
              Container(
                color: Colors.transparent,
                width: WidgetSize(context).width01,
                height: WidgetSize(context).sizedBox114,
              ),
              Positioned(
                  top: 0,
                  child: Stack(
                    children: [
                      Container(
                        width: WidgetSize(context).width01,
                        height: WidgetSize(context).sizedBox57,
                        decoration: BoxDecoration(
                            color: Colors.transparent
                        ),
                      ),
                      Positioned(
                          bottom: 0,
                          child: Container(
                              width: WidgetSize(context).width01,
                              height: WidgetSize(context).width0065,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                              ),
                              child: CustomPaint(painter: MapDrawTriangle(),)
                          ))
                    ],
                  )),
              Positioned(
                  top: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: WidgetSize(context).width0017),
                    width: WidgetSize(context).width01,
                    height: WidgetSize(context).width01,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(WidgetSize(context).sizedBox134),
                        color: Style.yellow
                    ),
                    child: Image.asset(AppElement.iconBananaBrown, fit: BoxFit.fitWidth,),
                  )),
              Positioned(
                  bottom: 0,
                  child: Container(
                    width: WidgetSize(context).width01,
                    height: WidgetSize(context).sizedBox57,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                    ),
                  ))
            ],
          ),
        )
    );
  }
}
