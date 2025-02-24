

import 'package:app_settings/app_settings.dart';
import 'package:banana_deal_by_monkeycompany/config/verse/verse_config.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/size/common_size.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/browser/snack/browser_snackbar.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/bd_ripple_button_basic.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../util/color/const_color.dart';

class RouteHelperDialog {
  const RouteHelperDialog();

  void showSnackBar({
    required BrowserSnackbar snackbar,
    required BuildContext context,required String text,  String? label}) =>
      snackbar.showSnackBar(text: text, label: label, context: context,);

  void customDialogPermission({
    required BuildContext routerContext,
    required int route,
  }){

    Future.delayed(Duration.zero, (){
      if(routerContext.mounted){
        showDialog<String>(
            context: routerContext,
            barrierDismissible: false,
            builder: (BuildContext context) =>
                _Dialog(
                  route: route,
                  widgetSize: context.read<VerseConfig>().size,)
        );
      }
    });
  }

}

class _Dialog extends StatelessWidget {
  final int route;
  final CommonSize widgetSize;
  const _Dialog({
    required this.route,
    required this.widgetSize
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(widgetSize.dialogCircular))
      ),
      child: Container(
        color: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              color: Colors.transparent,
              padding: widgetSize.paddingBodyWhole,
              height: widgetSize.height60px,
              child: Row(
                children: [
                  Text(switch(route){
                    0 => '위치 권한',
                    1 => '사진 권한',
                    2 => '카메라 권한',
                    _ => '알림 권한',
                  }, style: TextStyle(color: blackWrite, fontWeight: FontWeight.w700, fontSize: widgetSize.sizedBox20),)
                ],
              ),
            ),
            Container(
              height: widgetSize.width001,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border(
                      bottom: BorderSide(
                          color: yellow,
                          width: widgetSize.sizedBox4
                      )
                  )
              ),
            ),
            Container(
              color: Colors.transparent,
              padding: EdgeInsets.symmetric(vertical: widgetSize.height60px3n1, horizontal: widgetSize.sizedBox16),
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
                        color: blackWrite,
                        fontWeight: FontWeight.w400,
                        fontSize: widgetSize.dialogString
                    ),
                    textAlign: TextAlign.left,
                  )
                ],
              ),
            ),
            Container(
              color: Colors.transparent,
              padding: EdgeInsets.symmetric(horizontal: widgetSize.sizedBox16),
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
                        color: blackWrite,
                        fontWeight: FontWeight.w400,
                        fontSize: widgetSize.sizedBox17
                    ),
                    textAlign: TextAlign.left,
                  )
                ],
              ),
            ),
            Container(
              color: Colors.transparent,
              padding: EdgeInsets.symmetric(vertical: widgetSize.sizedBox30, horizontal: widgetSize.sizedBox16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  BdRippleButtonBasic(
                      onTap: () async{
                        final url = switch(route){
                          0 => context.read<VerseConfig>().url.permissionLocation,
                          1 => context.read<VerseConfig>().url.permissionPhotos,
                          2 => context.read<VerseConfig>().url.permissionCamera,
                          _ => context.read<VerseConfig>().url.permissionNotification,
                        };
                        final uri = Uri.parse(url);
                        await launchUrl(uri);
                      },
                      color: white,
                      child: SizedBox(
                        width: widgetSize.sizedBox100,
                        height: widgetSize.sizedBox40,
                        child: Center(
                          child: Text(
                            '예시 보기',
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w400,
                                fontSize: widgetSize.sizedBox18
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
              height: widgetSize.height60px,
              child: Row(
                children: [
                  Expanded(
                      child: BdRippleButtonBasic(
                          onTap: (){
                            context.read<VerseConfig>().route.closeDialog(context);
                          },
                          color: greyD9D9D9,
                          borderRadius:  BorderRadius.only(
                              bottomLeft: Radius.circular(widgetSize.dialogCircular)
                          ),
                          child: Center(
                            child: Text(
                              '닫기',
                              style: TextStyle(
                                  color: grey666666,
                                  fontWeight: FontWeight.w400,
                                  fontSize: widgetSize.dialogString
                              ),
                            ),
                          )
                      )

                  ),
                  Expanded(
                      child: BdRippleButtonBasic(
                          onTap: () async{
                            context.read<VerseConfig>().route.closeDialog(context);
                            await AppSettings.openAppSettings(type: AppSettingsType.settings);
                            // if(route > 2){
                            //   while(await _checkPermission(Permission.notification) != PermissionStatus.granted){
                            //     await Future.delayed(Duration(seconds: 2));
                            //
                            //   }
                            //
                            //   await SrcInfoController.to.statusCheck();
                            // }
                          },
                          color:  yellow,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(widgetSize.dialogCircular)
                          ),
                          child: Center(
                            child: Text(
                              '앱 설정',
                              style: TextStyle(
                                  color: brown,
                                  fontWeight: FontWeight.w400,
                                  fontSize: widgetSize.dialogString
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
    );
  }
}
