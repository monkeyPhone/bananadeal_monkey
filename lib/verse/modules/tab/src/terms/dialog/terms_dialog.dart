import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/terms/dialog/terms_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TermsDialog {
  const TermsDialog();

  void closeDialog(BuildContext context) => context.read<VerseConfig>().route.closeDialog(context);
  void closePage(BuildContext context) => context.read<VerseConfig>().route.closePage(context);

  void clickDialog({
    required BuildContext routerContext,
    required int index,
    required String tService,
    required String tPrivacy,
    required String tLocation,
    required ScrollController sController1,
    required ScrollController sController2,
    required ScrollController sController3,
  }){
    Future.delayed(Duration.zero, (){
      if(routerContext.mounted){
        showDialog<String>(
            context: routerContext,
            builder: (BuildContext context) =>
                PopScope(
                  canPop: false,
                  onPopInvokedWithResult: (bool didPop, Object? result) {
                    if(didPop){
                      return ;
                    }
                    closeDialog(context);
                  },
                  child: TermsDialogWidget(
                    onTap: (){
                      closeDialog(context);
                    },
                    index: index,
                    tService: tService,
                    tPrivacy: tPrivacy,
                    tLocation: tLocation,
                    sController1: sController1,
                    sController2: sController2,
                    sController3: sController3,
                  ),
                )
        );
      }
    });
  }


}