import 'package:banana_deal_by_monkeycompany/app/css/size.dart';
import 'package:flutter/material.dart';

class LayoutRatio extends StatelessWidget {
  final bool? isHalf;
  final bool? isConstraints;
  final Widget child;
  const LayoutRatio({super.key,
    this.isHalf,
    this.isConstraints,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: isConstraints == null ? null : BoxConstraints(
        minHeight:  WidgetSize(context).ratio58
      ),
      width: WidgetSize(context).widthCommon,
      height: isConstraints != null ? null : isHalf == true ? WidgetSize(context).ratio29 : WidgetSize(context).ratio58,
      child: child,
    );
  }
}
