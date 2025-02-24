import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_button.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_inquiry/inquiry_send/inquiry_send_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_inquiry/inquiry_send/widgets/body/state_ment/image_area/inquiry_send_default_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../../../css/style.dart';

class InquirySendDefaultImageArea extends GetView<InquirySendController> {
  final int index;
  const InquirySendDefaultImageArea({
    required this.index,
    super.key});

  @override
  Widget build(BuildContext context) {
    return RippleDecorationButton(
        onTap: (){
          controller.switchRouteCaseUpload(index);
        },
        margin: EdgeInsets.only(right: WidgetSize(context).sizedBox22),
        padding: EdgeInsets.all(WidgetSize(context).sizedBox16),
        width: WidgetSize(context).sizedBox170,
        height: WidgetSize(context).sizedBox170/1.618,
        border: Border.all(
            width: WidgetSize(context).sizedBox1, color: Style.greyCCCCCC),
        widget: InquirySendDefaultImage()
    );
  }
}
