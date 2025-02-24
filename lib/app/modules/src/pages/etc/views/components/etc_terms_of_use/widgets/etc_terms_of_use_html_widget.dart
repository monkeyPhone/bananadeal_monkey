import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

import '../../../../../../../../css/size.dart';

class EtcTermsOfUseHtmlWidget extends StatelessWidget {
  final String text;
  const EtcTermsOfUseHtmlWidget({
    required this.text,
    super.key});

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
