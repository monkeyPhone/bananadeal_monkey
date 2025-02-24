import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_inquiry/etc_inquiry_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../css/size.dart';
import '../../../../../../../../css/style.dart';

class InquiryFloatingActionButton extends GetView<EtcInquiryController> {
  const InquiryFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ObxValue((p0) =>
    p0.isEmpty
        ?
    SizedBox(
      width: WidgetSize(context).srcFloatingActionBarSize,
      height: WidgetSize(context).srcFloatingActionBarSize,
      child: FloatingActionButton(
        backgroundColor: Style.yellow
        ,
        onPressed: (){
          controller.moveToSend();;
        },
        elevation: 1,
        child:  Center(
            child: Icon(Icons.add , size: WidgetSize(context).width007,)),
      ),
    )
        : SizedBox()
        , controller.currentQuestionList);
  }
}
