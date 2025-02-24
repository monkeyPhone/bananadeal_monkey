import 'package:app_settings/app_settings.dart';
import 'package:banana_deal_by_monkeycompany/config/verse/verse_config.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/permission/src/helper/dialog/components/permission_setting_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PermissionDialog {

  const PermissionDialog();



  void permissionSettingsDialog({
    required BuildContext routerContext,
    required List<String> permission,
    required int sdkVersion,
  }) {

    Future.delayed(Duration.zero, (){
     if(routerContext.mounted){
       showDialog<String>(
           context: routerContext,
           barrierDismissible: false,
           builder: (BuildContext context) =>
               PermissionSettingsDialog(
                 permission: permission,
                 sdkVersion: sdkVersion,
                 cancelTap: (){
                   context.read<VerseConfig>().route.closePage(context);
                 },
                 confirmTap: (){
                   context.read<VerseConfig>().route.closePage(context);
                   AppSettings.openAppSettings(type: AppSettingsType.settings);
                 },
               )
       );
     }
    });
  }


}