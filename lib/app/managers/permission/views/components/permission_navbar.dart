import 'package:banana_deal_by_monkeycompany/app/components/disable_button.dart';
import 'package:banana_deal_by_monkeycompany/app/components/neumorphic_buttons.dart';
import 'package:banana_deal_by_monkeycompany/app/managers/permission/controllers/permission_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../css/size.dart';
import '../../../../css/style.dart';

class PermissionNavBar extends GetView<PermissionPageController> {
  final int androidSdkVersion;
  const PermissionNavBar({
    required this.androidSdkVersion,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Style.white,
      child: SafeArea(
        child: ObxValue(
            (height) =>
                SizedBox(
                  height: height.value,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: WidgetSize(context).paddingBodyWhole,
                        child: ObxValue((red)=>
                        red.value
                            ? DisableButton(text: '잠시만 기다려주세요......')
                            : NeumorphicButtons(
                            text: GetPlatform.isIOS ? '다음': '확인',
                            onPressed: () async{
                              switch(androidSdkVersion){
                                case 0:
                                  await controller.requestAll(sdkVersion: 0);
                                default:
                                  await controller.requestAll(sdkVersion: androidSdkVersion);
                              }

                            })
                            ,controller.requestClear),
                      ),
                    ],
                  ),
                )
        ,controller.deviceHeight)
      ),
    );
  }
}
