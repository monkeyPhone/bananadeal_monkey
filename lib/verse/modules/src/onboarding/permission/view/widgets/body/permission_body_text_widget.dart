import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:flutter/material.dart';

class PermissionText extends StatelessWidget {
  final CommonSize size;
  final String text;
  final TextStyle? style;
  const PermissionText({
    required this.size,
    required this.text,
    this.style,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          bottom: size.sizedBox3
      ),
      child: Text(text,
        style: style ?? TextStyle(
            color: blackWrite,
            fontSize: size.titleLittle,
            fontWeight: FontWeight.w600
        ),
      ),
    );
  }
}

class PermissionTextNormalWidget extends StatelessWidget {
  final CommonSize size;
  final String text;
  const PermissionTextNormalWidget({
    required this.size,
    required this.text,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          bottom: size.sizedBox3
      ),
      child: Text(text,
        style: TextStyle(
            color: blackWrite,
            fontSize: size.sizedBox20,
            fontWeight: FontWeight.w600
        ),
      ),
    );
  }
}

class PermissionTextThinWidget extends StatelessWidget {
  final CommonSize size;
  final String text;
  const PermissionTextThinWidget({
    required this.size,
    required this.text,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          bottom: size.sizedBox3
      ),
      child: Text(text,
        style: TextStyle(
            fontSize: size.callout,
            fontWeight: FontWeight.w400
        ),
      ),
    );
  }
}

class PermissionTextBoldWidget2 extends StatelessWidget {
  final CommonSize size;
  final String text;
  const PermissionTextBoldWidget2({
    required this.text,
    required this.size,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: TextStyle(
          fontSize: size.sizedBox18,
          color: blackWrite,
          fontWeight: FontWeight.w500
      ),
    );
  }
}

class PermissionTextBoldWidget3 extends StatelessWidget {
  final CommonSize size;
  final String text;
  const PermissionTextBoldWidget3({
    required this.size,
    required this.text,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: TextStyle(
          fontSize: size.sizedBox17,
          color: specPink,
          fontWeight: FontWeight.w500
      ),
    );
  }
}

class PermissionTextBoldWidget extends StatelessWidget {
  final CommonSize size;
  final String text;
  const PermissionTextBoldWidget({
    required this.size,
    required this.text,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: TextStyle(
          fontSize: size.body,
          color: blackWrite,
          fontWeight: FontWeight.w700
      ),
    );
  }
}

class PermissionTextSubWidget extends StatelessWidget {
  final CommonSize size;
  final String text;
  const PermissionTextSubWidget({
    required this.size,
    required this.text,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: TextStyle(
          fontSize: size.special,
          color: ultimateGrey,
          fontWeight: FontWeight.w700
      ),
    );
  }
}


class PermissionTextSmallWidget extends StatelessWidget {
  final CommonSize size;
  final String text;
  const PermissionTextSmallWidget({
    required this.size,
    required this.text,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          bottom: size.sizedBox3
      ),
      child: Text(text,
        style: TextStyle(
            fontSize: size.special,
            fontWeight: FontWeight.w400,
            color: simplePink
        ),
      ),
    );
  }
}

class PermissionTextColorWidget extends StatelessWidget {
  final CommonSize size;
  final String text;
  const PermissionTextColorWidget({
    required this.text,
    required this.size,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          bottom: size.sizedBox3
      ),
      child: Text(text,
        style: TextStyle(
            fontSize: size.special,
            fontWeight: FontWeight.w700,
            color: crowdFlower
        ),
      ),
    );
  }
}