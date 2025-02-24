import 'dart:io';

import 'package:banana_deal_by_monkeycompany/app/modules/sign/controllers/sign_view_2_controller/sign_view_2/sign_view_2_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/sign/views/pages/sign2/widgets/sign2_body/helper/sign_form/sign_email_form_area.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/sign/views/pages/sign2/widgets/sign2_body/helper/sign_form/sign_pass_form_area.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/sign/views/pages/sign2/widgets/sign2_body/helper/sign_form/sign_sign_form_area.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../components/widget_components/ripple_button/ripple_button.dart';
import '../../../../../../../../css/size.dart';
import '../../../../../../../../css/style.dart';
import '../../../../../widgets/top_text_field.dart';

class Sign2RouteNo extends StatelessWidget {
  const Sign2RouteNo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignView2Controller>(
        builder: (controller) =>
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                      color: Style.white,
                      padding: WidgetSize(context).paddingBodyWhole,
                      width: WidgetSize(context).widthCommon,
                      child: ListView(
                        physics: ClampingScrollPhysics(),
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              MediaQuery.of(context).viewInsets.bottom > 0 && MediaQuery.of(context).viewInsets.bottom > WidgetSize(context).deviceMent && controller.currentTap.value == 1
                                  ? SizedBox()
                                  :
                              controller.currentTap.value == 0 ?
                              TopTextField(text1: '안녕하세요!', text2: '바나나딜에 오신 것을 환영해요!',
                                  text3:
                                  Platform.isIOS
                                      ? '가입하신 방식(이메일/SNS)으로 로그인 해주세요.'
                                      : '가입하신 방식(이메일/카카오톡)으로 로그인 해주세요.'
                              ) :
                              controller.confirm.value && controller.currentTap.value == 1
                                  ?  TopTextField(text1: '회원가입 마무리를 위해', text2: '비밀번호를 입력해주세요.',
                                  text3: '로그인 시 사용할 비밀번호를 입력해주세요.'
                              )
                                  :
                              TopTextField(text1: '이메일 인증을 통해', text2: '회원가입이 가능합니다.',
                                  text3: '사용하고 계시는 이메일을 입력해주세요.'
                              ),
                              SizedBox(height: WidgetSize(context).sizedBox18,),
                              MediaQuery.of(context).viewInsets.bottom > 0 && MediaQuery.of(context).viewInsets.bottom > WidgetSize(context).deviceMent && controller.currentTap.value == 1
                                  ? SizedBox()
                                  : Container(
                                width: WidgetSize(context).widthCommon,
                                height: WidgetSize(context).height60px,
                                decoration: BoxDecoration(
                                    color: Style.white,
                                ),
                                child: Row(
                                  children: List.generate(
                                    2, (index) =>
                                      Expanded(
                                          child: RippleDecorationButton(
                                              onTap: () {
                                                controller.tapClick(index);
                                              },
                                              color: controller.currentTap.value == index
                                                  ? Style.yellow
                                                  : Style.greyEAEAEA,
                                              widget: Center(
                                                child: Text(
                                                  controller.tap[index],
                                                  style: TextStyle(
                                                      fontSize: WidgetSize(context).sizedBox18,
                                                      color: controller.currentTap.value == index ? Colors.black : Style.ultimateGrey,
                                                      fontWeight: FontWeight.w400
                                                  ),
                                                ),
                                              )
                                          )
                                      ),
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  SizedBox(height: WidgetSize(context).sizedBox18,),
                                  controller.currentTap.value == 0
                                      ? SignEmailFormArea()
                                      : controller.confirm.value
                                      ? Stack(
                                    children: [
                                      SizedBox(
                                        height: WidgetSize(context).widthCommon,
                                      ),
                                      Positioned(
                                          child: SignPassFormArea())
                                    ],
                                  )
                                      : SignSignFormArea(),
                                ],
                              )
                            ],
                          ),
                        ],
                      )
                  ),
                ),
                Container(
                  color: Style.white,
                  width: WidgetSize(context).widthCommon,
                  height: WidgetSize(context).sign2RowGap,
                )
              ],
            )
    );
  }
}
