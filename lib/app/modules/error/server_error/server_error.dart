import 'dart:io';

import 'package:banana_deal_by_monkeycompany/app/components/neumorphic_buttons.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/error/server_error/server_error_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/error/server_error/widgets/error_guide.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../css/app_basic_component/bagic_canvas.dart';
import '../../../css/size.dart';
import '../../../css/style.dart';
import '../../../routes/const_element.dart';
import '../../main/auth/auth_controller.dart';

class ServerError extends GetView<ServerErrorController> {
  const ServerError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasicCanvas(
      canPop: false,
      onPopInvoked: (bool didPop, Object? result){
        if(didPop) {
          return;
        }
      },
      body: ObxValue(
          (err) =>
              Column(
                children: [
                  Container(
                    padding: WidgetSize(context).paddingBodyWhole,
                    color: Style.white,
                    height: WidgetSize(context).height60px,
                    width: WidgetSize(context).widthCommon,
                    child: GestureDetector(
                      onTap: (){
                        Get.back();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            switch(err.value.status){
                              510 => '정기 서비스 점검 안내',
                              _ => 'ERROR CODE : ${err.value.status}'
                            },
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: WidgetSize(context).sizedBox24,
                                color: Style.blackWrite
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                      fit: FlexFit.tight,
                      child: _imageArea(err.value.status)),

                  Flexible(
                      fit: FlexFit.tight,
                      child: ErrorGuide(statusCode: controller.error.value.status,)),

                ],
              )
        ,controller.error
      ),
      bottomNavigationBar: Container(
        color: Style.white,
        child: SafeArea(
          child: GetBuilder<ServerErrorController>(
            builder: (controllers)=>
                Container(
                  padding: WidgetSize(context).paddingBodyWhole,
                  color: Style.white,
                  height: controllers.deviceHeght.value,
                  width: WidgetSize(context).widthCommon,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      controller.error.value.status == 510 ?
                      NeumorphicButtons(
                          text: '확인', onPressed: () async{
                        GetPlatform.isAndroid ? await SystemNavigator.pop()
                            : GetPlatform.isIOS
                            ?  exit(0)
                            : null;
                      })
                      : controller.error.value.status == 504 ?
                      NeumorphicButtons(
                          text: '앱 초기화', onPressed: () async{
                        await AuthController.to.appAllClear();
                      }) :
                          _ServerBN()
                    ],
                  ),
                ),
          ),
        ),
      ),
    );

  }

  Widget _imageArea(int status){
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              status == 510
                  ? AppElement.serverWait
                  : AppElement.defaultImgNo
            ),
            fit: BoxFit.fitHeight,
          )
      ),
    );
  }




}


class _ServerBN extends GetView<ServerErrorController> {
  const _ServerBN();

  @override
  Widget build(BuildContext context) {
    return NeumorphicButtons(
        boxColor:  Style.yellow,
        textColor:  Style.brown,
        text:  '돌아가기',
        onPressed: () async{
         await controller.checkInternetStatus();
        });
  }
}
