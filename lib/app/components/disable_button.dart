import 'package:flutter/material.dart';
import '../css/size.dart';
import '../css/style.dart';

class DisableButton extends StatelessWidget {
  final String text;
  final double? width;
  final double? height;
  final double? textSize;
  final Color? textColor;
  final FontWeight? fontWeight;
  const DisableButton({
    required this.text,
    this.width,
    this.height,
    this.textSize,
    this.textColor,
    this.fontWeight,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Container(
        decoration: BoxDecoration(
            color: Style.greyCCCCCC,
            borderRadius: BorderRadius.circular(WidgetSize(context).widthCommon)
        ),
        width: width ?? WidgetSize(context).widthCommon,
        height: height ?? WidgetSize(context).height60px,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontSize: textSize ?? WidgetSize(context).sizedBox18,
                color: textColor ?? Style.grey999999,
                fontWeight: fontWeight ?? FontWeight.w400
            ),
          )

        ),
      ),
    );
  }
}
