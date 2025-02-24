import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_custom_pad.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomAlertSpecialDialog extends StatelessWidget {
  const CustomAlertSpecialDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, Object? result) {
        if(didPop) {
          return;
        }
        // _provider.closeDialog(context);
        // routerContext.read<PermissionEvent>().permissionRequestAll(routerContext);

      },
      child: GestureDetector(
        onTap: (){
          // _provider.closeDialog(context);
          // routerContext.read<PermissionEvent>().permissionRequestAll(routerContext);

        },
        child: Dialog(
          alignment: Alignment.topCenter,
          backgroundColor: white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(size.dialogCircular))
          ),
          child: Container(
            color: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const BdCustomPad(padEnum: PadEnum.height12),
                Container(
                  color: Colors.transparent,
                  padding: EdgeInsets.all(
                    size.sizedBox12,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('안내',
                        style: TextStyle(
                            color: blackWrite,
                            fontWeight: FontWeight.w700,
                            fontSize: size.sizedBox18),
                        maxLines: 2,
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
                Container(
                  color: Colors.transparent,
                  padding: EdgeInsets.symmetric(
                    vertical: size.sizedBox12,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      RichText(
                        text: TextSpan(
                            text: '팝업창이 나타나면',
                            style: TextStyle(
                                fontSize: size.sizedBox17,
                                fontWeight: FontWeight.w400,
                                color: blackWrite
                            ),
                            children: [
                              TextSpan(
                                  text: "\n'모두 허용'\n",
                                  style: TextStyle(
                                      fontSize: size.sizedBox18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.blue
                                  )
                              ),
                              TextSpan(
                                text: "을 선택해주세요.",
                                style: TextStyle(
                                    fontSize: size.sizedBox17,
                                    fontWeight: FontWeight.w400,
                                    color: blackWrite
                                ),
                              ),
                              // TextSpan(
                              //   text: "\n\n(선택 이후 팝업창 클릭)",
                              //   style: TextStyle(
                              //       fontSize: WidgetSize(context).sizedBox17,
                              //       fontWeight: FontWeight.w400,
                              //       color: Style.blackWrite
                              //   ),
                              // ),
                            ]
                        ),
                      ),
                    ],
                  ),
                ),
                const BdCustomPad(padEnum: PadEnum.height20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
