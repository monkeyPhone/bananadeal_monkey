import 'package:flutter/material.dart';
import '../../../../../../../../../../../../../css/size.dart';


class StoreDetailText extends StatelessWidget {
  final String text;
  const StoreDetailText({
    required this.text,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Text(text ,
        style: TextStyle(fontWeight: FontWeight.w400, fontSize: WidgetSize(context).sizedBox14)
    , overflow: TextOverflow.ellipsis,);
  }
}
