import 'package:banana_deal_by_monkeycompany/app/modules/sign/controllers/sign_view_2_controller/sign_view_2/sign_view_2_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/sign/views/pages/sign2/common/common_custom_text_dot.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/sign/views/pages/sign2/common/common_custom_text_form.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/sign/views/pages/sign2/widgets/sign_pad/sign_pad.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../../components/custom_text_form.dart';
import '../../../../../../../../../components/disable_button.dart';
import '../../../../../../../../../components/neumorphic_buttons.dart';
import '../../../../../../../../../components/text_class/text_class.dart';
import '../../../../../../../../../components/widget_components/ripple_button/ripple_button.dart';
import '../../../../../../../../../css/size.dart';
import '../../../../../../../../../css/style.dart';
import '../../../sign_domain_field.dart';

class SignSignFormArea extends StatelessWidget {
  const SignSignFormArea({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignView2Controller>(
        builder: (controller) =>
            Container(
              color: Style.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  controller.seadEmail.value && MediaQuery.of(context).viewInsets.bottom > 0
                      ? SizedBox()
                      : Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CommonCustomTextForm(
                              textEditingController: controller.emailTextField,
                              enabled: !controller.seadEmail.value || controller.checkMail.value.status != 200 || controller.checkMail.value.status == 0
                                  ? true
                                  : false,
                              onChanged: controller.inputEmail
                          ),
                          CommonCustomTextDot(),
                          !controller.domainSelected.value
                              ? SignDomainField(
                            textColor: !controller.seadEmail.value || controller.checkMail.value.result == 'N' || controller.checkMail.value.result == ''
                                ? Colors.black
                                : Style.greyWrite,
                            color: !controller.seadEmail.value || controller.checkMail.value.result == 'N' || controller.checkMail.value.result == ''
                                ? Style.white
                                : Style.greyD7D7D7,
                            text: controller.domain.value == '' ? Style.domain : controller.domain.value,
                            onTap: () async{
                              FocusScope.of(context).unfocus();
                              !controller.seadEmail.value || controller.checkMail.value.result == 'N' || controller.checkMail.value.result == ''
                                  ? await controller.showModal(context)
                                  : null;
                              }
                          )
                              :
                          CommonCustomTextForm(
                              textEditingController: controller.domainTextField,
                              enabled: !controller.seadEmail.value || controller.checkMail.value.result == 'N' || controller.checkMail.value.result == ''
                                  ? true
                                  : false,
                              onChanged:  controller.inputDomain,
                              keyboardType: TextInputType.emailAddress,
                              onTap: (){
                                controller.whatTheButton();
                              },
                          )
                        ],
                      ),
                      SignPad8(),
                      Container(
                          color: Style.white,
                          padding: WidgetSize(context).paddingBodyWhole,
                          width: WidgetSize(context).widthCommon,
                          child: Text(
                            controller.status.value,
                            style: TextStyle(
                              fontSize: WidgetSize(context).sizedBox14,
                              color: controller.checkMail.value.status == 200 ? Colors.blue : Colors.red,
                              fontWeight: FontWeight.w400,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                          )
                      ),
                      SignPad8(),
                    ],
                  ),

                  !controller.seadEmail.value || controller.checkMail.value.status != 200 || controller.checkMail.value.status == 0
                      ? SizedBox()
                      : !controller.confirm.value
                      ? Column(
                    children: [
                      controller.seadEmail.value && MediaQuery.of(context).viewInsets.bottom > 0
                          ? SizedBox()
                          : Column(
                        children: [
                          SignPad18(),
                          DisableButton(text: '이메일 인증 진행중입니다.'),
                          SignPad28(),
                        ],
                      ),
                      // Column(
                      //   children: [
                      //     CustomTextFormField(
                      //       enabled: true,
                      //       hintText: "인증 번호를 입력해주세요.",
                      //       width: WidgetSize(context).widthCommon, onChanged: controller.inputSubmit, textController: controller.submitTextField,
                      //       keyboardType: TextInputType.number,
                      //     ),
                      //     Padding(
                      //       padding: EdgeInsets.all(
                      //         WidgetSize(context).sizedBox8,
                      //       ),
                      //       child: Row(
                      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //         children: [
                      //           Text14pxW400Color(
                      //             text: '남은 시간 ${controller.formatTime(controller.countDown.value)}',
                      //             color: Style.brown,
                      //             textAlign: TextAlign.left,
                      //           ),
                      //           Row(
                      //             children: [
                      //               RippleDecorationButton(
                      //                   onTap: controller.cancelOtp,
                      //                   borderRadius: BorderRadius.circular(999),
                      //                   border: Border.all(
                      //                       width: WidgetSize(context).sizedBox2,
                      //                       color: Style.yellow
                      //                   ),
                      //                   padding: EdgeInsets.symmetric(vertical: WidgetSize(context).sizedBox10, horizontal: WidgetSize(context).sizedBox12),
                      //                   widget: Text14pxW400Color(
                      //                     text: '재입력',
                      //                     color: Style.brown,
                      //                     textAlign: TextAlign.right,
                      //                   )
                      //               ),
                      //
                      //               SizedBox(
                      //                 width: WidgetSize(context).sizedBox16,
                      //               ),
                      //
                      //               RippleDecorationButton(
                      //                   onTap: () async{
                      //                     await controller.resendOtp();
                      //                   },
                      //                   color: Style.yellow,
                      //                   borderRadius: BorderRadius.circular(999),
                      //                   border: Border.all(
                      //                       width: WidgetSize(context).sizedBox2,
                      //                       color: Style.yellow
                      //                   ),
                      //                   padding: EdgeInsets.symmetric(vertical: WidgetSize(context).sizedBox10, horizontal: WidgetSize(context).sizedBox12),
                      //                   widget: Text14pxW400Color(
                      //                     text: '재전송',
                      //                     color: Style.brown,
                      //                     textAlign: TextAlign.right,
                      //                   )
                      //               )
                      //
                      //             ],
                      //           ),
                      //         ],
                      //       ),
                      //     )
                      //   ],
                      // ),
                    ],
                  )
                      : SizedBox(),

                  !controller.seadEmail.value
                      ? SizedBox()
                      : SignPad8(),

                  controller.domain.value != '' && controller.eamil.value != '' && controller.domain.value.contains('.')
                      && controller.domain.value.contains('.')
                      &&  !RegExp(r'^[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]*$').hasMatch(controller.eamil.value)
                      ?

                  !controller.seadEmail.value || controller.checkMail.value.status != 200 || controller.checkMail.value.status == 0
                      ? controller.checkMail.value.result.isNotEmpty && controller.checkMail.value.status != 200 && controller.status.value != '서버 오류'
                      ? Column(
                    children: [
                      SignPad12(),
                      controller.checkMail.value.result.first.joinType == 'MAIL'
                          ? NeumorphicButtons(
                          text: '비밀번호 찾기 바로 가기',
                          onPressed:  () {
                            controller.gotoReset();
                          }
                      )
                          : const DisableButton(text: '해당 계정으로 SNS 로그인을 진행해주세요.'),
                      SignPad12(),
                    ],
                  )
                      : Column(
                    children: [
                      NeumorphicButtons(
                          text: '다음',
                          onPressed: () async{
                            FocusScope.of(context).unfocus();
                            FocusManager.instance.primaryFocus?.unfocus();
                            await controller.checkEmail(context);
                          }
                      ),
                      SignPad12(),
                    ],
                  )
                      : SizedBox()
                      : DisableButton(text: '이메일 입력을 완료해주세요'),
                ],
              ),
            )
    );
  }
}
