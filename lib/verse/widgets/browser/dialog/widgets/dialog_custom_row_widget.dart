import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/bd_ripple_button_basic.dart';
import 'package:flutter/material.dart';

class DialogCustomRowWidget extends StatelessWidget {
  final CommonSize size;
  final String mainText;
  final String? cancelText;
  final String confirmText;
  final GestureTapCallback conFirmOnTap;
  final GestureTapCallback cancelOnTap;
  const DialogCustomRowWidget({super.key,
    required this.size,
    required this.mainText,
    required this.cancelText,
    required this.confirmText,
    required this.conFirmOnTap,
    required this.cancelOnTap
  });


  @override
  Widget build(BuildContext context) {
    return  Dialog(
      backgroundColor: white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(size.dialogCircular))
      ),
      child: Container(
        color: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              color: Colors.transparent,
              padding: EdgeInsets.symmetric(vertical: size.sizedBox45, horizontal: size.sized16grid),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    mainText,
                    style: TextStyle(
                        color: blackWrite,
                        fontWeight: FontWeight.w400,
                        fontSize: size.titleMain
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            Container(
              color: Colors.transparent,
              height: size.sizedButton,
              child: Row(
                children: [
                  Expanded(
                      child: BdRippleButtonBasic(
                          padding: EdgeInsets.symmetric(
                              horizontal:  size.sized16grid
                          ),
                          onTap: cancelOnTap,
                          color: greyD9D9D9,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(size.dialogCircular),
                          ),
                          child: Center(
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                cancelText ?? '',
                                style: TextStyle(
                                    color: grey666666,
                                    fontWeight: FontWeight.w500,
                                    fontSize: size.titleButton
                                ),
                              ),
                            ),
                          )
                      )
                  ),
                  Expanded(
                      child: BdRippleButtonBasic(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(size.dialogCircular)
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: size.sized16grid
                          ),
                          onTap: conFirmOnTap,
                          color: yellow,
                          child: Center(
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                confirmText,
                                style: TextStyle(
                                    color: brown,
                                    fontWeight: FontWeight.w500,
                                    fontSize: size.titleButton
                                ),
                              ),
                            ),
                          )
                      )

                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
