import 'package:banana_deal_by_monkeycompany/app/components/carousel/src/components/size_reporting_widget.dart';
import 'package:flutter/material.dart';

class OverflowPage extends StatelessWidget {
  const OverflowPage({
    super.key,
    required this.onSizeChange,
    required this.child,
    required this.alignment,
    required this.scrollDirection,
  });

  final Alignment alignment;
  final Widget child;
  final ValueChanged<Size> onSizeChange;
  final Axis scrollDirection;

  @override
  Widget build(BuildContext context) {
    return OverflowBox(
      minHeight: scrollDirection == Axis.horizontal ? 0 : null,
      minWidth: scrollDirection == Axis.vertical ? 0 : null,
      maxHeight: scrollDirection == Axis.horizontal ? double.infinity : null,
      maxWidth: scrollDirection == Axis.vertical ? double.infinity : null,
      alignment: alignment,
      child: SizeReportingWidget(
        onSizeChange: onSizeChange,
        child: child,
      ),
    );
  }
}