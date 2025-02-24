import 'package:flutter/material.dart';

import '../../../../../../../../../../css/size.dart';

class RateListIconText extends StatelessWidget {
  final IconData icon;
  final double iconSize;
  final String text;
  final double textSize;
  final FontWeight fontWeight;
  const RateListIconText({
    super.key,
    required this.icon,
    required this.iconSize,
    required this.text,
    required this.textSize,
    required this.fontWeight
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: WidgetSize(context).sizedBox1_5),
      child: Row(
        children: [
          Icon(icon, size: iconSize),
          SizedBox(width: WidgetSize(context).sizedBox6,),
          Text(text,
            style: TextStyle(fontSize: textSize, fontWeight: fontWeight),
          )
        ],
      ),
    );
  }
}
