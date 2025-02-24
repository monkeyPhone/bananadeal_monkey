import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/etc/tab/alert_setting/view/etc_tab_alert_setting_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/etc/tab/info_setting/view/etc_tab_info_setting_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/route/state/cubit/banana_route/banana_route_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EtcManager {
  const EtcManager();

  void logout(BuildContext context){
    context.read<VerseConfig>().browser.dialog.customDialog(
        routerContext: context,
        barrierDismissible: true,
        mainText: '로그아웃을 진행하시겠습니까?',
        captionText: '${context.read<BananaRouteCubit>().state.userVO.mEmail} 계정의 로그아웃이 진행됩니다.',
        confirmText: '로그아웃',
        conFirmOnTap: (){
          context.read<VerseConfig>().route.closeDialog(context);
          context.read<VerseConfig>().route.logout(context: context, idx: context.read<BananaRouteCubit>().state.userVO.mIdx, how: true);
        },
        cancelText: '취소',
        cancelOnTap: (){
          context.read<VerseConfig>().route.closeDialog(context);
        }
    );
  }

  void gotoEtcTabAlertSettingView(BuildContext context){
    context.read<VerseConfig>().route.createRoute(
        context: context,
        connectCheck: true,
        routerWidget: const EtcTabAlertSettingView()
    );
  }

  void gotoEtcTabInfoSettingView(BuildContext context){
    context.read<VerseConfig>().route.createRoute(
        context: context,
        connectCheck: true,
        routerWidget: const EtcTabInfoSettingView()
    );
  }


}