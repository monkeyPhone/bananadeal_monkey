import 'package:banana_deal_by_monkeycompany/app/css/app_basic_component/bagic_canvas.dart';
import 'package:banana_deal_by_monkeycompany/app/css/app_basic_component/basic_app_bar.dart';
import 'package:banana_deal_by_monkeycompany/app/css/app_basic_component/basic_app_bar_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../css/size.dart';
import '../../../../home/views/ios_alert_icon.dart';
import '../../../controllers/etc_app_setting_controller.dart';
import '../../widgets/list_container.dart';
import 'widgets/etc_app_switch_button.dart';

class EtcAppSettingView extends GetView<EtcAppSettingController> {
  const EtcAppSettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasicCanvas(
      canPop: true,
      body: Column(
        children: [
          BasicAppbar(
              title: BasicAppBarText(
                text: '앱 설정',
              ),
            actions: Padding(
              padding: EdgeInsets.only(
                right: WidgetSize(context).sizedBox7_5
              ),
              child: IosAlertIconView(),
            ),
          ),
          Expanded(
              child: GetBuilder<EtcAppSettingController>(
                builder: (controllers) =>
                    Column(
                      children: [
                        ListContainerSetting(
                          text: '알림 수신 설정',
                          text2: '',
                          switchButton: EtcAppSwitchButton(
                            value: controllers.spPush.value,
                            onChanged: (val) => controllers.toggleSystemPush(context),
                          ),
                          bottomBorder: true,
                        ),

                       Column(
                          children: [
                            ListContainerSettingSub(
                              text: '견적 알림',
                              switchButton: EtcAppSwitchButton(
                                value: controllers.dealPush.value,
                                onChanged: (val) => controllers.toggleDealPush(context),
                                isSub: true,
                              ),
                              isColor: controllers.dealPush.value,
                            ),
                            ListContainerSettingSub(
                              text: '채팅 알림',
                              switchButton: EtcAppSwitchButton(
                                value: controllers.chatPush.value,
                                onChanged: (val) => controllers.toggleChatPush(context),
                                isSub: true,
                              ),
                              isColor: controllers.chatPush.value,
                            ),
                            ListContainerSettingSub(
                              text: '문의 알림',
                              switchButton: EtcAppSwitchButton(
                                value: controllers.addPush.value,
                                onChanged: (val) => controllers.toggleAddPush(context),
                                isSub: true,
                              ),
                              isColor:  controllers.addPush.value,
                            ),
                          ],
                        ),
                        ListContainerSetting(
                            topBorder: true,
                            text: '광고성 정보 수신 설정',
                            text2: '(${controllers.mpDate.value})',
                            switchButton: EtcAppSwitchButton(
                              value: controllers.mpPush.value,
                              onChanged: (val) => controllers.toggleAdPush(context),
                            )
                        ),
                        // ListContainer(index: 10, text:
                        // '광고성 푸시 받기', switchButton: _switchButton(controller.addPush.value,(val)=>controller.toggleAddPush(context), context)),
                        // ListContainer(index: 10, text:
                        // '채팅 알림', switchButton: _switchButton(controller.chatPush.value,(val)=>controller.toggleChatPush(context), context)),
                        // ListContainer(index: 10, text:
                        // '배너 알림', switchButton: _switchButton(controller.banner.value,(val)=>controller.toggleBanner(context), context)),
                      ],
                    ),
              )

          )
        ],
      ),
    );
  }

}
