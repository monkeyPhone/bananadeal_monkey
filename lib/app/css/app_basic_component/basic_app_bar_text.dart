import 'package:flutter/material.dart';

import '../size.dart';
import '../style.dart';

class BasicAppBarText extends StatelessWidget {
  final String text;
  const BasicAppBarText({
    required this.text,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: TextStyle(
          color: Style.blackWrite,
          fontSize: WidgetSize(context).sizedBox24,
          fontWeight: FontWeight.w700
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class BasicAppBarText22 extends StatelessWidget {
  final String text;
  const BasicAppBarText22({
    required this.text,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: TextStyle(
          color: Colors.black,
          fontSize: WidgetSize(context).sizedBox22,
          fontWeight: FontWeight.normal,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class BasicAppBarText20 extends StatelessWidget {
  final String text;
  const BasicAppBarText20({
    required this.text,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: TextStyle(
        color: Colors.black,
        fontSize: WidgetSize(context).sizedBox22,
        fontWeight: FontWeight.normal,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class BasicAppBarText2 extends StatelessWidget {
  final String text;
  const BasicAppBarText2({
    required this.text,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: TextStyle(
        color: Colors.black,
        fontSize: WidgetSize(context).etcTitleSize,
        fontWeight: FontWeight.w600,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
