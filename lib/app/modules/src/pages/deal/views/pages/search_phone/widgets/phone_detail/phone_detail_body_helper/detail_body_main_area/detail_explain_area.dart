import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/views/pages/search_phone/widgets/phone_detail/phone_detail_body_helper/detail_body_main_area/explain_detail_html.dart';
import 'package:flutter/material.dart';
import '../../../../../../../../../../../css/size.dart';

class DetailExplainArea extends StatelessWidget {
  final String design;
  final String special;
  final String camera;
  const DetailExplainArea({
    required this.design,
    required this.special,
    required this.camera,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: WidgetSize(context).paddingBodyWhole,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ExplainDetailHtml(text1: 'Design', text2: design),
                ExplainDetailHtml(text1: 'Special', text2: special),
                ExplainDetailHtml(text1: 'Camera', text2: camera),
              ],
            ),
    );
  }
}
