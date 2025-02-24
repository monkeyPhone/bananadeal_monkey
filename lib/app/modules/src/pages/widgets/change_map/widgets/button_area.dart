import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../components/common_dialog/common_widgets_2.dart';
import '../../../../../../components/disable_button.dart';
import '../../../../../../components/neumorphic_buttons.dart';
import '../../../../../../css/size.dart';
import '../../../../../../managers/permission/permission_handler_manager.dart';
import '../change_map_controller.dart';


class ButtonArea extends StatelessWidget {
  const ButtonArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChangeMapController>
      (builder:(controller){
        return (controller.longtitude.value != '' && controller.latitude.value != ''
            && controller.dong.value != '' && controller.addr.value != '') || controller.extend.value
            ?
        Padding(
          padding: EdgeInsets.only(bottom: controller.extend.value ? WidgetSize(context).sizedBox24 : 0 ),
          child: const SizedBox(),
        )
            :
        Padding(
          padding: EdgeInsets.symmetric(vertical: WidgetSize(context).sizedBox28),
          child: controller.addressInput.value != ''
              ?
          const DisableButton(text: '지금은 검색중입니다.')
              :
          NeumorphicButtons(text: '지도에서 선택하기', onPressed: () async{
            if(GetPlatform.isIOS){
              final locations = await PermissionHandlerManager().checkPermission(PermissionHandlerManager.location);
              if(locations == PermissionHandlerManager.granted){
                controller.successGotoNaverMap(context);
              } else {
                CommonWidgets2().customDialogPermission(routerContext: context, route: 0);
              }

            } else{
              controller.successGotoNaverMap(context);
            }
            }
          ),
        );
      }
    );
  }
}
