import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_button.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/components/post_deal/moduels/make_deal/controllers/make_deal_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../../../../../css/size.dart';

class MakeDealOneButton extends GetView<MakeDealController> {
  final int page;
  const MakeDealOneButton({
    required this.page,
    super.key});

  @override
  Widget build(BuildContext context) {
    return ObxValue((p0) =>
          RippleDecorationButton(
              onTap: () {
                controller.oneButtonClick(p0.value);
              },
              borderRadius: BorderRadius.circular(999),
              color: controller.twoButtonColor(),
              width: WidgetSize(context).widthCommon,
              height: WidgetSize(context).height60px,
              widget: Center(
                child: Text(
                  page == 1 ? '다음 단계로' : '돌아가기',
                  style: TextStyle(
                      fontSize: WidgetSize(context).sizedBox18,
                      fontWeight: FontWeight.w400),
                ),
              )
          )
        , controller.currentStep);
    //   GestureDetector(
    //   onTap: () {
    //     controller.oneButtonClick(page);
    //   },
    //   child: Obx(()=>
    //       Container(
    //         width: WidgetSize(context).widthCommon,
    //         height: WidgetSize(context).height60px,
    //         decoration: BoxDecoration(
    //             color: controller.twoButtonColor(),
    //             borderRadius:
    //             BorderRadius.circular(999)),
    //         child: Center(
    //           child: Text(
    //             page == 1 ? '다음 단계로' : '돌아가기',
    //             style: TextStyle(
    //                 fontSize: WidgetSize(context).sizedBox18,
    //                 fontWeight: FontWeight.w400),
    //           ),
    //         ),
    //       )
    //   ),
    // );
  }
}
