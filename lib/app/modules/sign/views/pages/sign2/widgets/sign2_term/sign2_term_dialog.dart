import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

import '../../../../../../../css/size.dart';
import '../../../../../../../css/style.dart';

class Sign2TermDialog extends StatelessWidget {
  final String text1;
  final String text2;
  final String text3;
  final ScrollController sController1;
  final ScrollController sController2;
  final ScrollController sController3;
  const Sign2TermDialog({
    super.key,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.sController1,
    required this.sController2,
    required this.sController3,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: WidgetSize(context).sizedBox12,
          bottom: WidgetSize(context).sizedBox16,
          right: WidgetSize(context).sizedBox16,
          left: WidgetSize(context).sizedBox16
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _textNorma(
              context: context,
              text1: '서비스 이용약관',
          ),
          SizedBox(
            height: WidgetSize(context).sizedBox16,
          ),
          _textColumn(
              scrollController: sController1,
              context: context,
              text2: text1
          ),
          SizedBox(
            height: WidgetSize(context).sizedBox16,
          ),
          _textNorma(
            context: context,
            text1: '개인정보 취급동의',
          ),
          SizedBox(
            height: WidgetSize(context).sizedBox16,
          ),
          _textColumn(
              scrollController: sController2,
              context: context,
              text2: text2
          ),
          SizedBox(
            height: WidgetSize(context).sizedBox16,
          ),
          _textNorma(
            context: context,
            text1: '위치기반 서비스 이용동의',
          ),
          SizedBox(
            height: WidgetSize(context).sizedBox16,
          ),
          _textColumn(
              scrollController: sController3,
              context: context,
              text2: text3
          ),

        ],
      ),
    );
  }

  Widget _textNorma({
    required BuildContext context,
    required text1,
  }){
    return FittedBox(
      fit: BoxFit.scaleDown,
      child:  Text(text1, style:TextStyle(
          fontSize: WidgetSize(context).sizedBox18,
          fontWeight: FontWeight.w700,
          color: Style.blackWrite
      ),
      ),
    );
  }

  Widget _textColumn({
    required BuildContext context,
    required String text2,
    required ScrollController scrollController,
  }){
    return Flexible(
      child: Container(
        padding: EdgeInsets.only(
          top: WidgetSize(context).sizedBox5,
          bottom: WidgetSize(context).sizedBox5,
          left: WidgetSize(context).sizedBox5
        ),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(WidgetSize(context).sizedBox5),
          border: Border.all(
            width: WidgetSize(context).sizedBox1_5,
            color: Style.greyDDDDDD
          )
        ),
        child: Scrollbar(
          controller: scrollController,
          thumbVisibility: true,
          child: ListView(
            padding: EdgeInsets.only(
              right: WidgetSize(context).sizedBox12
            ),
            controller: scrollController,
            physics: const ClampingScrollPhysics(),
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HtmlWidget(
                    text2,
                    textStyle: TextStyle(
                        fontSize: WidgetSize(context).sizedBox16,
                        fontWeight: FontWeight.w400
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

}

class Sign2TermDialogC extends StatelessWidget {
  final String text;
  const Sign2TermDialogC({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return HtmlWidget(
      text,
      textStyle: TextStyle(
          fontSize: WidgetSize(context).sizedBox16,
          fontWeight: FontWeight.w400
      ),
    );
  }
}
