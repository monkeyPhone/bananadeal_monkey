import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_button.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/main/auth/auth_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/service/service_moduels/controllers/chat_log_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../../../../../../../../../components/common_widgets.dart';
import '../../../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../../../css/style.dart';
import '../../../../../../../../../../../../routes/const_element.dart';
import '../../../../../../../../../../src_components/bottom_nav_bar/controllers/bd_bot_nav_chat_controller.dart';
import '../../../../../../../../../../styles/image_data.dart';
import '../../../../../../../../../chat/controllers/chat_controller.dart';
import '../../../../../../../service_model/chat_user_chat_list.dart';
import '../../../../../../controllers/chat_widget_controller.dart';

class ChatAccept extends GetView<ChatLogController> {
  final ChatLogList log;
  const ChatAccept({
    required this.log,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: WidgetSize(context).width00655),
      child: Column(
        children: [
          Container(
            constraints: BoxConstraints(
                minHeight: WidgetSize(context).sizedBox34,
                maxHeight: double.infinity,
                minWidth: WidgetSize(context).widthCommon,
                maxWidth: WidgetSize(context).widthCommon

            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(WidgetSize(context).sizedBox12),
                color: log.cType == 'USER'
                    ? Style.yellow : Style.white
            ),
            padding: EdgeInsets.all(WidgetSize(context).sizedBox1),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(WidgetSize(context).sizedBox12),
                color: Style.white,
              ),
              padding: EdgeInsets.symmetric(
                  horizontal: WidgetSize(context).sizedBox8,
                  vertical: WidgetSize(context).sizedBox12
              ),
              child: ObxValue(
                  (room) =>
                  room.value.crIdx == 0
                      ? SizedBox(
                    height: WidgetSize(context).height60px,
                    width: WidgetSize(context).height60px,
                    child: Center(
                      child: CircularProgressIndicator(
                        color: Style.yellow,
                      ),
                    ),
                  )
                      : Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _svgPic( AppElement.iconBanana, context),
                              _pad8(context),
                              Text('딜을 수락했어요',
                                style: TextStyle(fontSize: WidgetSize(context).sizedBox14, fontWeight: FontWeight.w700, color: Style.brown),
                              ),
                              _pad8(context),
                              _svgPic(AppElement.iconBanana2, context),
                            ],
                          ),
                          SizedBox(height: WidgetSize(context).sizedBox14,),
                          Column(
                            children: [
                              Text('딜을 수락해주셔서 감사합니다!',
                                style: TextStyle(fontSize: WidgetSize(context).sizedBox14, fontWeight: FontWeight.w700, color: Style.blackWrite),
                              ),
                              Text('아래에서 매장 위치를 확인해주세요.',
                                style: TextStyle(fontSize: WidgetSize(context).sizedBox14, fontWeight: FontWeight.w700, color: Style.blackWrite),
                              ),
                            ],
                          ),
                          SizedBox(height: WidgetSize(context).sizedBox14,),
                          _clipBoardText(
                              context: context,
                              name: '주소',
                              text: room.value.smAddress),
                          SizedBox(height: WidgetSize(context).sizedBox7_5,),
                          _clipBoardText(
                              context: context,
                              name: '전화',
                              text: room.value.smTel, trim: true),
                          SizedBox(height: WidgetSize(context).sizedBox17,),
                          Container(
                            padding: EdgeInsets.only(top: WidgetSize(context).sizedBox6_5),
                            decoration: BoxDecoration(
                                border: Border(
                                    top: BorderSide(width: WidgetSize(context).sizedBox1, color: Style.greyD7D7D7)
                                )
                            ),
                            height: WidgetSize(context).etc0156,
                            width: WidgetSize(context).widthCommon,
                            child: Row(

                              children: [
                                _flexibleButton(context: context, icon: AppElement.iconCall, text: '전화하기', border: true, onTap: () async{
                                  await ChatWidgetController.to.makePhoneCall(room.value.smTel);
                                }),
                                _flexibleButton(
                                    context: context,
                                    icon: AppElement.iconMap, text: '지도에서 보기', border: true,
                                    onTap: () async{
                                      await ChatWidgetController.to.launchNaverMap(
                                          name: room.value.smStoreName,
                                          road: room.value.smAddress,
                                          latitude: double.parse(room.value.smLatitude),
                                          longtitude: double.parse(room.value.smLongitude,

                                          )
                                      );
                                    }),
                                _flexibleButton(icon: AppElement.iconReview, text: '상담 후기 쓰기', border: false, onTap: () async{
                                  await ChatWidgetController.to.getReviewList();
                                }, context: context),
                              ],
                            ),
                          ),

                        ],
                      ),
                  controller.roomInfo
              )
            ),
          )
        ],
      ),
    );
  }

  Widget _pad8(BuildContext context){
    return SizedBox(
      width: WidgetSize(context).sizedBox8,
    );
  }

  Widget _svgPic(String asset, BuildContext context){
    return SvgPicture.asset(asset, width: WidgetSize(context).sizedBox14, height: WidgetSize(context).sizedBox13,);
  }

  Widget _flexibleButton({required String icon, required String text, required bool border, required GestureTapCallback onTap, required BuildContext context}) {
    return  Flexible(
        fit: FlexFit.tight,
        child: RippleDecorationButton(
          onTap: onTap,
          border: !border ? null : Border(right: BorderSide(width: WidgetSize(context).sizedBox1, color: Style.greyEAEAEA)),
          widget: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ImageData2(icon, WidgetSize(context).sizedBox18, color: Style.grey999999,),
              Text(text, style: TextStyle(fontSize: WidgetSize(context).sizedBox12, color: Style.grey333333),)
            ],
          ),
        )
    );
  }

  Widget _clipBoardText({required String name, required String text, bool? trim, required BuildContext context}) {

    return RippleDecorationButton(
        onTap: (){
          Clipboard.setData(ClipboardData(text: text));
          AuthController.commonWidgets.customSnackbar('클립보드에 복사되었어요.');
        },
        width: WidgetSize(context).widthCommon,
        padding: EdgeInsets.symmetric(vertical: WidgetSize(context).sizedBox2),
        widget: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(right: WidgetSize(context).sizedBox16, left: WidgetSize(context).sizedBox12),
              child: Text(name, style: TextStyle(
                  fontSize: WidgetSize(context).sizedBox12,
                  fontWeight: FontWeight.w400,
                  color: Style.blackWrite
              ),
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
            ),
            Expanded(
              child: Text(text, style: TextStyle(
                  fontSize: WidgetSize(context).sizedBox14,
                  fontWeight: FontWeight.w700,
                  color: Style.brown
              ),
                textAlign: TextAlign.start,
                maxLines: 3,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: WidgetSize(context).sizedBox12),
              child: ImageData2(AppElement.iconCopy, WidgetSize(context).sizedBox11, color: Style.brown,),
            ),
          ],
        )
    );
  }

}
