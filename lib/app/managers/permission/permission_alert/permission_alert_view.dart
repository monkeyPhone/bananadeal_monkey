import 'package:banana_deal_by_monkeycompany/app/managers/permission/controllers/permission_page_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../components/neumorphic_buttons.dart';
import '../../../css/app_basic_component/bagic_canvas.dart';
import '../../../css/app_basic_component/basic_app_bar.dart';
import '../../../css/app_basic_component/basic_app_bar_text.dart';
import '../../../css/size.dart';
import '../../../css/style.dart';
import '../../../routes/const_element.dart';
import '../views/components/permission_text_widget.dart';

class PermissionAlertView extends GetView<PermissionPageController> {
  final int sdkVersion;
  const PermissionAlertView({super.key, required this.sdkVersion});

  @override
  Widget build(BuildContext context) {
    return BasicCanvas(
      canPop: true,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BasicAppbar(
            leading: (){
              Get.back();
            },
            title: BasicAppBarText(text: '알림 권한 안내',),
          ),
          SizedBox(height: WidgetSize(context).sizedBox30,),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              padding: EdgeInsets.only(
                  left: WidgetSize(context).sizedBox26,
                  right: WidgetSize(context).sizedBox16
              ),
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PermissionTextBoldWidget2(text: '바나나딜 서비스는 알림을 통해 견적 생성에 필요한 최신 정보를 업데이트하고 있습니다.'),
                    SizedBox(height: WidgetSize(context).sizedBox20,),
                    PermissionTextBoldWidget2(text: '딱 맞는 견적과 맞춤 상담을 받고 싶으신가요?'),
                    SizedBox(height: WidgetSize(context).sizedBox20,),
                    Container(
                      width: WidgetSize(context).widthCommon,
                      height: (WidgetSize(context).widthCommon-WidgetSize(context).sizedBox42)*540/680,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(AppElement.guideIos1),
                            fit: BoxFit.fitWidth,
                          )
                      ),
                    ),
                    SizedBox(height: WidgetSize(context).sizedBox20,),
                    PermissionTextBoldWidget3(text: '푸시 메시지는 앱 메인 - 더보기 - 앱 설정에서 차단할 수 있습니다.'),
                    SizedBox(height: WidgetSize(context).sizedBox20,),
                    SizedBox(height: WidgetSize(context).permissionGap,)
                  ],
                ),

              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: Style.white,
        child: SafeArea(
            child: ObxValue(
                    (height) =>
                    Padding(
                      padding: WidgetSize(context).paddingBodyWhole,
                      child: SizedBox(
                        height: height.value,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [

                            NeumorphicButtons(
                                text: '계속하기',
                                onPressed: () async{
                                  await controller.requestP(Permission.notification);
                                }),
                          ],
                        ),
                      ),
                    )
                ,controller.deviceHeight)
        ),
      ),
    );
  }
}
