import 'package:flutter/material.dart';

import '../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../css/style.dart';

class EventDetailNotice extends StatelessWidget {
  final String beNotice;
  const EventDetailNotice({
    required this.beNotice,
    super.key});

  @override
  Widget build(BuildContext context) {
    return beNotice!= ''
        ?
    Container(
      decoration: BoxDecoration(
          color: Style.greyEAEAEA,
          borderRadius: BorderRadius.circular(WidgetSize(context).sizedBox12)
      ),
      padding: EdgeInsets.all(WidgetSize(context).sizedBox12),
      width: WidgetSize(context).widthCommon,
      child: Text(beNotice,
        style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: WidgetSize(context).sizedBox15,
            color: Style.grey999999
        ),
      ),
    )
        :
    SizedBox();
  }
}
