import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_label.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/browser/snack/widget/snackbar_basic_content.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/text/bd_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';




class BrowserSnackbar {

  const BrowserSnackbar();

  SnackBar _snackBar({
    required BuildContext context,
    required String text,
    String? label,

  }){
    final CommonSize widgetSize = context.read<VerseConfig>().size;

    final snackBar = SnackBar(
      clipBehavior: Clip.antiAlias,
      elevation: 7,
      showCloseIcon: true,
      closeIconColor: yellow,
      behavior: SnackBarBehavior.floating,
      duration: const Duration(milliseconds: 7000),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(widgetSize.sizedBox12),
      ),
      backgroundColor: Colors.black87,
      content:  SizedBox(
        child: BdTextWidget(
          text: text,
          textStyle: bodyWhiteBold,
          maxLines: 10,
        ),
      ),
      // action: SnackBarAction(
      //   label: label ?? '확인',
      //   textColor: seoulYellow,
      //   onPressed: (){
      //
      //   },
      // ),
    );

    return snackBar;
  }


  void showSnackBar({required BuildContext context, required String text,  String? label, }){
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
        _snackBar(text: text, label: label, context: context
        )
    );
  }

  void removeSnack(BuildContext context){
    ScaffoldMessenger.of(context).removeCurrentSnackBar(
        reason: SnackBarClosedReason.remove
    );
  }


  SnackBar _notiSnackBar({
    required BuildContext context,
    required int duration,
    VoidCallback? onPressed,
    required String title,
    required String text,
    String? label,
    String? url,
  }){

    final snackBar = SnackBar(
      // behavior: SnackBarBehavior.floating,
      duration: Duration(milliseconds: duration),
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.circular(WidgetSize(context).sizedBox7_5),
      // ),
      backgroundColor: bananaBack,
      elevation: 5.0,
      content: SnackbarBasicContent(
        imageUrl: url, title: title, text: text,
      ),
      action: SnackBarAction(
        label: label ?? '확인',
        textColor: yellow,
        onPressed: onPressed ?? (){},
      ),
    );

    return snackBar;
  }

  void showSnackBarNoti({
    required BuildContext context,
    required int duration,
    VoidCallback? onPressed,
    required String title,
    required String text,
    String? label,
    String? url}){
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
        _notiSnackBar(
          context: context,
            duration: duration, onPressed: onPressed, title: title, text: text, label: label, url: url
        )
    );
  }
}