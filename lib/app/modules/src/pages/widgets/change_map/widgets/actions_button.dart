import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_text_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../css/size.dart';
import '../../../../../../css/style.dart';
import '../change_map_controller.dart';

class ActionsButton extends StatelessWidget {
  const ActionsButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChangeMapController>(
      builder: (controller){
        return
          controller.rangeChange.value
            ? Row(
          children: [
            SizedBox(width: WidgetSize(context).sizedBox6_5),
            Text('위치 범위 선택',
              style: TextStyle(color: Style.blackWrite, fontSize: WidgetSize(context).sizedBox24, fontWeight: FontWeight.w700),
            ),
          ],
        )
            :
          controller.longtitude.value == '' && controller.latitude.value == '' && controller.dong.value == '' && controller.addr.value == ''
              ?  RippleTextButton(
                    onTap: () {
                      controller.rangeChangeButton();
                    },
                    text: '위치 범위 선택',
                    fontSize: WidgetSize(context).sizedBox17,
                    fontColor: Colors.blue,
                 )
              : controller.msg.value.status == 200
                  ? const SizedBox()
                  : RippleTextButton(
            onTap: () {
              controller.initSelect();
            },
            fontColor: Colors.red,
            text: '재검색',
            fontSize: WidgetSize(context).sizedBox17,

          );
      },
    );
  }
}
