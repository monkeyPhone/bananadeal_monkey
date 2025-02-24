import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:flutter/material.dart';


class BdTopTextArea extends StatelessWidget {
  final CommonSize size;
  final String? text1;
  final String? text2;
  final String? text3;
  final bool? isZero;
  const BdTopTextArea({
    required this.size,
    this.text1,
    this.text2,
    this.text3,
    this.isZero,
    super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.widthCommon,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: size.sizedBox5,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              text1 != null ? RichText(
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                text: TextSpan(
                    text: text1,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: blackWrite,
                      fontSize: size.titleMain,
                    )),
              ) : const SizedBox(),
              text2 != null
                  ? RichText(
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                text: TextSpan(
                    text: text2!,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: blackWrite,
                      fontSize: size.titleMain,
                    )
                ),
              )
                  : SizedBox(height: size.sizedBox18,),
            ],
          ),
          SizedBox(
            height: size.sizedBox5,
          ),
          text3 != null
              ? Text(
            text3!,
            style: TextStyle(
              fontSize: size.body,
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),
          )
              : SizedBox(height: isZero != null ? 0 : size.sizedBox18,),
        ],
      ),
    );
  }
}
