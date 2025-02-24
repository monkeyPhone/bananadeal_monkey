import 'package:flutter/material.dart';

import '../../../../css/size.dart';
import '../../../../css/style.dart';


class PermissionTextNormalWidget extends StatelessWidget {
  final String text;
  const PermissionTextNormalWidget({
    required this.text,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: WidgetSize(context).sizedBox3
      ),
      child: Text(text,
        style: TextStyle(
            color: Style.blackWrite,
            fontSize: WidgetSize(context).sizedBox20,
            fontWeight: FontWeight.w600
        ),
      ),
    );
  }
}

class PermissionTextThinWidget extends StatelessWidget {
  final String text;
  const PermissionTextThinWidget({
    required this.text,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          bottom: WidgetSize(context).sizedBox3
      ),
      child: Text(text,
        style: TextStyle(
            fontSize: WidgetSize(context).sizedBox17,
            fontWeight: FontWeight.w400
        ),
      ),
    );
  }
}

class PermissionTextBoldWidget2 extends StatelessWidget {
  final String text;
  const PermissionTextBoldWidget2({
    required this.text,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: TextStyle(
          fontSize: WidgetSize(context).sizedBox18,
          color: Style.blackWrite,
          fontWeight: FontWeight.w500
      ),
    );
  }
}

class PermissionTextBoldWidget3 extends StatelessWidget {
  final String text;
  const PermissionTextBoldWidget3({
    required this.text,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: TextStyle(
          fontSize: WidgetSize(context).sizedBox17,
          color: Style.specPink,
          fontWeight: FontWeight.w500
      ),
    );
  }
}

class PermissionTextBoldWidget extends StatelessWidget {
  final String text;
  const PermissionTextBoldWidget({
    required this.text,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: TextStyle(
          fontSize: WidgetSize(context).sizedBox18,
          color: Style.blackWrite,
          fontWeight: FontWeight.w700
      ),
    );
  }
}

class PermissionTextSubWidget extends StatelessWidget {
  final String text;
  const PermissionTextSubWidget({
    required this.text,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: TextStyle(
          fontSize: WidgetSize(context).sizedBox14,
          color: Style.ultimateGrey,
          fontWeight: FontWeight.w700
      ),
    );
  }
}


class PermissionTextSmallWidget extends StatelessWidget {
  final String text;
  const PermissionTextSmallWidget({
    required this.text,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          bottom: WidgetSize(context).sizedBox3
      ),
      child: Text(text,
        style: TextStyle(
            fontSize: WidgetSize(context).sizedBox14,
            fontWeight: FontWeight.w400,
            color: Style.simplePink
        ),
      ),
    );
  }
}

class PermissionTextColorWidget extends StatelessWidget {
  final String text;
  const PermissionTextColorWidget({
    required this.text,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          bottom: WidgetSize(context).sizedBox3
      ),
      child: Text(text,
        style: TextStyle(
            fontSize: WidgetSize(context).sizedBox17,
            fontWeight: FontWeight.w700,
            color: Style.crowdFlower
        ),
      ),
    );
  }
}


class PermissionPad extends StatelessWidget {
  final double size;
  const PermissionPad({
    required this.size,
    super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
    );
  }
}



