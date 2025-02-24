import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../size.dart';
import '../style.dart';

class BasicBackButton extends StatelessWidget {
  final GestureTapCallback? onTap;
  final Widget? leadingWidget;
  const BasicBackButton({
    this.onTap,
    this.leadingWidget,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RippleDecorationButton(
        onTap: onTap ?? (){ Get.back(); },
        height: WidgetSize(context).sizedBox48,
        width: WidgetSize(context).sizedBox48,
        padding: EdgeInsets.all(WidgetSize(context).sizedBox10_5),
        widget: FittedBox(
          child: leadingWidget ?? const Icon(Icons.arrow_back_ios, color: Style.blackWrite,),
        )
    );
  }
}


class BasicCloseButton extends StatelessWidget {
  final GestureTapCallback? onTap;
  const BasicCloseButton({
    this.onTap,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RippleDecorationButton(
        onTap: onTap ?? (){ Get.back(); },
        borderRadius: BorderRadius.circular(999),
        height: WidgetSize(context).sizedBox48,
        width: WidgetSize(context).sizedBox48,
        widget: FittedBox(
          child: Padding(
            padding: EdgeInsets.all(WidgetSize(context).sizedBox6_5),
            child: Center(child: const Icon(Icons.close, color: Style.blackWrite,)),
          ),
        )
    );
  }
}

