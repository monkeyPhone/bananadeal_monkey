import 'package:banana_deal_by_monkeycompany/app/css/app_basic_component/bagic_canvas.dart';
import 'package:banana_deal_by_monkeycompany/app/managers/permission/views/components/permission_button/permission_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import '../../../css/size.dart';
import 'components/permission_button/permission_button_area.dart';
import 'components/permission_navbar.dart';
import 'components/permission_text_widget.dart';



class PermissionPage extends StatelessWidget {
  final int androidSdkversion;
  const PermissionPage({
    required this.androidSdkversion,
    super.key});

  @override
  Widget build(BuildContext context) {
    return BasicCanvas(
        canPop: false,
        onPopInvoked: (bool didPop, Object? result){
          if(didPop){
          return;
          }
        },
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PermissionAppBar(androidSdkversion: androidSdkversion),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PermissionTextNormalWidget(text: '바나나딜은 아래 권한들을 필요로 합니다.'),
                      GetPlatform.isIOS
                          ? SizedBox()
                          : PermissionTextNormalWidget(text: '앱 서비스 이용을 위해서는 권한 요청 시 허용해주세요.'),
                      SizedBox(height: WidgetSize(context).permissionGap,)
                    ],
                  ),
                  PermissionButtonArea(androidSdkVersion: androidSdkversion,),

                ],
              ),
            ),
            SizedBox(height: WidgetSize(context).sizedBox20,)
          ],
        ),
      bottomNavigationBar: PermissionNavBar(androidSdkVersion: androidSdkversion,),
    );
  }
}
