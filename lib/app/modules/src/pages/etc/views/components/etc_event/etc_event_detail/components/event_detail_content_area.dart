import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

import '../../../../../../../../../css/size.dart';

class EtcDetailContentArea extends StatelessWidget {
  final String beContent;
  const EtcDetailContentArea({
    required this.beContent,
    super.key});

  @override
  Widget build(BuildContext context) {
    return  beContent != ''
        ?
    Padding(
      padding: EdgeInsets.all(WidgetSize(context).sizedBox16),
      child:
      SizedBox(
        width: WidgetSize(context).widthCommon,
        child: HtmlWidget(
          beContent,
          textStyle: TextStyle(
              fontSize: WidgetSize(context).sizedBox17,
              fontWeight: FontWeight.w400
          ),
        ),
      ),
    ) : SizedBox();
  }
}
