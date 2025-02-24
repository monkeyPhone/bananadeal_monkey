import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../../css/size.dart';
import '../../../../../../../../../css/style.dart';
import '../../../../../controllers/search_phone_controllers/search_phone_detail_controller.dart';

class PhoneDetailFloatingActionButton extends GetView<SearchPhoneDetailController> {
  const PhoneDetailFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: WidgetSize(context).sizedBox88,
      height: WidgetSize(context).sizedBox48,
      child: ObxValue(
          (page)=> FloatingActionButton.extended(
            backgroundColor: Style.yellow,
            label: Text(
              !page.value
                  ? '설명보기'
                  : '스펙보기',
              style: TextStyle(
                  fontSize: WidgetSize(context).sizedBox16,
                  color: Style.brown,
                  fontWeight: FontWeight.w700
              ),),
            onPressed: (){
              controller.clickFloating();
            },

          )
        , controller.currentPage)


    );
  }
}
