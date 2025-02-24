import 'package:banana_deal_by_monkeycompany/config/verse/verse_config.dart';
import 'package:banana_deal_by_monkeycompany/package/data/rank_vo.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/broad/manager/broad_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/browser/dialog/widgets/dialog_basic.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/browser/dialog/widgets/dialog_basic_noti.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/browser/dialog/widgets/dialog_custom_column_widget.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/browser/dialog/widgets/dialog_custom_rank.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/browser/dialog/widgets/dialog_custom_row_widget.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/browser/dialog/widgets/dialog_custom_widget.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/loading/spin/bd_loading_spin.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BrowserDialog {

  const BrowserDialog();

  void customDialog({
    required BuildContext routerContext,
    bool? barrierDismissible, required String mainText,
    required String captionText,
    String? cancelText, required String confirmText, required GestureTapCallback conFirmOnTap, required GestureTapCallback cancelOnTap,
    bool? isOne,
  }) async{
    await Future.delayed(Duration.zero, (){
      if(routerContext.mounted){
        showDialog<String>(
            context: routerContext,
            barrierDismissible: barrierDismissible ?? false,
            builder: (BuildContext context) =>
                DialogCustomWidget(
                  mainText: mainText, cancelText: cancelText, confirmText: confirmText,
                  conFirmOnTap: conFirmOnTap,
                  cancelOnTap: cancelOnTap,
                  captionText: captionText,
                  isOne: isOne,
                )
        );
      }
    });
  }

  void basicDialog({
    required BuildContext routerContext,
    required String mainText,
    required GestureTapCallback onTap,
  }) async{
    await Future.delayed(Duration.zero, (){
      if(routerContext.mounted){
        showDialog<String>(
            context: routerContext,
            barrierDismissible: true,
            builder: (BuildContext context) =>
                DialogBasic(
                    size: context.read<VerseConfig>().size,
                    mainText: mainText,
                    onTap: onTap
                )
        );
      }
    });
  }

  void closeAppDialog({
    required BuildContext routerContext,
  }) =>
      customDialog(
        captionText: '',
        routerContext: routerContext,
        barrierDismissible: true,
        mainText: '바나나딜을 종료하시겠습니까?',
        cancelText: '취소',
        confirmText: '종료',
        cancelOnTap: (){
          routerContext.read<VerseConfig>().route.closeDialog(routerContext);
        },
        conFirmOnTap: () {
          routerContext.read<VerseConfig>().route.closeDialog(routerContext);
          if(!kIsWeb){
            routerContext.read<VerseConfig>().route.closeApp();
          } else {
            routerContext.read<VerseConfig>().route.appRouting(routerContext);
          }
        },
      );


  void customDialogColumn({
    required BuildContext routerContext,
    bool? barrierDismissible, required String mainText,
    String? cancelText, required String confirmText,
    required GestureTapCallback conFirmOnTap, required GestureTapCallback cancelOnTap,
  }) async{
    await Future.delayed(Duration.zero, (){
      if(routerContext.mounted){
        showDialog<String>(
            context: routerContext,
            barrierDismissible: barrierDismissible ?? false,
            builder: (BuildContext context) =>
                DialogCustomColumnWidget(
                    size: context.read<VerseConfig>().size,
                    mainText: mainText, cancelText: cancelText,
                    confirmText: confirmText, conFirmOnTap: conFirmOnTap, cancelOnTap: cancelOnTap
                )
        );
      }
    });
  }


  void customDialogRow({
    required BuildContext routerContext,
    bool? barrierDismissible, required String mainText,
    String? cancelText, required String confirmText, required GestureTapCallback conFirmOnTap, required GestureTapCallback cancelOnTap,
  }) async{
    await Future.delayed(Duration.zero, (){
      if(routerContext.mounted){
        showDialog<String>(
            context: routerContext,
            barrierDismissible: barrierDismissible ?? false,
            builder: (BuildContext context) =>
                DialogCustomRowWidget(
                    size: context.read<VerseConfig>().size,
                    mainText: mainText, cancelText: cancelText, confirmText: confirmText, conFirmOnTap: conFirmOnTap, cancelOnTap: cancelOnTap)
        );
      }
    });
  }

  void customDialogRank({
    required BuildContext routerContext,
    required RankVO rank,
  }) async{
    await Future.delayed(Duration.zero, (){
      if(routerContext.mounted){
        showDialog<String>(
            context: routerContext,
            barrierDismissible: true,
            builder: (BuildContext context) =>
                DialogCustomRank(
                  size: context.read<VerseConfig>().size,
                  rank: rank,
                  makeDealTap: (){
                    Navigator.pop(context);
                    routerContext.read<BroadManager>().gotoCreateDealView(
                        context: routerContext,
                        isIntro: true,
                        selectModel: ('${rank.psIdx}', rank.psName, rank.psModel, rank.piPath),
                    );
                  },
                  gotoDetailTap: (){
                    Navigator.pop(context);
                    routerContext.read<BroadManager>().gotoModelListDetailEvent(
                      context: routerContext,
                      isIntro: true,
                      psIdx: '${rank.psIdx}', ldcpName:  rank.psName,);
                  },

                )
        );
      }
    });
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
      if(routerContext.mounted){
        showDialog<String>(
            context: routerContext,
            barrierDismissible: false,
            builder: (BuildContext context) =>
                DialogBasicNoti(title: title, content: content, date: date, result: result, isBox: isBox, isOneButton: isOneButton, confirm: confirm, refuse: refuse)
        );
      }
    });
  }


  void loadingDialog(BuildContext routerContext) {
    Future.delayed(Duration.zero, (){
      if(routerContext.mounted){
        showDialog<String>(
            context: routerContext,
            barrierDismissible: false,
            builder: (BuildContext context) =>
                const PopScope(
                  canPop: false,
                  child: BdLoadingSpin(),
                )

        );
      }
    });
  }


}