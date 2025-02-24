import 'package:banana_deal_by_monkeycompany/app/managers/permission/views/components/permission_button/helper/permission_column_title.dart';
import 'package:flutter/material.dart';
import '../../../../../../css/size.dart';
import '../../permission_text_widget.dart';


class PermissionColumn extends StatelessWidget {
  final String title;
  final String sub;
  final String explain;
  final String? explainMini;
  final IconData iconMain;
  final bool stateIcon;
  final Color mainIconColor;
  const PermissionColumn({
    required this.title,
    required this.sub,
    required this.explain,
    required this.explainMini,
    required this.iconMain,
    required this.stateIcon,
    required this.mainIconColor,
    super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PermissionColumnTitle(
          title: title,
          sub: sub,
          iconMain: iconMain,
          mainIconColor: mainIconColor,
        ),
        PermissionPad(size: WidgetSize(context).sizedBox5),
        Padding(
          padding: EdgeInsets.only(left: WidgetSize(context).sizedBox5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PermissionTextThinWidget(text: explain),
              explainMini != null ?
              Column(
                children: [
                  SizedBox(
                    height: WidgetSize(context).sizedBox8,
                  ),
                  PermissionTextSmallWidget(text: explainMini!),
                ],
              ) : SizedBox(),
            ],
          ),
        ),
        SizedBox(height: WidgetSize(context).permissionGap,)
      ],
    );
  }
}
