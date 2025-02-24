import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/bd_ripple_button_basic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlertPermission34Dialog extends StatelessWidget {
  final BuildContext routerContext;
  final GestureTapCallback confirmTap;
  const AlertPermission34Dialog({super.key,
    required this.routerContext,
    required this.confirmTap
  });

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return Dialog(
      backgroundColor: white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
              Radius.circular(size.dialogCircular))
      ),
      child: Container(
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: size.sizedBox20,
            ),
            Container(
              color: Colors.transparent,
              padding: EdgeInsets.symmetric(
                horizontal: size.sizedBox8,
              ),
              height: size.height60px,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text('접근 권한 안내',
                      style: TextStyle(
                          color: blackWrite,
                          fontWeight: FontWeight.w700,
                          fontSize: size.sizedBox19),
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
            Container(
              color: Colors.transparent,
              padding: EdgeInsets.symmetric(
                vertical: size.sizedBox20,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  RichText(
                    text: TextSpan(
                        text: '"사진 권한 요청" 팝업창이 나타나면',
                        style: TextStyle(
                            fontSize: size.sizedBox18,
                            fontWeight: FontWeight.w400,
                            color: blackWrite
                        ),
                        children: [
                          TextSpan(
                              text: "\n\n'모두 허용'",
                              style: TextStyle(
                                  fontSize: size
                                      .sizedBox19,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.blue
                              )
                          ),
                          TextSpan(
                            text: "을 선택해주세요.",
                            style: TextStyle(
                                fontSize: size
                                    .sizedBox18,
                                fontWeight: FontWeight.w400,
                                color: blackWrite
                            ),
                          ),
                        ]
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.sizedBox20,
            ),
            Container(
              color: Colors.transparent,
              height: size.sizedBox57,
              child: BdRippleButtonBasic(
                  onTap: confirmTap,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(size
                          .dialogCircular),
                      bottomRight: Radius.circular(size
                          .dialogCircular)
                  ),
                  border: Border(
                    top: BorderSide(
                      width: size.sizedBox1_5,
                      color: greyEAEAEA,
                    ),
                    right: BorderSide(
                      width: size.sizedBox1_5,
                      color: greyEAEAEA,
                    ),
                  ),
                  child: Center(
                    child: Text('확인',
                      style: TextStyle(
                          color: Colors.lightBlue,
                          fontWeight: FontWeight.w500,
                          fontSize: size.sizedBox17
                      ),
                    ),
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}