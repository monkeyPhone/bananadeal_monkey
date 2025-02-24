import 'package:flutter/material.dart';

import '../../../../../../../css/size.dart';
import '../../../../../../../css/style.dart';
import '../../../../../../../routes/const_element.dart';

class EndDealManageMentRippleButton extends StatelessWidget {
  final GestureTapCallback onTap;
  final Widget widget;
  const EndDealManageMentRippleButton({
    super.key,
    required this.onTap,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return  Material(
      color: Style.white,
      child: InkWell(
        highlightColor: Colors.grey.shade100,
        splashColor: Colors.grey.shade200,
        onTap: onTap,
        child: widget
      ),
    );
  }
}


class SuccessRipple extends StatelessWidget {
  const SuccessRipple({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: WidgetSize(context).sizedBox48,
      width: WidgetSize(context).sizedBox48,
      child: Center(
        child: Container(
          padding: EdgeInsets.all(WidgetSize(context).sizedBox2),
          decoration: BoxDecoration(
            color: Style.yellow,
            border: Border.all(width: WidgetSize(context).sizedBox1, color: Style.yellow),
          ),
          child: SizedBox(
              height: WidgetSize(context).sizedBox22,
              width: WidgetSize(context).sizedBox22,
              child: Image.asset(AppElement.checkImage,
                color: Style.white,)
          ),
        ),
      ),
    );
  }
}


class CancelRipple extends StatelessWidget {
  const CancelRipple({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: WidgetSize(context).sizedBox48,
      width: WidgetSize(context).sizedBox48,
      child: Center(
        child: Container(
          padding: EdgeInsets.all(WidgetSize(context).sizedBox2),
          decoration: BoxDecoration(
            color: Style.white,
            border: Border.all(width: WidgetSize(context).sizedBox1, color: Style.greyAAAAAA),
          ),
          child: SizedBox(
            height: WidgetSize(context).sizedBox22,
            width: WidgetSize(context).sizedBox22,
          ),
        ),
      ),
    );
  }
}

