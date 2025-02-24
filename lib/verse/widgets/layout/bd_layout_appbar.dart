import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:flutter/material.dart';

class BdLayoutAppbar extends StatelessWidget {
  final CommonSize size;
  final Widget child;
  final int? magic;
  const BdLayoutAppbar({super.key,
    required this.size,
    required this.child,
    this.magic
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.widthCommon,
      height: magic == null ?  size.sizedAppbar : size.sizedCategory,
      child: child,
    );
  }
}
