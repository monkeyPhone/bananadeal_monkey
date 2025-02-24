import 'package:flutter/material.dart';

import '../../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../../css/style.dart';

class EstimateMainInfoRowText extends StatelessWidget {
  final String text1;
  final String text2;
  const EstimateMainInfoRowText({
    required this.text1,
    required this.text2,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _text14Gw400(text1, context),
        SizedBox(width: WidgetSize(context).sizedBox2,),
        _text14Bw400(text2, context)
      ],
    );
  }

  Widget _text14Gw400(String text,  BuildContext context){
    return Text(text,
      style: TextStyle(
          fontSize: WidgetSize(context).sizedBox14,
          fontWeight: FontWeight.w700,
          color: Style.grey999999
      ),
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
