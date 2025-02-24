import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BdDisabledButton extends StatelessWidget {

  final String text;
  final double? width;
  final double? height;
  final double? textSize;
  final double? borderRadius;
  final Color? textColor;
  final FontWeight? fontWeight;
  const BdDisabledButton({
    super.key,
    required this.text,
    this.width,
    this.height,
    this.textSize,
    this.borderRadius,
    this.textColor,
    this.fontWeight,
   });

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return GestureDetector(
      onTap: (){},
      child: Container(
        decoration: BoxDecoration(
            color: greyD9D9D9,
            borderRadius: BorderRadius.circular(borderRadius ?? size.widthCommon)
        ),
        width: width ?? size.widthCommon,
        height: height ?? size.sizedButtonNew,
        child: Center(
            child: Text(
              text,
              style: TextStyle(
                  fontSize: textSize ?? size.titleLittle,
                  color: textColor ?? grey666666,
                  fontWeight: fontWeight ?? FontWeight.w400
              ),
            )

        ),
      ),
    );
  }
}
