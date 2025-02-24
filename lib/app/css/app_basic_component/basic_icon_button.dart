import 'package:flutter/material.dart';

import '../size.dart';
import '../style.dart';

class BasicIconButton extends StatelessWidget {
  final GestureTapCallback onTap;
  final IconData icon;
  final Color? color;
  const BasicIconButton({
    required this.onTap,
    required this.icon,
    this.color,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Style.white,
          width: WidgetSize(context).sizedBox50,
          height: WidgetSize(context).sizedBox50,
          child: Center(child: Icon(icon, size: WidgetSize(context).sizedBox28, color: color ?? Style.blackWrite,)
          )),
    );
  }
}
