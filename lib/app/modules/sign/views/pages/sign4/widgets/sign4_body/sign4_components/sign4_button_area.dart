import 'package:banana_deal_by_monkeycompany/app/managers/permission/permission_handler_manager.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/sign/controllers/sign_view_4_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../components/common_dialog/common_widgets_2.dart';
import '../../../../../../../../components/disable_button.dart';
import '../../../../../../../../components/neumorphic_buttons.dart';

class Sign4ButtonArea extends StatelessWidget {
  const Sign4ButtonArea({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignView4Controller>(
      builder: (controller){
        return controller.addressInput.value != ''
            ?   DisableButton(text: '지금은 검색중입니다.')
            :   NeumorphicButtons(
            text: '지도에서 선택하기',
            onPressed: () async{
             if(GetPlatform.isIOS){
               final locations = await PermissionHandlerManager().checkPermission(PermissionHandlerManager.location);
               if(locations == PermissionHandlerManager.granted && context.mounted){
                 controller.initAdress();
                 controller.determinePosition(context);
               } else {
                 CommonWidgets2().customDialogPermission(routerContext: Get.context!, route: 0);
               }

             } else{
               controller.initAdress();
               controller.determinePosition(context);
             }
            }
        );
      },
    );
  }
}
