import 'package:flutter/material.dart';

import '../../../../../../../css/size.dart';
import '../../../../../../../css/style.dart';

class RoadTextBold extends StatelessWidget {
  final String text;
  const RoadTextBold({
    required this.text,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: WidgetSize(context).sizedBox18,
        color: Style.blackWrite,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

class RoadTextBrown extends StatelessWidget {
  final String text;
  const RoadTextBrown({
    required this.text,
    Key? key}) : super(key: key);

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

class RoadTextBrownCenter extends StatelessWidget {
  final String text;
  const RoadTextBrownCenter({
    required this.text,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: WidgetSize(context).sizedBox14,
        color: Style.brown,
        fontWeight: FontWeight.w400,
      ),
      textAlign: TextAlign.center,
    );
  }
}

class RoadTextBrownBigBold extends StatelessWidget {
  final String text;
  const RoadTextBrownBigBold({
    required this.text,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: WidgetSize(context).sizedBox20,
        color: Style.brown,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}


class RoadTextGrey14 extends StatelessWidget {
  final String text;
  const RoadTextGrey14({
    required this.text,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:  TextStyle(
        fontSize: WidgetSize(context).sizedBox14,
        color: Style.greyWrite,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}




