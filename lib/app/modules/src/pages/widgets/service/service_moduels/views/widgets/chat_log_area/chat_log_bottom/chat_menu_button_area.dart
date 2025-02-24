import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_button.dart';
import 'package:flutter/material.dart';
import '../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../css/style.dart';

class ChatMenuButtonArea extends StatelessWidget {
  final GestureTapCallback onTap;
  final IconData icon;
  final String text;
  const ChatMenuButtonArea({
    required this.onTap,
    required this.icon,
    required this.text,
    super.key});

  @override
  Widget build(BuildContext context) {
    return RippleDecorationButton(
        onTap: onTap,
        widget:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: WidgetSize(context).sizedBox37, color: Style.karajeck,),
            SizedBox(height: WidgetSize(context).sizedBox8,),
            Text(text,
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: WidgetSize(context).sizedBox14,
                  color: Style.karajeck
              ),
            )
          ],
        )
    );
  }
}
