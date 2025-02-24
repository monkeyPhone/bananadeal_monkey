import 'package:app_settings/app_settings.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/src_components/controllers/src_info_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/routes/api_url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../css/size.dart';
import '../../css/style.dart';
import '../../routes/const/const_info.dart';
import '../widget_components/ripple_button/ripple_button.dart';

class CommonWidgets2 {
  Future<PermissionStatus> _checkPermission(Permission permission) async{
    PermissionStatus status = await permission.status;
    return status;
  }

  void basicNotiDialog({
    required BuildContext routerContext,
    required String title,
    required String content,
    required String date,
    required String result,
    required bool isBox,
    required bool isOneButton,
    required GestureTapCallback confirm,
    required GestureTapCallback refuse,
  }){
    Future.delayed(Duration.zero, (){
      showDialog<String>(
          context: routerContext,
          barrierDismissible: false,
          builder: (BuildContext context) =>
              Dialog(
                backgroundColor: Style.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(WidgetSize(context).dialogCircular))
                ),
                child: Container(
                  color: Colors.transparent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: WidgetSize(context).sizedBox20,
                      ),
                      Container(
                        color: Colors.transparent,
                        padding: EdgeInsets.symmetric(
                          horizontal:
                          !isBox
                              ? WidgetSize(context).sizedBox16
                              : WidgetSize(context).sizedBox8,
                        ),
                        height: WidgetSize(context).height60px,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(title,
                                style: TextStyle(
                                    color: Style.blackWrite,
                                    fontWeight: FontWeight.w700,
                                    fontSize: WidgetSize(Get.context!).sizedBox19),
                                maxLines: 2,
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        ),
                      ),
                      !isBox
                          ? SizedBox()
                          : Container(
                        padding: EdgeInsets.all(WidgetSize(context).sizedBox16),
                        margin: EdgeInsets.symmetric(vertical: WidgetSize(context).sizedBox16),
                        decoration: BoxDecoration(
                          color: Style.greyF4F4F4,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '일시: $date',
                              style: TextStyle(
                                  color: Style.blackWrite,
                                  fontWeight: FontWeight.w400,
                                  fontSize: WidgetSize(Get.context!).sizedBox16
                              ),
                              textAlign: TextAlign.center,
                            ),
                            isOneButton
                                ? SizedBox()
                                :
                            Text(
                              '내용: $result',
                              style: TextStyle(
                                  color: Style.blackWrite,
                                  fontWeight: FontWeight.w400,
                                  fontSize: WidgetSize(Get.context!).sizedBox16
                              ),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.transparent,
                        padding: EdgeInsets.symmetric(
                            vertical: WidgetSize(Get.context!).sizedBox20,
                            horizontal:
                            !isBox
                                ? WidgetSize(Get.context!).sizedBox8
                                : WidgetSize(Get.context!).sizedBox34
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              content,
                              style: TextStyle(
                                  color: Style.blackWrite,
                                  fontWeight: FontWeight.w400,
                                  fontSize: WidgetSize(Get.context!).sizedBox17
                              ),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height:  WidgetSize(Get.context!).sizedBox20,
                      ),
                      Container(
                        color: Colors.transparent,
                        height: WidgetSize(context).sizedBox57,
                        child: switch(isOneButton){
                          true => RippleDecorationButton(
                              onTap: refuse,
                              borderRadius:  BorderRadius.only(
                                  bottomLeft: Radius.circular(WidgetSize(context).dialogCircular),
                                  bottomRight: Radius.circular(WidgetSize(context).dialogCircular)
                              ),
                              border: Border(
                                top: BorderSide(
                                  width: WidgetSize(context).sizedBox1_5,
                                  color: Style.greyEAEAEA,
                                ),
                                right: BorderSide(
                                  width: WidgetSize(context).sizedBox1_5,
                                  color: Style.greyEAEAEA,
                                ),
                              ),
                              widget: Center(
                                child: Text( '닫기',
                                  style: TextStyle(
                                      color: Colors.lightBlue,
                                      fontWeight: FontWeight.w500,
                                      fontSize: WidgetSize(Get.context!).sizedBox17
                                  ),
                                ),
                              )
                          ),
                          false => Row(
                            children: [
                              Expanded(
                                  child: RippleDecorationButton(
                                      onTap: refuse,
                                      borderRadius:  BorderRadius.only(
                                          bottomLeft: Radius.circular(WidgetSize(Get.context!).dialogCircular)
                                      ),
                                      border: Border(
                                        top: BorderSide(
                                          width: WidgetSize(context).sizedBox1_5,
                                          color: Style.greyEAEAEA,
                                        ),
                                        right: BorderSide(
                                          width: WidgetSize(context).sizedBox1_5,
                                          color: Style.greyEAEAEA,
                                        ),
                                      ),
                                      widget: Center(
                                        child: Text(
                                          !isBox ? '미동의' : '닫기',
                                          style: TextStyle(
                                              color: Colors.lightBlue,
                                              fontWeight: FontWeight.w500,
                                              fontSize: WidgetSize(Get.context!).sizedBox17
                                          ),
                                        ),
                                      )
                                  )

                              ),
                              Expanded(
                                  child: RippleDecorationButton(
                                      onTap: confirm,
                                      borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(WidgetSize(Get.context!).dialogCircular)
                                      ),
                                      border: Border(
                                        top: BorderSide(
                                          width: WidgetSize(context).sizedBox1_5,
                                          color: Style.greyEAEAEA,
                                        ),
                                      ),
                                      widget: Center(
                                        child: Text(
                                          !isBox ? '동의' : '변경',
                                          style: TextStyle(
                                              color: Colors.lightBlue,
                                              fontWeight: FontWeight.w500,
                                              fontSize: WidgetSize(Get.context!).sizedBox17
                                          ),
                                        ),
                                      )
                                  )
                              )
                            ],
                          )
                        },
                      ),
                    ],
                  ),
                ),
              )
      );
    });
  }

  void permissionSettingsDialog({
    required BuildContext routerContext,
    required List<String> permission,
    required String title,
    required int sdkVersion,
    required String content,
    required GestureTapCallback confirm,
    required GestureTapCallback refuse,
  }) async{

    Future.delayed(Duration.zero, (){
      showDialog<String>(
          context: routerContext,
          barrierDismissible: false,
          builder: (BuildContext context) =>
              Dialog(
                backgroundColor: Style.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(WidgetSize(context).dialogCircular))
                ),
                child: Container(
                  color: Colors.transparent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: EdgeInsets.all(WidgetSize(context).sizedBox16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(title,
                              style: TextStyle(
                                  color: Style.blackWrite,
                                  fontWeight: FontWeight.w700,
                                  fontSize: WidgetSize(Get.context!).sizedBox19),
                              maxLines: 2,
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(
                              height: WidgetSize(context).sizedBox8,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  content,
                                  style: TextStyle(
                                      color: Style.blackWrite,
                                      fontWeight: FontWeight.w400,
                                      fontSize: WidgetSize(Get.context!).sizedBox17
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                                SizedBox(
                                  height: WidgetSize(context).sizedBox16,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: List.generate(permission.length,
                                        (index) =>
                                    permission[index] == ''
                                        ? const SizedBox()
                                        :
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(' · ',
                                              style: TextStyle(
                                                  color: Style.blackWrite,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: WidgetSize(Get.context!).sizedBox17
                                              ),
                                              textAlign: TextAlign.start,
                                            ),
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  switch(permission[index]){
                                                    InfoString.permissionNoti => '알림',
                                                    InfoString.permissionLocation => '위치',
                                                    InfoString.permissionPhoto => sdkVersion == 0 || sdkVersion >= 33 ? '사진' : '저장소',
                                                    InfoString.permissionCamera => '카메라',
                                                    _ => ''
                                                  },
                                                  style: TextStyle(
                                                      color: Style.blackWrite,
                                                      fontWeight: FontWeight.w400,
                                                      fontSize: WidgetSize(Get.context!).sizedBox17
                                                  ),
                                                  textAlign: TextAlign.start,
                                                ),
                                                SizedBox(
                                                  height: WidgetSize(context).sizedBox4,
                                                ),
                                                Text(
                                                  permission[index],
                                                  style: TextStyle(
                                                      color: Style.blackWrite,
                                                      fontWeight: FontWeight.w400,
                                                      fontSize: WidgetSize(Get.context!).sizedBox17
                                                  ),
                                                  textAlign: TextAlign.start,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),

                                        SizedBox(
                                          height: WidgetSize(context).sizedBox8,
                                        ),
                                      ],
                                    )
                                ),
                              )
                            ],
                          ),
                        ],),
                      ),
                      Container(
                        color: Colors.transparent,
                        height: WidgetSize(context).sizedBox57,
                        child: Row(
                          children: [
                            Expanded(
                                child: RippleDecorationButton(
                                    onTap: refuse,
                                    borderRadius:  BorderRadius.only(
                                        bottomLeft: Radius.circular(WidgetSize(Get.context!).dialogCircular)
                                    ),
                                    border: Border(
                                      top: BorderSide(
                                        width: WidgetSize(context).sizedBox1_5,
                                        color: Style.greyEAEAEA,
                                      ),
                                      right: BorderSide(
                                        width: WidgetSize(context).sizedBox1_5,
                                        color: Style.greyEAEAEA,
                                      ),
                                    ),
                                    widget: Center(
                                      child: Text(
                                         '닫기',
                                        style: TextStyle(
                                            color: Colors.lightBlue,
                                            fontWeight: FontWeight.w500,
                                            fontSize: WidgetSize(Get.context!).sizedBox17
                                        ),
                                      ),
                                    )
                                )

                            ),
                            Expanded(
                                child: RippleDecorationButton(
                                    onTap: confirm,
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(WidgetSize(Get.context!).dialogCircular)
                                    ),
                                    border: Border(
                                      top: BorderSide(
                                        width: WidgetSize(context).sizedBox1_5,
                                        color: Style.greyEAEAEA,
                                      ),
                                    ),
                                    widget: Center(
                                      child: Text(
                                        '설정',
                                        style: TextStyle(
                                            color: Colors.lightBlue,
                                            fontWeight: FontWeight.w500,
                                            fontSize: WidgetSize(Get.context!).sizedBox17
                                        ),
                                      ),
                                    )
                                )
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
      );
    });
  }


  void customDialogPermission({
    required BuildContext routerContext,
    required int route,
  }){

    Future.delayed(Duration.zero, (){
      showDialog<String>(
          context: routerContext,
          barrierDismissible: false,
          builder: (BuildContext context) =>
              Dialog(
                backgroundColor: Style.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(WidgetSize(Get.context!).dialogCircular))
                ),
                child: Container(
                  color: Colors.transparent,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        color: Colors.transparent,
                        padding: WidgetSize(Get.context!).paddingBodyWhole,
                        height: WidgetSize(Get.context!).height60px,
                        child: Row(
                          children: [
                            Text(switch(route){
                              0 => '위치 권한',
                              1 => '사진 권한',
                              2 => '카메라 권한',
                              _ => '알림 권한',
                            }, style: TextStyle(color: Style.blackWrite, fontWeight: FontWeight.w700, fontSize: WidgetSize(Get.context!).sizedBox20),)
                          ],
                        ),
                      ),
                      Container(
                        height: WidgetSize(Get.context!).width001,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border(
                                bottom: BorderSide(
                                    color: Style.yellow,
                                    width: WidgetSize(Get.context!).sizedBox4
                                )
                            )
                        ),
                      ),
                      Container(
                        color: Colors.transparent,
                        padding: EdgeInsets.symmetric(vertical: WidgetSize(Get.context!).height60px3n1, horizontal: WidgetSize(Get.context!).sizedBox16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              switch(route){
                                0 => "해당 기능을 이용하기 위해서는 '위치' 권한이 필요합니다. 앱 설정으로 이동하시겠어요?",
                                1 => "해당 기능을 이용하기 위해서는 '사진' 권한이 필요합니다. 앱 설정으로 이동하시겠어요?",
                                2 => "해당 기능을 이용하기 위해서는 '카메라' 권한이 필요합니다. 앱 설정으로 이동하시겠어요?",
                                _ => "'알림' 권한이 없으면, 견적, 채팅, 공지 등 앱 중요 기능의 최신 데이터를 받을 수 없습니다. 원활한 앱 사용을 위해, 앱 설정으로 이동하시겠어요?",
                              },
                              style: TextStyle(
                                  color: Style.blackWrite,
                                  fontWeight: FontWeight.w400,
                                  fontSize: WidgetSize(Get.context!).dialogString
                              ),
                              textAlign: TextAlign.left,
                            )
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.transparent,
                        padding: EdgeInsets.symmetric(horizontal: WidgetSize(Get.context!).sizedBox16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              switch(route){
                                0 => '(위치 => 앱을 사용하는 동안 혹은 항상)',
                                1 => "(사진 => 제한된 접근 혹은 전체 접근)",
                                2 => "(카메라 => ON)",
                                _ => '(알림 => 알림 허용 ON)',
                              },
                              style: TextStyle(
                                  color: Style.blackWrite,
                                  fontWeight: FontWeight.w400,
                                  fontSize: WidgetSize(Get.context!).sizedBox17
                              ),
                              textAlign: TextAlign.left,
                            )
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.transparent,
                        padding: EdgeInsets.symmetric(vertical: WidgetSize(Get.context!).sizedBox30, horizontal: WidgetSize(Get.context!).sizedBox16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            RippleDecorationButton(
                                onTap: () async{
                                  final url = switch(route){
                                    0 => ApiConsole.permissionLocation,
                                    1 => ApiConsole.permissionPhotos,
                                    2 => ApiConsole.permissionCamera,
                                    _ => ApiConsole.permissionNotification,
                                  };
                                  final uri = Uri.parse(url);
                                  await launchUrl(uri);
                                },
                                color: Style.white,
                                widget: SizedBox(
                                  width: WidgetSize(Get.context!).sizedBox100,
                                  height: WidgetSize(Get.context!).sizedBox40,
                                  child: Center(
                                    child: Text(
                                      '예시 보기',
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.w400,
                                          fontSize: WidgetSize(Get.context!).sizedBox18
                                      ),
                                    ),
                                  ),
                                )
                            )
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.transparent,
                        height: WidgetSize(Get.context!).height60px,
                        child: Row(
                          children: [
                            Expanded(
                                child: RippleDecorationButton(
                                    onTap: (){ Get.back(); },
                                    color: Style.greyD9D9D9,
                                    borderRadius:  BorderRadius.only(
                                        bottomLeft: Radius.circular(WidgetSize(Get.context!).dialogCircular)
                                    ),
                                    widget: Center(
                                      child: Text(
                                        '닫기',
                                        style: TextStyle(
                                            color: Style.grey666666,
                                            fontWeight: FontWeight.w400,
                                            fontSize: WidgetSize(Get.context!).dialogString
                                        ),
                                      ),
                                    )
                                )

                            ),
                            Expanded(
                                child: RippleDecorationButton(
                                    onTap: () async{
                                      Get.back();
                                      await AppSettings.openAppSettings(type: AppSettingsType.settings);
                                      if(route > 2){
                                        while(await _checkPermission(Permission.notification) != PermissionStatus.granted){
                                          await Future.delayed(Duration(seconds: 2));

                                        }

                                        await SrcInfoController.to.statusCheckRe();
                                      }
                                    },
                                    color:  Style.yellow,
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(WidgetSize(Get.context!).dialogCircular)
                                    ),
                                    widget: Center(
                                      child: Text(
                                        '앱 설정',
                                        style: TextStyle(
                                            color: Style.brown,
                                            fontWeight: FontWeight.w400,
                                            fontSize: WidgetSize(Get.context!).dialogString
                                        ),
                                      ),
                                    )
                                )
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
      );
    });
  }


}