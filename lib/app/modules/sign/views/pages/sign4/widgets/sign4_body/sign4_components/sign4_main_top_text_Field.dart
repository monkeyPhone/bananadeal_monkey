import 'package:banana_deal_by_monkeycompany/app/modules/sign/controllers/sign_view_5_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../widgets/top_text_field.dart';

class Sign4MainTopTextField extends GetView<SignView5Controller> {
  const Sign4MainTopTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return ObxValue(
            (nickname) =>  TopTextField(
                              text1: '반가워요. ${nickname.value}님 !',
                              text2: '위치를 설정해주세요.',
                              text3: '가까운 매장을 찾기 위해서 위치 설정이 필요해요.'
                          )
        , controller.nickname);
  }
}
