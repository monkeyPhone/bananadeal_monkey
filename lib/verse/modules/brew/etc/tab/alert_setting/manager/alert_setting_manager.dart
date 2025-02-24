import 'package:banana_deal_by_monkeycompany/config/datetime_config.dart';
import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/etc/tab/alert_setting/state/bloc/banana_alert_setting/banana_alert_setting_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/route/state/cubit/banana_route/banana_route_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class AlertSettingManager {
  const AlertSettingManager();

  void changeViewMode(BuildContext context) => context.read<BananaAlertSettingBloc>().add(const InitSetting());

  void changeEditeMode(BuildContext context){
    context.read<VerseConfig>().browser.dialog.customDialog(
        routerContext: context,
        mainText: '알림 설정 변경 모드를 실행하시겠습니까?',
        captionText: '(상단 오른쪽 아이콘 취소 클릭으로 모드 해제)',
        confirmText: '변경',
        conFirmOnTap: (){
          context.read<VerseConfig>().route.closeDialog(context);
          context.read<BananaAlertSettingBloc>().add(ChangeEditMode(
              isEditMode: true,
              isSpValue: context.read<BananaRouteCubit>().state.userVO.mSpPush == 'Y',
              isSpDate: context.read<BananaRouteCubit>().state.userVO.mEditDateSp,
              isMpValue: context.read<BananaRouteCubit>().state.userVO.mMpPush == 'Y',
              isMpDate: context.read<BananaRouteCubit>().state.userVO.mEditDateMp,
              isDealPush: context.read<BananaRouteCubit>().state.userVO.mAppPush == 'Y',
              isChatPush: context.read<BananaRouteCubit>().state.userVO.mChatPush == 'Y',
              isAddPush: context.read<BananaRouteCubit>().state.userVO.mGwanggoPush == 'Y'
          ));
        },
        cancelText: '취소',
        cancelOnTap: (){
          context.read<VerseConfig>().route.closeDialog(context);
        }
    );
  }


  void alertResult({
    required BuildContext context,
    required bool isSp,
    required String originDate,
    required bool val
  }){
   if(originDate == '' && val){
     context.read<VerseConfig>().browser.dialog.basicNotiDialog(
         routerContext: context,
         title: isSp
             ?  '서비스 알림 수신 처리 결과'
             :  '광고성 정보 수신 처리 결과',
         content: '수신동의 처리 완료',
         date: DateFormat("yyyy년 MM월 dd일").format(DateTimeConfig().now),
         result: '',
         isBox: true, isOneButton: true, confirm: (){
     },
         refuse: (){
           context.read<VerseConfig>().route.closeDialog(context);
           if(isSp){
             context.read<BananaAlertSettingBloc>().add(ChangeSp(isSpValue: val));
           }
           else{
             context.read<BananaAlertSettingBloc>().add(ChangeMp(isMpValue: val));
           }
         }
     );
   } else{
     if(isSp){
       context.read<BananaAlertSettingBloc>().add(ChangeSp(isSpValue: val));
     }
     else{
       context.read<BananaAlertSettingBloc>().add(ChangeMp(isMpValue: val));
     }
   }
  }

}