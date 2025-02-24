import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/bd_ripple_button_basic.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_custom_pad.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class DialogCustomWidget extends StatelessWidget {
  final String mainText;
  final String? cancelText;
  final String confirmText;
  final String captionText;
  final GestureTapCallback conFirmOnTap;
  final GestureTapCallback cancelOnTap;
  final bool? isOne;

  const DialogCustomWidget({
    super.key,

    required this.mainText,
    required this.cancelText,
    required this.confirmText,
    required this.captionText,
    required this.conFirmOnTap,
    required this.cancelOnTap,
    required this.isOne
  });

  @override
  Widget build(BuildContext context) {
    final CommonSize widgetSize = context.read<VerseConfig>().size;
    return Dialog(
      backgroundColor: white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(widgetSize.dialogCircular))
      ),
      child: Container(
        color: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Container(
            //   color: Colors.transparent,
            //   padding: widgetSize.paddingBodyWhole,
            //   height: widgetSize.height60px,
            //   child: Row(
            //     children: [
            //       Text('알림', style: TextStyle(color: blackWrite, fontWeight: FontWeight.w700, fontSize: widgetSize.sizedBox20),)
            //     ],
            //   ),
            // ),
            // Container(
            //   height: widgetSize.width001,
            //   decoration: BoxDecoration(
            //       color: Colors.transparent,
            //       border: Border(
            //           bottom: BorderSide(
            //               color: yellow,
            //               width: widgetSize.sizedBox4
            //           )
            //       )
            //   ),
            // ),
            Container(
              width: widgetSize.widthCommon,
              color: Colors.transparent,
              padding: EdgeInsets.symmetric(vertical: widgetSize.sized32grid, horizontal: widgetSize.sized16grid),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    mainText,
                    style: TextStyle(
                        color: blackWrite,
                        fontWeight: FontWeight.w500,
                        fontSize: widgetSize.titleButton
                    ),
                    textAlign: TextAlign.left,
                  ),
                  captionText == ''
                      ? const SizedBox()
                      : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const BdCustomPad(padEnum: PadEnum.height16),
                      Text(
                        captionText,
                        style: TextStyle(
                            color: Colors.grey[700],
                            fontWeight: FontWeight.w400,
                            fontSize: widgetSize.body
                        ),
                        textAlign: TextAlign.left,
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.transparent,
              margin: EdgeInsets.only(
                left: widgetSize.sized16grid,
                right: widgetSize.sized16grid,
                bottom: widgetSize.sized16grid
              ),
              height:  widgetSize.sizedDialogButton,
              child: isOne == true
                  ?  BdRippleButtonBasic(
                  onTap: conFirmOnTap,
                  color: yellow,
                  borderRadius: BorderRadius.circular(widgetSize.sized8grid),
                  child: Center(
                    child: Text(
                      confirmText,
                      style: TextStyle(
                          color: brown,
                          fontWeight: FontWeight.w400,
                          fontSize: widgetSize.titleLittle
                      ),
                    ),
                  )
              )
                  : Row(
                children: [
                  Expanded(
                      child: BdRippleButtonBasic(
                          padding: EdgeInsets.symmetric(
                              horizontal: widgetSize.sized16grid
                          ),
                          onTap: cancelOnTap,
                          color: greyD9D9D9,
                          borderRadius:  BorderRadius.circular(widgetSize.sized8grid),
                          child: Center(
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                cancelText ?? '',
                                style: TextStyle(
                                    color: grey666666,
                                    fontWeight: FontWeight.w400,
                                    fontSize: widgetSize.titleLittle
                                ),
                              ),
                            ),
                          )
                      )

                  ),
                  const BdCustomPad(padEnum: PadEnum.width12),
                  Expanded(
                      child: BdRippleButtonBasic(
                          padding: EdgeInsets.symmetric(
                              horizontal:  widgetSize.sized16grid
                          ),
                          onTap: conFirmOnTap,
                          color: yellow,
                          borderRadius: BorderRadius.circular(widgetSize.sized8grid),
                          child: Center(
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                confirmText,
                                style: TextStyle(
                                    color: brown,
                                    fontWeight: FontWeight.w400,
                                    fontSize: widgetSize.titleLittle
                                ),
                              ),
                            ),
                          )
                      )
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
