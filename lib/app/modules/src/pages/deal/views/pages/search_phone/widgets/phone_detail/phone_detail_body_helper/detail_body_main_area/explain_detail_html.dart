
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

import '../../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../../css/style.dart';

class ExplainDetailHtml extends StatelessWidget {
  final String text1;
  final String text2;
  const ExplainDetailHtml({
    required this.text1,
    required this.text2,
    super.key});

  @override
  Widget build(BuildContext context) {
    return
      text2 == '<ul style="padding-left:0; margin-left:0;"><li style="margin: 10px 0px;"></li>'
          ? SizedBox()
          : Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text1,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Style.specTitle,
            fontSize: WidgetSize(context).sizedBox24
          ),
        ),
        SizedBox(height: WidgetSize(context).sizedBox5,),
        Padding(
          padding: WidgetSize(context).paddingBodyWhole,
          child: HtmlWidget(
            text2,
            textStyle: TextStyle(
              fontSize: WidgetSize(context).sizedBox17
            ),
          ),
        ),
        SizedBox(height: WidgetSize(context).sizedBox10,),
      ],
    );
  }
}
