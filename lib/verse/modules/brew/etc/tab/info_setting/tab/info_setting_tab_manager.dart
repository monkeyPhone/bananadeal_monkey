import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/info_edit/info_edit_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/etc/tab/info_setting/tab/member_out/view/info_setting_tab_member_out_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/etc/tab/info_setting/tab/nick_name/view/info_setting_tab_nickname_dialog.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/etc/tab/info_setting/tab/password/view/info_setting_tab_password_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InfoSettingTabManager {
  final InfoEditRepository repository;
  const InfoSettingTabManager({
    required this.repository,
  });

  void nickNameDialog(BuildContext routerContext) async{
    await Future.delayed(Duration.zero, (){
      if(routerContext.mounted){
        showDialog<String>(
            context: routerContext,
            barrierDismissible: true,
            builder: (BuildContext context) =>
                InfoSettingTabNicknameDialog(
                  routerContext: routerContext,
                  repository: repository,
                )
        );
      }
    });
  }

  void passwordDialog(BuildContext routerContext) async{
    await Future.delayed(Duration.zero, (){
      if(routerContext.mounted){
        showDialog<String>(
            context: routerContext,
            barrierDismissible: true,
            builder: (BuildContext context) =>
                InfoSettingTabPasswordDialog(repository: repository,)
        );
      }
    });
  }

  void gotoMemberOut(BuildContext context) =>
    context.read<VerseConfig>().route.createRoute(
        context: context,
        connectCheck: true,
        routerWidget:  InfoSettingTabMemberOutView(repository: repository,)
    );

}