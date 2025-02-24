import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/bd_ripple_button_basic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DialogBasicNoti extends StatelessWidget {
  final String title;
  final String content;
  final String date;
  final String result;
  final bool isBox;
  final bool isOneButton;
  final GestureTapCallback confirm;
  final GestureTapCallback refuse;
  const DialogBasicNoti({
    super.key,
    required this.title,
    required this.content,
    required this.date,
    required this.result,
    required this.isBox,
    required this.isOneButton,
    required this.confirm,
    required this.refuse,
  });

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return Dialog(
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
            SizedBox(
              height: size.sizedBox20,
            ),
            Container(
              color: Colors.transparent,
              padding: EdgeInsets.symmetric(
                horizontal:
                !isBox
                    ? size.sizedBox16
                    : size.sizedBox8,
              ),
              height: size.height60px,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(title,
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
            !isBox
                ? const SizedBox()
                : Container(
              padding: EdgeInsets.all(size.sizedBox16),
              margin: EdgeInsets.symmetric(vertical: size.sizedBox16),
              decoration: const BoxDecoration(
                color: greyF4F4F4,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '일시: $date',
                    style: TextStyle(
                        color: blackWrite,
                        fontWeight: FontWeight.w400,
                        fontSize: size.sizedBox16
                    ),
                    textAlign: TextAlign.center,
                  ),
                  isOneButton
                      ? const SizedBox()
                      :
                  Text(
                    '내용: $result',
                    style: TextStyle(
                        color: blackWrite,
                        fontWeight: FontWeight.w400,
                        fontSize: size.sizedBox16
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            Container(
              color: Colors.transparent,
              padding: EdgeInsets.symmetric(
                  vertical: size.sizedBox20,
                  horizontal:
                  !isBox
                      ? size.sizedBox8
                      : size.sizedBox34
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    content,
                    style: TextStyle(
                        color: blackWrite,
                        fontWeight: FontWeight.w400,
                        fontSize: size.sizedBox17
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            SizedBox(
              height:  size.sizedBox20,
            ),
            Container(
              color: Colors.transparent,
              height: size.sizedBox57,
              child: switch(isOneButton){
                true => BdRippleButtonBasic(
                    onTap: refuse,
                    borderRadius:  BorderRadius.only(
                        bottomLeft: Radius.circular(size.dialogCircular),
                        bottomRight: Radius.circular(size.dialogCircular)
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
                      child: Text( '닫기',
                        style: TextStyle(
                            color: Colors.lightBlue,
                            fontWeight: FontWeight.w500,
                            fontSize: size.sizedBox17
                        ),
                      ),
                    )
                ),
                false => Row(
                  children: [
                    Expanded(
                        child: BdRippleButtonBasic(
                            onTap: refuse,
                            borderRadius:  BorderRadius.only(
                                bottomLeft: Radius.circular(size.dialogCircular)
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
                              child: Text(
                                !isBox ? '미동의' : '닫기',
                                style: TextStyle(
                                    color: Colors.lightBlue,
                                    fontWeight: FontWeight.w500,
                                    fontSize: size.sizedBox17
                                ),
                              ),
                            )
                        )

                    ),
                    Expanded(
                        child: BdRippleButtonBasic(
                            onTap: confirm,
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(size.dialogCircular)
                            ),
                            border: Border(
                              top: BorderSide(
                                width: size.sizedBox1_5,
                                color: greyEAEAEA,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                !isBox ? '동의' : '변경',
                                style: TextStyle(
                                    color: Colors.lightBlue,
                                    fontWeight: FontWeight.w500,
                                    fontSize: size.sizedBox17
                                ),
                              ),
                            )
                        )
                    )
                  ],
                )
              },
            ),
          ],
        ),
      ),
    );
  }
}
