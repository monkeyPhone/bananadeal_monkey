import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/bd_ripple_icons_button.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_custom_pad.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';



class TermsDialogWidget extends StatelessWidget {
  final GestureTapCallback onTap;
  final int index;
  final String tService;
  final String tPrivacy;
  final String tLocation;
  final ScrollController sController1;
  final ScrollController sController2;
  final ScrollController sController3;
  const TermsDialogWidget({super.key,
    required this.onTap,

    required this.index,
    required this.tService,
    required this.tPrivacy,
    required this.tLocation,
    required this.sController1,
    required this.sController2,
    required this.sController3
  });

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return Dialog(
      backgroundColor: white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(size.sizedBox12))
      ),
      child: SizedBox(
        width: size.widthCommon,
        height: size.heightCommon,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: size.sizedBox12,
                  left: size.sizedBox12,
                  right: size.sizedBox3
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        switch(index){
                          0 => '전체 이용약관',
                          1 => '서비스 이용약관',
                          2 => '개인정보 취급동의',
                          3 => '위치기반 서비스 이용동의',
                          _ => ''
                        },
                        style:TextStyle(
                            fontSize: size.sizedBox20,
                            fontWeight: FontWeight.w700,
                            color: blackWrite
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: size.sizedBox8,
                  ),
                  BdRippleIconsButton(
                    size: size,
                    onTap: onTap,
                    icon: Icons.close,
                    iconColor: blackWrite,
                  )
                ],
              ),
            ),
            Expanded(
                child: index == 0
                    ? _TermDialog(
                  size: size,
                  text1: tService,
                  text2: tPrivacy,
                  text3: tLocation,
                  sController1: sController1,
                  sController2: sController2,
                  sController3: sController3,
                )
                    :
                Container(
                  padding: EdgeInsets.only(
                    top: size.sizedBox10,
                    bottom: size.sizedBox10,
                  ),
                  margin: EdgeInsets.only(
                      top: size.sizedBox5,
                      bottom: size.sizedBox8,
                      right: size.sizedBox8,
                      left: size.sizedBox8
                  ),
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(size.sizedBox5),
                      border: Border.all(
                          width: size.sizedBox1_5,
                          color: Colors.black26
                      )
                  ),
                  child: Scrollbar(
                    thumbVisibility: true,
                    child: ListView.builder(
                      itemCount: 1,
                      padding: EdgeInsets.only(
                        right: size.sizedBox14,
                        left: size.sizedBox10,
                      ),
                      physics: const ClampingScrollPhysics(),
                      itemBuilder: (context, current) =>
                          _TermDialogC(
                            size: size,
                            text: switch(index){
                              1 => tService,
                              2 => tPrivacy,
                              3 => tLocation,
                              _ => ''
                            },
                          ),
                    ),
                  ),
                )
            ),
            // Padding(
            //   padding: EdgeInsets.symmetric(
            //       horizontal: WidgetSize(context).sizedBox12
            //   ),
            //   child:
//Todo: 확인
            // NeoButton(
            //     height: WidgetSize(context).sizedBox45,
            //     text: '확인',
            //     onPressed: (){
            //       closeDialog(context);
            //     }
            // ),
            // ),
            SizedBox(
              height: size.sizedBox12,
            )
          ],
        ),
      ),
    );
  }
}


class _TermDialog extends StatelessWidget {
  final CommonSize size;
  final String text1;
  final String text2;
  final String text3;
  final ScrollController sController1;
  final ScrollController sController2;
  final ScrollController sController3;
  const _TermDialog({
    required this.size,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.sController1,
    required this.sController2,
    required this.sController3
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(
          size.sizedBox12
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _TermNormal(
            size: size,
            text: '서비스 이용약관',
          ),
          const BdCustomPad(padEnum: PadEnum.height16),
          _TextColumn(
              scrollController: sController1,
              size: size,
              text: text1
          ),
          const BdCustomPad(padEnum: PadEnum.height16),
          _TermNormal(
            size: size,
            text: '개인정보 취급동의',
          ),
          const BdCustomPad(padEnum: PadEnum.height16),
          _TextColumn(
              scrollController: sController2,
              size: size,
              text: text2
          ),
          const BdCustomPad(padEnum: PadEnum.height16),
          _TermNormal(
            size: size,
            text: '위치기반 서비스 이용동의',
          ),
          const BdCustomPad(padEnum: PadEnum.height16),
          _TextColumn(
              scrollController: sController3,
              size: size,
              text: text3
          ),

        ],
      ),
    );
  }
}

class _TermNormal extends StatelessWidget {
  final String text;
  final CommonSize size;
  const _TermNormal({
    required this.text,
    required this.size
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child:  Text(text, style:TextStyle(
          fontSize: size.sizedBox18,
          fontWeight: FontWeight.w700,
          color: blackWrite
      ),
      ),
    );
  }
}

class _TextColumn extends StatelessWidget {
  final CommonSize size;
  final String text;
  final ScrollController scrollController;
  const _TextColumn({
    required this.size,
    required this.text,
    required this.scrollController
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        padding: EdgeInsets.only(
            top: size.sizedBox8,
            bottom: size.sizedBox8,
            left: size.sizedBox8
        ),
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(size.sizedBox5),
            border: Border.all(
                width: size.sizedBox1_5,
                color: Colors.black26
            )
        ),
        child: Scrollbar(
          controller: scrollController,
          thumbVisibility: true,
          child: ListView.builder(
            itemCount: 1,
            padding: EdgeInsets.only(
                right: size.sizedBox14
            ),
            controller: scrollController,
            physics: const ClampingScrollPhysics(),
            itemBuilder: (context, index) =>
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HtmlWidget(
                      text,
                      textStyle: TextStyle(
                          fontSize: size.sizedBox16,
                          fontWeight: FontWeight.w400
                      ),
                    ),
                  ],
                ),
          ),
        ),
      ),
    );
  }
}


class _TermDialogC extends StatelessWidget {
  final CommonSize size;
  final String text;
  const _TermDialogC({
    required this.size,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return HtmlWidget(
      text,
      textStyle: TextStyle(
          fontSize: size.sizedBox16,
          fontWeight: FontWeight.w400
      ),
    );
  }
}
