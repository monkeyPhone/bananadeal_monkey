import 'package:banana_deal_by_monkeycompany/app/modules/sign/controllers/sign_view_3_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/sign/views/pages/sign3/widgets/helpers/sign3_body_positioned/crop_button_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../css/size.dart';




class Sign3BodyPositioned extends GetView<SignView3Controller> {
  const Sign3BodyPositioned({super.key});

  @override
  Widget build(BuildContext context) {
    return ObxValue(
            (p0) => Positioned(
            top: WidgetSize(context).sizedBox110+controller.deviceHeight.value,
            right: WidgetSize(context).sizedBox24,
            child: !p0.value
                ? SizedBox()
                : CropButtonViewSign()
        )
        , controller.crop );
  }
}
