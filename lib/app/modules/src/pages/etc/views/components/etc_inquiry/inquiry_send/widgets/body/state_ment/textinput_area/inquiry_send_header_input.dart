import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_inquiry/inquiry_send/inquiry_send_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../../../css/style.dart';

class InquirySendHeaderInput extends GetView<InquirySendController> {
  final String header;
  const InquirySendHeaderInput({
    required this.header,
    super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: controller.inputHeader,
      style: TextStyle(fontSize: WidgetSize(context).sizedBox15, color: Style.blackWrite),
      controller: controller.headerController,
      keyboardType: TextInputType.text,
      cursorColor: Style.ultimateGrey,
      decoration: InputDecoration(
          hintStyle: TextStyle(fontSize: WidgetSize(context).sizedBox15, color: Style.grey999999),
          hintText: '문의 제목을 적어주세요.',
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: WidgetSize(context).sizedBox1, color: Style.ultimateGrey),
            borderRadius: BorderRadius.all(Radius.circular(WidgetSize(context).width00234)),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(WidgetSize(context).width00234)),
              borderSide:  BorderSide(width: WidgetSize(context).sizedBox1, color:
              header == ''
                  ? Style.greyCCCCCC
                  : Style.yellow
              )
          )
      ),
    );
  }
}
