import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/create_deal/manager/create_deal_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/create_deal/step/invite_deal/manager/helper/invite_deal_manager_helper_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class InviteDealManager {
  final InviteDealManagerHelperBloc bloc;
  const InviteDealManager({
    required this.bloc,
  });

  void closePageDialog(BuildContext context){
    context.read<VerseConfig>().browser.dialog.customDialog(
        routerContext: context,
        mainText: '지금 딜을 등록하시겠습니까?',
        captionText: '초대한 매장이 없으면 견적을 받으실 수 없습니다.',
        confirmText: '네',
        conFirmOnTap: (){
          context.read<VerseConfig>().route.closeDialog(context);
          context.read<VerseConfig>().route.closePage(context);
          context.read<CreateDealManager>().createCallback();
        },
        cancelText: '아니요',
        cancelOnTap: (){
          context.read<VerseConfig>().route.closeDialog(context);
        }
    );
  }




}