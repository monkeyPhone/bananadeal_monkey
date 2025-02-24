import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/change_map/widgets/result_area_components/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../css/size.dart';
import '../../../../../../naver_maps/pages/naver_marker_static/naver_marker_static_controller.dart';
import '../../../../../../naver_maps/pages/naver_marker_static/naver_marker_static_view.dart';
import '../../change_map_controller.dart';

class LastView extends GetView<ChangeMapController> {
  const LastView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const RoadTextBold(text: '검색 결과를 확인해보세요.'),
        SizedBox(height: WidgetSize(context).sizedBox20,),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: WidgetSize(context).sizedBox34),
          child: RoadTextBrownCenter(text: controller.addr.value),
        ),
        SizedBox(height: WidgetSize(context).sizedBox12,),
        GetBuilder<ChangeMapController>(
            builder: (cos){
              return cos.dong.value == controller.addr.value ? const SizedBox() : RoadTextBrown(text: cos.dong.value);
            }
        ),
        SizedBox(height: WidgetSize(context).sizedBox20,),
        _outlineButton(context),
        //_iconButton(),
        SizedBox(height: WidgetSize(context).sizedBox20,),
        const RoadTextGrey14(text: '아래 저장하기 버튼을 눌러 계속 진행해주세요.'),
      ],
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
                    road: controller.addr.value, latitude: double.parse(controller.latitude.value), longtitude: double.parse(controller.longtitude.value),), binding:
          BindingsBuilder(() {
            Get.put(NaverMarkerStaticController());
          }));
        },
        child:  Padding(
          padding: EdgeInsets.all(WidgetSize(context).sizedBox5),
          child: Text('지도에서 확인', style: TextStyle(fontSize: WidgetSize(context).sizedBox18, color: Colors.brown),),
        )
    );
  }
}
