import 'package:flutter/material.dart';

import '../../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../../css/style.dart';

class EstimateMainRowIcon extends StatelessWidget {
  final String text1;
  const EstimateMainRowIcon({
    required this.text1,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.star, size: WidgetSize(context).sizedBox16, color: Style.yellow,),
        SizedBox(width: WidgetSize(context).sizedBox1,),
        _text14Bw400(text1, context)
      ],
    );
  }

  Widget _text14Bw400(String text, BuildContext context){
    return Text(text,
      style: TextStyle(
          fontSize: WidgetSize(context).sizedBox14,
          fontWeight: FontWeight.w400,
          color: Style.blackWrite
      ),
    );
  }

}
