import 'package:flutter/material.dart';

import '../../../../../../../../../../components/image_provider/asset_image_box.dart';
import '../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../css/style.dart';
import '../../../../../../../../../../routes/const_element.dart';


class CounterCenter extends StatelessWidget {
  final String text;
  const CounterCenter({
    required this.text,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CounterText(text: text),
    );
  }
}


class CounterText extends StatelessWidget {
  final String text;
  const CounterText({
    required this.text,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: TextStyle(
          fontSize: WidgetSize(context).sizedBox18,
          fontWeight: FontWeight.w700,
          color: Style.grey999999
      ),
    );
  }
}

class Counter1 extends StatelessWidget {
  final String text;
  const Counter1({
    required this.text,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AssetImageBox(imageHeight: WidgetSize(context).sizedBox96, imageWidth: WidgetSize(context).sizedBox126, imageUrl: AppElement.defaultList),
        SizedBox(
          height: WidgetSize(context).width01,
        ),
        CounterText(text: text),
        SizedBox(
          height: WidgetSize(context).width01,
        ),

      ],
    );
  }
}
