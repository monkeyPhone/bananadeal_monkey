import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_inquiry/inquiry_send/widgets/body/state_ment/textinput_area/inquiry_send_body_statement_textinput_area.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../../../../css/size.dart';
import '../../../inquiry_send_controller.dart';
import 'image_area/inquiry_send_image_input.dart';

class InquirySendBodyStatement extends StatelessWidget {
  const InquirySendBodyStatement({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<InquirySendController>(
        builder: (controller)=>
            Column(
              children: [
                InquirySendBodyStatementTextInputArea(
                    header: controller.header.value,
                    content: controller.content.value,
                ),
                SizedBox(height: WidgetSize(context).sizedBox18),
                InquirySendImageInput(
                  imagePath: controller.imagePath,
                ),
              ],
            )

    );
  }
}
