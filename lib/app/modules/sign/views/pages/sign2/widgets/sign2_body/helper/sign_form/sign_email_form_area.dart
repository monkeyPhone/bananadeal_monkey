import 'package:banana_deal_by_monkeycompany/app/modules/sign/controllers/sign_view_2_controller/sign_view_2/sign_view_2_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/sign/views/pages/sign2/widgets/sign2_body/helper/sign_form/sign_divider.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/sign/views/pages/sign2/widgets/sign2_body/helper/sign_form/sign_login_form_area.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/sign/views/pages/sign2/widgets/sign_pad/sign_pad.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../../components/neumorphic_buttons.dart';
import '../../../../../../../../../components/text_class/text_class.dart';
import '../../../../../../../../../components/widget_components/ripple_button/ripple_button.dart';
import '../../../../../../../../../css/size.dart';
import '../../../../../../../../../css/style.dart';
import '../../../../../../../../src/styles/image_data.dart';

class SignEmailFormArea extends GetView<SignView2Controller> {
  const SignEmailFormArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Stack(
          children: [
            Positioned(
                child: SignLoginFormArea()
            )
          ],
        ),
        SignPad18(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text14pxW400Color(
              text: '비밀번호가 기억나지 않나요?',
              color: Colors.black,
              textAlign: TextAlign.left,
            ),

            SizedBox(width: WidgetSize(context).sizedBox8,),
            RippleDecorationButton(
                onTap: (){
                  controller.gotoReset();
                },
                margin: EdgeInsets.all(WidgetSize(context).sizedBox7_5),
                border: Border(bottom: BorderSide(width: WidgetSize(context).sizedBox1, color: Style.brown)),
                widget: Text14pxW400Color(
                  text: '비밀번호 재발급 받기',
                  color: Style.brown,
                  textAlign: TextAlign.left,
                )
            )
          ],
        ),
        SignDivider(),
        SignPad12(),
        ObxValue((st) =>
        st.value == 0
            ?
        Column(
          children: List.generate(
              2, (index) =>
          GetPlatform.isAndroid && index == 1 ? SizedBox()
              : Container(
            margin: EdgeInsets.only(bottom: WidgetSize(context).sizedBox28),
            child: NeumorphicButtons(
              width: WidgetSize(context).widthCommon,
              height: WidgetSize(context).sizedBox52,
              text: '',
              boxColor: controller.buttonColor[index],
              radius: WidgetSize(context).sizedBox12,
              textWidget: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ImageData2(controller.buttonIcon[index], WidgetSize(context).sizedBox50*0.4, color: controller.symbolColor[index],),
                  Expanded(
                      child: Center(
                          child: Text(
                            controller.buttonName[index],
                            style: TextStyle(
                                fontSize: WidgetSize(context).sizedBox50*0.4,
                                color: controller.labelColor[index],
                                fontWeight: FontWeight.w400
                            ),
                          )
                      )
                  )
                ],
              ), onPressed: () async{
              if(index == 0)
              {
                await controller.fn_loginWithKakaoAccount(context);
              }
              if(index == 1)
              {
                if(Get.isSnackbarOpen){
                  Get.back();
                } else {
                  await controller.signInWithApple(context);
                }
              }
            },
            ),
          )
          ),
        ) :
        NeumorphicButtons(
          width: WidgetSize(context).widthCommon,
          height: WidgetSize(context).sizedBox48,
          text: '',
          boxColor: Style.greyCCCCCC,
          radius: WidgetSize(context).sizedBox12,
          textWidget: Center(
              child: Text(
                '로그인 진행중입니다',
                style: TextStyle(
                    fontSize: WidgetSize(context).sizedBox48*0.43,
                    color: Style.grey999999,
                    fontWeight: FontWeight.w400
                ),
              )
          ), onPressed: () async{

        },
        ), controller.waitLoginStatus)
      ],
    );
  }
}
