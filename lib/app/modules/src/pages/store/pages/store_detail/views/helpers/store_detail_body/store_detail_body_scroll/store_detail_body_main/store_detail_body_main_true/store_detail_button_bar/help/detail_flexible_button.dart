import 'package:banana_deal_by_monkeycompany/app/app_outs/function/app_outs_function.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../../../../../css/style.dart';

class DetailFlexibleButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool border;
  final GestureTapCallback onTap;
  const DetailFlexibleButton({
    required this.icon,
    required this.text,
    required this.border,
    required this.onTap,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
        fit: FlexFit.tight,
        child: Container(
          decoration: BoxDecoration(
              border: !border ? null : Border(right: BorderSide(width: WidgetSize(context).sizedBox1, color: Style.greyEAEAEA))
          ),
          child: InkWell(
            onTap: AppOutsFunction().debounce(callback: onTap),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(icon, size: WidgetSize(context).sizedBox24,),
                Text(text, style: TextStyle(fontSize: WidgetSize(context).sizedBox15),)
              ],
            ),
          ),
        )
    );
  }
}
