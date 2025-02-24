import 'package:banana_deal_by_monkeycompany/app/modules/sign/controllers/sign_view_2_controller/sign_view_2/sign_view_2_change_auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../css/size.dart';
import '../../../../widgets/top_text_field.dart';

class SignTopTextField extends GetView<SignView2ChangeAuthController> {
  const SignTopTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).viewInsets.bottom > 0 && MediaQuery.of(context).viewInsets.bottom > WidgetSize(context).deviceMent
        ? SizedBox()
        : ObxValue((p2) =>
          p2.value == 2
            ? TopTextField(text1: '인증이 완료되었습니다.', text2: '비밀번호를 입력해주세요', text3: '로그인 시 사용할 비밀번호를 입력해주세요.',)
            : TopTextField(text1: '비밀번호가 기억나지 않나요?', text2: '이메일 인증을 진행해주세요.', text3: '회원가입이 완료된 이메일을 입력해주세요.',)
        , controller.currentStep);
  }
}
