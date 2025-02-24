import 'package:banana_deal_by_monkeycompany/app/modules/sign/views/pages/sign3/widgets/helpers/sign3_body_main/sign3_body_nick_form/sign3_body_nick_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../../components/custom_text_form.dart';
import '../../../../../../../../../css/size.dart';
import '../../../../../../../../../css/style.dart';
import '../../../../../../../controllers/sign_view_3_controller.dart';


class Sign3BodyNickFormArea extends GetView<SignView3Controller> {
  const Sign3BodyNickFormArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomTextFormField(
          focusNode: controller.focusNode,
          width: WidgetSize(context).widthCommon,
          onChanged: controller.inputNick,
          textController: controller.nicknameController,
          hintText: '닉네임을 입력해주세요.',
          enabled: true,
          keyboardType: TextInputType.name,
        ),
        SizedBox(height: WidgetSize(context).sizedBox8,),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: WidgetSize(context).sizedBox8,),
            Sign3BodyNickText()
          ],
        ),
        SizedBox(height: WidgetSize(context).sizedBox8,),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () async{
                await controller.sendName(controller.nickName.value);
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: WidgetSize(context).sizedBox7_5, horizontal: WidgetSize(context).sizedBox12),
                decoration: BoxDecoration(
                  color: Style.yellow,
                  borderRadius: BorderRadius.circular(WidgetSize(context).sizedBox32),
                ),
                child: Text('중복체크',
                  style: TextStyle(
                      color: Style.brown,
                      fontSize: WidgetSize(context).sizedBox14
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
