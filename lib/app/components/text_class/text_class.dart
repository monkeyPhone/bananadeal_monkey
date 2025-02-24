import 'package:banana_deal_by_monkeycompany/app/css/size.dart';
import 'package:flutter/material.dart';
import '../../css/style.dart';

class CustomTextWidget extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  const CustomTextWidget({
    super.key,
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.color
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: fontSize ?? WidgetSize(context).sizedBox18,
          fontWeight: fontWeight ?? FontWeight.w400,
          color: color ?? Style.blackWrite
      ),
    );
  }
}



class Text18pxW700Black extends StatelessWidget {
  final String text;
  const Text18pxW700Black({
    required this.text,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: WidgetSize(context).sizedBox18,
          fontWeight: FontWeight.w700,
          color: Style.blackWrite
      ),
      overflow: TextOverflow.ellipsis,
    );
  }
}


class Text14pxW400Color extends StatelessWidget {
  final String text;
  final Color? color;
  final TextAlign? textAlign;
  const Text14pxW400Color({
    required this.text,
    this.color,
    this.textAlign,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: WidgetSize(context).sizedBox14,
        color: color ?? Colors.black,
        fontWeight: FontWeight.w400,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign ?? TextAlign.center,
    );
  }
}


class Text16PxBlackW400 extends StatelessWidget {
  final String text;
  const Text16PxBlackW400({
    required this.text,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: WidgetSize(context).sizedBox16,
        color: Style.blackWrite,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

class RoadSearchTextResultBold extends StatelessWidget {
  final String text;
  const RoadSearchTextResultBold({
    required this.text,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: TextStyle(
        fontSize: WidgetSize(context).sizedBox18,
        color: Style.blackWrite,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

class RoadSearchTextBrown extends StatelessWidget {
  final String text;
  const RoadSearchTextBrown({
    required this.text,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: WidgetSize(context).sizedBox14,
        color: Style.brown,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}


class RoadTextGrey14Px extends StatelessWidget {
  final String text;
  const RoadTextGrey14Px({
    required this.text,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: WidgetSize(context).sizedBox14,
        color: Style.brown,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}



class SearchPhoneAlertText extends StatelessWidget {
  final String text;
  const SearchPhoneAlertText({
    required this.text,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: WidgetSize(context).sizedBox17,
          color: Style.blackWrite
      ),
    );
  }
}




