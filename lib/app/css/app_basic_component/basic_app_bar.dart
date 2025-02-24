import 'package:flutter/material.dart';
import '../size.dart';
import 'basic_back_button.dart';

class BasicAppbar extends StatelessWidget {
  final GestureTapCallback? leading;
  final Widget? leadingWidget;
  final Widget? actions;
  final Widget title;
  const BasicAppbar({
    this.leading,
    this.actions,
    this.leadingWidget,
    required this.title,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: WidgetSize(context).height60px,
      width: WidgetSize(context).widthCommon,
      child: Padding(
        padding: EdgeInsets.only(left: WidgetSize(context).sizedBox8, right: WidgetSize(context).sizedBox5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BasicBackButton(
              onTap: leading,
              leadingWidget: leadingWidget,
            ),
            Expanded(child: Padding(
              padding: EdgeInsets.symmetric(horizontal: WidgetSize(context).sizedBox5),
              child: title,
            )),
            actions ?? SizedBox(width: 1, height: 1,),
          ],
        ),
      ),
    );
  }
}

class BasicAppbar2 extends StatelessWidget {
  final GestureTapCallback? leading;
  final Widget? actions;
  final bool lotation;
  const BasicAppbar2({
    this.leading,
    required this.lotation,
    this.actions,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: WidgetSize(context).height60px,
      width: WidgetSize(context).widthCommon,
      child: Padding(
        padding: EdgeInsets.only(left: WidgetSize(context).sizedBox16, right: WidgetSize(context).sizedBox7_5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: !lotation ? MainAxisAlignment.spaceBetween : MainAxisAlignment.start,
          children: [
            BasicBackButton(
                onTap: leading
            ),
            actions ?? SizedBox()
          ],
        ),
      ),
    );
  }
}


