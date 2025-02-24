import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_button.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../css/style.dart';

class SharedButton extends StatelessWidget {
  final GestureTapCallback onTap;
  const SharedButton({
    required this.onTap,
    super.key});

  @override
  Widget build(BuildContext context) {
    return RippleDecorationButton(
        onTap: onTap,
        width: WidgetSize(context).widthCommon,
        height: WidgetSize(context).height60px,
        borderRadius: BorderRadius.circular(WidgetSize(context).heightCommon),
        border: Border.all(
            width: WidgetSize(context).sizedBox3,
            color: Style.yellow
        ),
        widget: Center(
          child: Text('이벤트 공유하기',
            style: TextStyle(
                fontSize: WidgetSize(context).sizedBox18,
                fontWeight: FontWeight.w400,
                color: Style.brown
            ),
          ),
        )
    );
  }
}
