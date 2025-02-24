import 'package:banana_deal_by_monkeycompany/package/data/rank_vo.dart';
import 'package:flutter/material.dart';

abstract class CommonDialog {
  const CommonDialog();

  void customDialog({
    required BuildContext routerContext,
    bool? barrierDismissible, required String mainText,
    required String captionText,
    String? cancelText, required String confirmText, required GestureTapCallback conFirmOnTap, required GestureTapCallback cancelOnTap,
    bool? isOne,
  });

  void basicDialog({
    required BuildContext routerContext,
    required String mainText,
    required GestureTapCallback onTap,
  });

  void closeAppDialog({
    required BuildContext routerContext,
  });


  void customDialogColumn({
    required BuildContext routerContext,
    bool? barrierDismissible, required String mainText,
    String? cancelText, required String confirmText,
    required GestureTapCallback conFirmOnTap, required GestureTapCallback cancelOnTap,
  });


  void customDialogRow({
    required BuildContext routerContext,
    bool? barrierDismissible, required String mainText,
    String? cancelText, required String confirmText, required GestureTapCallback conFirmOnTap, required GestureTapCallback cancelOnTap,
  });

  void customDialogRank({
    required BuildContext routerContext,
    required RankVO rank,
  });

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
  });


  void loadingDialog(BuildContext routerContext);


}