import 'package:banana_deal_by_monkeycompany/app/components/text_class/text_class.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../../css/size.dart';
import '../../../../../../../../naver_maps/pages/naver_marker_static/naver_marker_static_controller.dart';
import '../../../../../../../../naver_maps/pages/naver_marker_static/naver_marker_static_view.dart';

class Sign4LastView extends StatelessWidget {
  final String addr;
  final String dong;
  final String latitude;
  final String longtitude;
  const Sign4LastView({
    required this.addr,
    required this.dong,
    required this.latitude,
    required this.longtitude,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: SizedBox(
          width: WidgetSize(context).widthCommon,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              RoadSearchTextResultBold(text: '검색 결과를 확인해보세요.'),
              SizedBox(height: WidgetSize(context).sizedBox20,),
              RoadSearchTextBrown(text: addr),
              SizedBox(height: WidgetSize(context).sizedBox8,),
              addr == dong
                  ? SizedBox()
                  : RoadSearchTextBrown(text: dong),
              SizedBox(height: WidgetSize(context).sizedBox20,),
              _outlineButton(context),
              SizedBox(height: WidgetSize(context).sizedBox20,),
              RoadTextGrey14Px(text: '아래 다음 버튼을 눌러 계속 진행해주세요.'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _outlineButton(BuildContext context){
    return OutlinedButton(
        style: OutlinedButton.styleFrom(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(WidgetSize(context).sizedBox17),
          ),
          side: BorderSide(
              color: Colors.brown,
              width: WidgetSize(context).sizedBox1_5
          ),
        ),
        onPressed: (){
          Get.to(
                  () => NaverMarkerStaticView(
                road: addr,
                latitude: double.parse(latitude),
                longtitude: double.parse(longtitude),
              ),
              binding: BindingsBuilder(
                      () {
                    Get.put(NaverMarkerStaticController());
                  }
              )
          );
        },
        child:  Padding(
          padding: EdgeInsets.all(WidgetSize(context).sizedBox5),
          child: Text(
            '지도에서 확인',
            style: TextStyle(
                fontSize: WidgetSize(context).sizedBox18,
                color: Colors.brown
            ),
          ),
        )
    );
  }

}
