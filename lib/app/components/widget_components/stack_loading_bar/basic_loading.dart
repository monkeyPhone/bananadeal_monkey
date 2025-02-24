import 'package:banana_deal_by_monkeycompany/app/css/size.dart';
import 'package:banana_deal_by_monkeycompany/app/css/style.dart';
import 'package:flutter/material.dart';

class BasicLoading extends StatelessWidget {
  const BasicLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: CircularProgressIndicator(
        color: Style.progressBar,
        strokeWidth: WidgetSize(context).sizedBox5,
      ),
      height: WidgetSize(context).height60px,
      width: WidgetSize(context).height60px,
    );
  }
}
