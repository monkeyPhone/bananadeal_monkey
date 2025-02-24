import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_inquiry/inquiry_send/inquiry_send_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../../../css/style.dart';

class InquirySendContentInput extends GetView<InquirySendController> {
  final String content;
  const InquirySendContentInput({
    required this.content,
    super.key});

  @override
  Widget build(BuildContext context) {
    return  TextField(
      onChanged: controller.inputContent,
      style: TextStyle(fontSize: WidgetSize(context).sizedBox15, color: Style.blackWrite),
      controller: controller.contentController,
      keyboardType: TextInputType.multiline,
      maxLines: 10,
      maxLength: 5000,
      cursorColor: Style.ultimateGrey,
      decoration: InputDecoration(
          counterStyle: TextStyle(fontSize: WidgetSize(context).sizedBox14, color: Style.grey999999,fontWeight: FontWeight.w400),
          hintStyle: TextStyle(fontSize: WidgetSize(context).sizedBox15, color: Style.grey999999),
          hintText: '문의 내역을 상세하게 적어주세요',
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: WidgetSize(context).sizedBox1, color: Style.ultimateGrey),
            borderRadius: BorderRadius.all(Radius.circular(WidgetSize(context).width00234)),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(WidgetSize(context).width00234)),
              borderSide:  BorderSide(width: WidgetSize(context).sizedBox1, color:
              content == ''
                  ? Style.greyCCCCCC
                  : Style.yellow
              )
          )
      ),
    );
  }
}
