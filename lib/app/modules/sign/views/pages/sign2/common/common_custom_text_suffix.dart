import 'package:banana_deal_by_monkeycompany/app/css/size.dart';
import 'package:flutter/material.dart';

class CommonCustomTextSuffix extends StatelessWidget {
  final GestureTapCallback onTap;
  const CommonCustomTextSuffix({super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Icon(
          Icons.cached,
          color: Colors.blue,
          size: WidgetSize(context).sizedBox18,
        )
    );
  }
}
