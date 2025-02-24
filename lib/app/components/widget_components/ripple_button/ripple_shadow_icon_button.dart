import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_button.dart';
import 'package:banana_deal_by_monkeycompany/app/css/size.dart';
import 'package:banana_deal_by_monkeycompany/app/css/style.dart';
import 'package:flutter/material.dart';

class RippleShadowIconButton extends StatelessWidget {
  final GestureTapCallback onTap;
  final Widget child;
  const RippleShadowIconButton({super.key,
    required this.onTap,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return RippleDecorationButton(
        onTap: onTap,
        borderRadius: BorderRadius.circular(999),
        boxShadow: const [
          BoxShadow(
            color: Style.ultimateGrey,
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(1, 1), // changes position of shadow
          ),
        ],
        height: WidgetSize(context).sizedBox41,
        width: WidgetSize(context).sizedBox41,
        padding: EdgeInsets.all(WidgetSize(context).sizedBox4),
        widget: FittedBox(
          child: Padding(
            padding: EdgeInsets.all(WidgetSize(context).sizedBox2),
            child: child,
          ),
        )
    );
  }
}
