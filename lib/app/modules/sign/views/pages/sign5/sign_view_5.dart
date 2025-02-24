import 'package:banana_deal_by_monkeycompany/app/css/app_basic_component/bagic_canvas.dart';
import 'package:banana_deal_by_monkeycompany/app/css/app_basic_component/basic_app_bar.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/sign/controllers/sign_view_3_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../components/neumorphic_buttons.dart';
import '../../../../../css/size.dart';
import '../../../../../css/style.dart';
import '../../../../../routes/const_element.dart';
import '../../../controllers/sign_view_5_controller.dart';

class SignView5 extends GetView<SignView5Controller> {
  const SignView5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasicCanvas(
        canPop: true,
        body: Column(
          children: [
            BasicAppbar2(lotation: false, actions: SizedBox()),
            Expanded(
                child:  Padding(
                  padding: WidgetSize(context).paddingBodyWhole,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: WidgetSize(context).sizedBox8,),
                      _topTextArea(context),
                      _picArea(context),
                    ],
                  ),
                )
            )
          ],
        ) ,
      bottomNavigationBar: SafeArea(
        child: Container(
          color: Style.white,
          padding: WidgetSize(context).paddingBodyWhole,
          height: SignView3Controller.to.deviceHeight.value,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              NeumorphicButtons(text: '시작하기',
                onPressed: () async{
                  if(Get.isSnackbarOpen){
                    Get.back();
                  } else{
                    await controller.getMessage();
                  }
                },
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget _text22PxBlackW700Line2(String text, BuildContext context) {
    return RichText(
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
      text: TextSpan(
          text: text,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            color: Style.blackWrite,
            fontSize: WidgetSize(context).sizedBox26,
          )),
    );
  }

  Widget _text36PxBlackW700Line2(String text, BuildContext context) {
    return RichText(
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
      text: TextSpan(
          text: text,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: Colors.black,
            fontSize: WidgetSize(context).sizedBox34,
          )),
    );
  }

  Widget _topTextArea(BuildContext context){
    return Container(
      width: WidgetSize(context).widthCommon,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _text22PxBlackW700Line2('바나나딜과 함께 하는', context),
              _text22PxBlackW700Line2('스마트한 견적 상담,', context),
            ],
          ),
          SizedBox(height: WidgetSize(context).sizedBox16,),
          _text36PxBlackW700Line2('지금부터 시작하세요 !', context)
        ],
      ),
    );
  }


  Widget _picArea(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(WidgetSize(context).height60px),
        child: SizedBox.expand(
          child: Image.asset(AppElement.signCha,
            fit: BoxFit.fitWidth,
          )
        ),
      ),
    );
  }



}