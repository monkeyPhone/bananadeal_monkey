import 'package:banana_deal_by_monkeycompany/app/components/custom_text_form.dart';
import 'package:banana_deal_by_monkeycompany/app/components/disable_button.dart';
import 'package:banana_deal_by_monkeycompany/app/components/image_provider/asset_image_box.dart';
import 'package:banana_deal_by_monkeycompany/app/components/neumorphic_buttons.dart';
import 'package:banana_deal_by_monkeycompany/app/components/text_class/text_class.dart';
import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_button.dart';
import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_search_icon_button.dart';
import 'package:banana_deal_by_monkeycompany/app/css/size.dart';
import 'package:banana_deal_by_monkeycompany/app/css/style.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/sign/controllers/sign_view_2_controller/sign_view_2/sign_view_2_change_auth_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/sign/controllers/sign_view_2_controller/sign_view_2/sign_view_2_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/sign/views/widgets/top_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignOtpCheckDialog extends StatelessWidget {
  final bool isSign;
  final GestureTapCallback onTap;
  final GestureTapCallback cancel;
  final GestureTapCallback domain;
  final GestureTapCallback dispose;
  final String email;
  const SignOtpCheckDialog({super.key,
    required this.isSign,
    required this.onTap,
    required this.cancel,
    required this.domain,
    required this.dispose,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Dialog(
        backgroundColor: Style.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(WidgetSize(context).dialogCircular))
        ),
        child: GestureDetector(
          onTap: (){
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _Close(cancel: cancel,),
                Container(
                  color: Colors.transparent,
                  padding: EdgeInsets.symmetric(
                    horizontal: WidgetSize(context).sizedBox16,
                  ),
                  child: Column(
                    children: [
                      _TextArea(
                        email: email,
                      ),
                      _Pad(),
                      _Domain(
                        domain: domain,
                      ),
                      _Pad(),
                      _TextForm(
                          dispose: dispose,
                          isSign: isSign,
                          onTap: onTap,
                          cancel: cancel
                      ),
                      _ButtonArea(
                        onTap: onTap,
                        cancel: cancel,
                      ),
                      _Pad()
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class _Close extends StatelessWidget {
  final GestureTapCallback cancel;
  const _Close({
    required this.cancel,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: WidgetSize(context).widthCommon,
      height: WidgetSize(context).height60px,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FittedBox(
              fit: BoxFit.scaleDown,
              child: RippleIconButton(
                  onTap: cancel,
                  icon: Icons.close,
                  iconColor: Style.karajeck)
          ),

        ],
      ),
    );
  }
}


class _TextArea extends StatelessWidget {
  final String email;
  const _TextArea({
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          text: TextSpan(
              text: email,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Style.brown,
                fontSize: WidgetSize(context).sizedBox24,
              )),
        ),
        TopTextField(text1: '입력하신 이메일로', text2: '인증번호가 전송되었습니다.',
            text3: '이메일을 확인하여 인증번호를 입력해주세요.'
        ),
      ],
    );
  }
}

class _TextForm extends StatelessWidget {
  final bool isSign;
  final GestureTapCallback onTap;
  final GestureTapCallback cancel;
  final GestureTapCallback dispose;
  const _TextForm({
    required this.isSign,
    required this.onTap,
    required this.cancel,
    required this.dispose,
  });

  @override
  Widget build(BuildContext context) {
    return switch(isSign){
      true => _SignForm(
          onTap: onTap,
          cancel: cancel,
          dispose: dispose,
      ),
      false => _ResetForm(
        onTap: onTap,
        cancel: cancel,
          dispose:dispose
      )
    };
  }
}


class _Domain extends StatelessWidget {
  final GestureTapCallback domain;
  const _Domain({
    required this.domain,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        RippleDecorationButton(
            onTap: domain,
            padding: EdgeInsets.symmetric(
                vertical: WidgetSize(context).sizedBox8,
                horizontal: WidgetSize(context).sizedBox8
            ),
            widget: Text('인터넷 열기',
             style: TextStyle(
               fontSize: WidgetSize(context).sizedBox17,
               color: Colors.blue
             ),
            )
        ),
      ],
    );
  }
}



class _SignForm extends StatefulWidget {
  final GestureTapCallback onTap;
  final GestureTapCallback cancel;
  final GestureTapCallback dispose;
  const _SignForm({
    required this.onTap,
    required this.cancel,
    required this.dispose,
  });

  @override
  State<_SignForm> createState() => _SignFormState();
}

class _SignFormState extends State<_SignForm> {

