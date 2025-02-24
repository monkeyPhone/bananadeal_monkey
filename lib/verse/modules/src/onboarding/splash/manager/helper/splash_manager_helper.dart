import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashManagerHelper {
  const SplashManagerHelper();


  void openDialogOneButton({
    required BuildContext context,
    required String url,
    required GestureTapCallback conFirmOnTap,
    required GestureTapCallback cancelOnTap
  }) {
    context.read<VerseConfig>().browser.dialog
    .customDialog(
        routerContext: context,
        isOne: true,
        captionText: '현재 버전은 사용할 수 없습니다. 앱 사용을 위해, 업데이트 페이지로 이동합니다.',
        mainText: '최신 버전 업데이트',
        confirmText: '업데이트',
        conFirmOnTap: conFirmOnTap, cancelOnTap: cancelOnTap
    );
  }

  void openDialogTwoButton({
    required BuildContext context,
    required String url,
    required GestureTapCallback conFirmOnTap,
    required GestureTapCallback cancelOnTap
  }) {
    context.read<VerseConfig>().browser.dialog
    .customDialog(
        routerContext: context,
        barrierDismissible: false,
        mainText:  '최신 버전 업데이트',
        captionText: '최신 버전 업데이트를 위해, 업데이트 페이지로 이동하시겠습니까?',
        cancelText: '다음에',
        cancelOnTap: cancelOnTap,
        confirmText: '업데이트',
        conFirmOnTap: conFirmOnTap
    );
  }

}