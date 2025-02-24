import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../../../components/disable_button.dart';
import '../../../../../../../../../../components/neumorphic_buttons.dart';
import '../../inquiry_send_controller.dart';

class InquirySendBottomButton extends StatelessWidget {
  const InquirySendBottomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InquirySendController>(
      builder: (controller)=>
      controller.header.value == '' || controller.content.value == ''
          ? DisableButton(text: '제목과 내용을 입력해주세요.')
          : NeumorphicButtons(text: '1:1 문의 보내기',
        onPressed: () async{
          await controller.sendInqCreate();
        },
      )
      ,
    );
  }
}
