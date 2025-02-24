import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:flutter/material.dart';

class ComponentReviewLayout extends StatelessWidget {
  final CommonSize size;
  final Widget child;
  const ComponentReviewLayout({super.key,
    required this.size,
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          bottom: size.sized32grid
      ),
      padding: EdgeInsets.all(size.sized16grid),
      width: size.widthCommon,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(size.sized12grid),
      ),
      child: child,
    );
  }
}