  @override
  void dispose() {
    // TODO: implement dispose
    widget.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignView2Controller>(
        builder: (controller) =>
            Column(
              children: [
                CustomTextFormField(
                  enabled: true,
                  hintText: "인증 번호를 입력해주세요.",
                  width: WidgetSize(context).widthCommon, onChanged: controller.inputSubmit, textController: controller.submitTextField,
                  keyboardType: TextInputType.number,
                ),
                Padding(
                  padding: EdgeInsets.all(
                    WidgetSize(context).sizedBox8,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text14pxW400Color(
                        text: '남은 시간 ${controller.formatTime(controller.countDown.value)}',
                        color: Style.brown,
                        textAlign: TextAlign.left,
                      ),
                      Row(
                        children: [
                          RippleDecorationButton(
                              onTap: widget.cancel,
                              borderRadius: BorderRadius.circular(999),
                              border: Border.all(
                                  width: WidgetSize(context).sizedBox2,
                                  color: Style.yellow
                              ),
                              padding: EdgeInsets.symmetric(vertical: WidgetSize(context).sizedBox10, horizontal: WidgetSize(context).sizedBox12),
                              widget: Text14pxW400Color(
                                text: '재입력',
                                color: Style.brown,
                                textAlign: TextAlign.right,
                              )
                          ),

                          SizedBox(
                            width: WidgetSize(context).sizedBox16,
                          ),

                          RippleDecorationButton(
                              onTap: () async{
                                await controller.resendOtp();
                              },
                              color: Style.yellow,
                              borderRadius: BorderRadius.circular(999),
                              border: Border.all(
                                  width: WidgetSize(context).sizedBox2,
                                  color: Style.yellow
                              ),
                              padding: EdgeInsets.symmetric(vertical: WidgetSize(context).sizedBox10, horizontal: WidgetSize(context).sizedBox12),
                              widget: Text14pxW400Color(
                                text: '재전송',
                                color: Style.brown,
                                textAlign: TextAlign.right,
                              )
                          )

                        ],
                      ),
                    ],
                  ),
                ),
                _Pad(),
                controller.checkMail.value.result.isEmpty
                ? SizedBox()
                    :
                controller.checkMail.value.result[0].authNumber == controller.submit.value
                    ?   NeumorphicButtons(
                  radius: WidgetSize(context).sizedBox8,
                  height: WidgetSize(context).sizedBox50,
                  text: '인증하기',
                  onPressed: widget.onTap,
                ) :  DisableButton(text: '인증 번호가 일치하지 않습니다.'),
              ],
            ),
    );
  }
}


class _ResetForm extends StatefulWidget {
  final GestureTapCallback onTap;
  final GestureTapCallback cancel;
  final GestureTapCallback dispose;
  const _ResetForm({
    required this.onTap,
    required this.cancel,
    required this.dispose,
  });

  @override
  State<_ResetForm> createState() => _ResetFormState();
}

class _ResetFormState extends State<_ResetForm> {

  @override
  void dispose() {
    // TODO: implement dispose
    dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignView2ChangeAuthController>(
        builder: (controller) =>
            Column(
              children: [
                CustomTextFormField(
                  enabled: true,
                  hintText: "인증 번호를 입력해주세요.",
                  width: WidgetSize(context).widthCommon, onChanged: controller.inputSubmit, textController: controller.submitTextField,
                  keyboardType: TextInputType.number,
                ),
                Padding(
                  padding: EdgeInsets.all(
                    WidgetSize(context).sizedBox8,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text14pxW400Color(
                        text: '남은 시간 ${controller.formatTime(controller.countDown.value)}',
                        color: Style.brown,
                        textAlign: TextAlign.left,
                      ),
                      Row(
                        children: [
                          GestureDetector(
                              onTap: () async{
                                await controller.resendOtp(context);
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: WidgetSize(context).sizedBox10,
                                    horizontal: WidgetSize(context).sizedBox12
                                ),
                                decoration: BoxDecoration(
                                  color: Style.yellow,
                                  borderRadius: BorderRadius.circular(999),
                                ),
                                child: Text14pxW400Color(
                                  text: '재전송',
                                  color: Style.brown,
                                  textAlign: TextAlign.right,
                                ),
                              )
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                _Pad(),
                controller.checkMail.value.result.isEmpty
                    ? SizedBox()
                    :
                controller.checkMail.value.result[0].authNumber == controller.submit.value
                    ?   NeumorphicButtons(
                  radius: WidgetSize(context).sizedBox8,
                  height: WidgetSize(context).sizedBox50,
                  text: '인증하기',
                  onPressed: widget.onTap,
                ) :  DisableButton(text: '인증 번호가 일치하지 않습니다.'),
              ],
            )
    );
  }
}




class _ButtonArea extends StatelessWidget {
  final GestureTapCallback onTap;
  final GestureTapCallback cancel;
  const _ButtonArea({
    required this.onTap,
    required this.cancel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        SizedBox(
          height: WidgetSize(context).sizedBox8,
        ),
        RippleDecorationButton(
            borderRadius: BorderRadius.circular(WidgetSize(context).sizedBox8),
            width: WidgetSize(context).widthCommon,
            height: WidgetSize(context).sizedBox50,
            onTap: cancel,
            widget: Center(
              child: Text(
                '취소',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Style.greyWrite,
                    fontSize: WidgetSize(context).sizedBox17
                ),
              ),
            )
        )
      ],
    );
  }
}


class _Pad extends StatelessWidget {
  const _Pad();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: WidgetSize(context).sizedBox16,
    );
  }
}