import 'package:flutter/material.dart';

import '../../../../../../../../components/widget_components/ripple_button/ripple_button.dart';
import '../../../../../../../../css/size.dart';
import '../../../../../../../../css/style.dart';

class InfoCropRipple extends StatelessWidget {
  final GestureTapCallback? onTap;
  final List buttonName;
  final List icon;
  final List color;
  final int index;
  const InfoCropRipple({
    super.key,
    required this.onTap,
    required this.buttonName,
    required this.icon,
    required this.color,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return RippleDecorationButton(
        onTap: onTap,
        width: WidgetSize(context).sizedBox181,
        height: WidgetSize(context).sizedBox48,
        borderRadius: BorderRadius.circular(WidgetSize(context).sizedBox3),
        boxShadow: [
          BoxShadow(
              color: Style.ultimateGrey,
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(1,1)
          )
        ],
        padding: EdgeInsets.symmetric(vertical: WidgetSize(context).sizedBox3, horizontal: WidgetSize(context).sizedBox10),
        margin: EdgeInsets.only(bottom: WidgetSize(context).sizedBox10),
        widget:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              buttonName[index],
              style: TextStyle(
                  fontSize: WidgetSize(context).sizedBox18,
                  color: color[index],
                  fontWeight: FontWeight.normal),
            ),
            SizedBox(width: WidgetSize(context).sizedBox40,),
            Icon(icon[index], color: color[index], size: WidgetSize(context).sizedBox28,)
          ],
        )
    );
  }
}
