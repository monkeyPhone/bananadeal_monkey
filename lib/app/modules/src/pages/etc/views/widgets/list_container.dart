import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_button.dart';
import 'package:flutter/material.dart';

import '../../../../../../css/size.dart';
import '../../../../../../css/style.dart';

class ListContainer extends StatelessWidget {
  final int index;
  final String text;
  final GestureTapCallback? onTap0;
  final GestureTapCallback? onTap1;
  final GestureTapCallback? onTap2;
  final GestureTapCallback? onTap3;
  final GestureTapCallback? onTap4;
  final GestureTapCallback? onTap5;
  final GestureTapCallback? onTap6;
  final GestureTapCallback? onTap7;
  final GestureTapCallback? onTap8;
  final GestureTapCallback? onTap9;
  final Widget? switchButton;
  const ListContainer({
    required this.index,
    required this.text,
    this.onTap0,
    this.onTap1,
    this.onTap2,
    this.onTap3,
    this.onTap4,
    this.onTap5,
    this.onTap6,
    this.onTap7,
    this.onTap8,
    this.onTap9,
    this.switchButton,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RippleDecorationButton(
        onTap: switch(index){
          0 => onTap0,
          1 => onTap1,
          2 => onTap2,
          3 => onTap3,
          4 => onTap4,
          5 => onTap5,
          6 => onTap6,
          7 => onTap7,
          8 => onTap8,
          9 => onTap9,
          10 => null,
         _ => (){}
        },
        border: Border(
            bottom: BorderSide(
                width:WidgetSize(context).sizedBox1,
                color: Style.greyDDDDDD)
        ),
        width: WidgetSize(context).widthCommon,
        height: WidgetSize(context).sizedBox62,
        padding: EdgeInsets.symmetric(
            horizontal: WidgetSize(context).sizedBox14
        ),
        widget: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _listText(text, context),
            index <= 9
                ?   Icon(
              Icons.arrow_forward_ios,
              size: WidgetSize(context).etcPad,
              color: Style.grey999999,
            )
                :   switchButton != null
                ? switchButton!
                : SizedBox()
          ],
        )
    );
  }

  Widget _listText(String text, BuildContext context){
    return Text(
      text,
      style: TextStyle(
          fontSize: WidgetSize(context).sizedBox18,
          fontWeight: FontWeight.w700
      ),
    );
  }

}


class ListContainerSetting extends StatelessWidget {
  final String text;
  final String text2;
  final Widget? switchButton;
  final bool? topBorder;
  final bool? bottomBorder;
  const ListContainerSetting({
    required this.text,
    required this.text2,
    this.switchButton,
    this.topBorder,
    this.bottomBorder,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border(
              top: BorderSide(
                  width: topBorder == !true ? 0 : WidgetSize(context).sizedBox1,
                  color: Style.greyDDDDDD),
              bottom: BorderSide(
                  width: bottomBorder == !true ? 0 : WidgetSize(context).sizedBox1,
                  color: Style.greyDDDDDD)
          ),
        ),
        width: WidgetSize(context).widthCommon,
        height: WidgetSize(context).sizedBox80,
        padding: EdgeInsets.symmetric(
            horizontal: WidgetSize(context).sizedBox14
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _listText(text, context),
            Flexible(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: WidgetSize(context).sizedBox20),
                child: _listText2(text2, context),
              ),
            ),
            switchButton!
          ],
        )
    );
  }

  Widget _listText(String text, BuildContext context){
    return Text(
      text,
      style: TextStyle(
          fontSize: WidgetSize(context).sizedBox18,
          fontWeight: FontWeight.w700
      ),
    );
  }

  Widget _listText2(String text, BuildContext context){
    return text == '()' ? SizedBox() : FittedBox(
      fit: BoxFit.scaleDown,
      child: Text(
        text,
        style: TextStyle(
            color: Style.greyWrite,
            fontSize: WidgetSize(context).sizedBox15,
            fontWeight: FontWeight.w400
        ),
      ),
    );
  }

}


class ListContainerSettingSub extends StatelessWidget {
  final String text;
  final Widget switchButton;
  final bool isColor;
  const ListContainerSettingSub({
    required this.text,
    required this.switchButton,
    required this.isColor,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: isColor ? Style.white : Colors.grey.shade100,
        ),
        width: WidgetSize(context).widthCommon,
        height: WidgetSize(context).sizedBox65,
        padding: EdgeInsets.only(
            left: WidgetSize(context).sizedBox28,
            right: WidgetSize(context).sizedBox14
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _listText(text, context),
            switchButton!
          ],
        )
    );
  }

  Widget _listText(String text, BuildContext context){
    return Text(
      text,
      style: TextStyle(
          fontSize: WidgetSize(context).sizedBox16,
          fontWeight: FontWeight.w700
      ),
    );
  }


}


