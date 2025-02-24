import 'package:banana_deal_by_monkeycompany/app/components/image_provider/asset_image_box.dart';
import 'package:banana_deal_by_monkeycompany/app/components/neumorphic_buttons.dart';
import 'package:banana_deal_by_monkeycompany/app/css/size.dart';
import 'package:banana_deal_by_monkeycompany/app/css/style.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/invite/controller/invite_deal_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/routes/const_element.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CompleteDealView extends GetView<InviteDealController> {
  const CompleteDealView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Style.white,
        surfaceTintColor: Style.white,
        toolbarHeight: 0,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: WidgetSize(context).paddingBodyWhole,
        color: Style.white,
        width: WidgetSize(context).widthCommon,
        child: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   AssetImageBox(
                       imageHeight: WidgetSize(context).sizedBox182,
                       imageWidth: WidgetSize(context).sizedBox220_5,
                       imageUrl: AppElement.completeDeal),
                   _pad(context),
                   _w700TextGreen('견적 요청 완료', context),
                   _pad(context),
                   _w700Text('초대한 매장에서 고객님이 요청한 견적을 확인하여,', context),
                   _w700Text("'48시간 이내'에 딜을 보내드릴 예정입니다.", context),
                   _padS2(context),
                   _w500Text("* 영업시간 외에는 확인이 늦을 수 있으니 기다려주세요.", context),
                   _pad(context),
                 ],
               ),
            ),
            SizedBox(height: WidgetSize(context).sizedBox1,),
            _w700TextGrey('혹시 매장 초대를 깜빡하셨더라도,', context),
            _w700TextGrey("메인화면에서 견적 받아볼 매장 추가가 가능합니다.", context),
            _padS(context),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Style.white,
        child: SafeArea(
          child:  SizedBox(
            width: WidgetSize(context).widthCommon,
            height: AppElement.defaultBottomPadding,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: WidgetSize(context).paddingBodyWhole,
                  child: NeumorphicButtons(
                  text: '확인',
                  onPressed: () async{
                    await controller.clickCompleted();

                        }
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }

  Widget _pad(BuildContext context){
    return SizedBox(height: WidgetSize(context).sizedBox28,);
  }

  Widget _padS2(BuildContext context){
    return SizedBox(height: WidgetSize(context).sizedBox8,);
  }

  Widget _padS(BuildContext context){
    return SizedBox(height: WidgetSize(context).sizedBox12,);
  }

  Widget _w700TextGreen(String text, BuildContext context){
    return  Text(text,
      style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: WidgetSize(context).sizedBox24,
          color: Colors.green
      ),
    );
  }
  Widget _w500Text(String text, BuildContext context){
    return  FittedBox(
      fit: BoxFit.scaleDown,
      child: Text(text,
        style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: WidgetSize(context).sizedBox17,
            color: Style.blackWrite
        ),
      ),
    );
  }
  Widget _w700Text(String text, BuildContext context){
    return  FittedBox(
      fit: BoxFit.scaleDown,
      child: Text(text,
        style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: WidgetSize(context).sizedBox20,
            color: Style.blackWrite
        ),
      ),
    );
  }

  Widget _w700TextGrey(String text, BuildContext context){
    return  FittedBox(
      fit: BoxFit.scaleDown,
      child: Text(text,
        style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: WidgetSize(context).sizedBox17,
            color: Style.grey999999
        ),
      ),
    );
  }


}
