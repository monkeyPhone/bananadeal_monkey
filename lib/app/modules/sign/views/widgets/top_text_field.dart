import 'package:flutter/material.dart';
import '../../../../css/size.dart';
import '../../../../css/style.dart';


class TopTextField extends StatelessWidget {
  final String text1;
  final String? text2;
  final String? text3;
  TopTextField({
    Key? key,
    required this.text1,
    this.text2,
    this.text3,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: WidgetSize(context).widthCommon,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: WidgetSize(context).sizedBox5,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                text: TextSpan(
                    text: text1,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Style.blackWrite,
                      fontSize: WidgetSize(context).sizedBox24,
                    )),
              ),
              text2 != null
                  ? RichText(
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      text: TextSpan(
                      text: text2!,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Style.blackWrite,
                            fontSize: WidgetSize(context).sizedBox24,
                          )
                      ),
              )
                  : SizedBox(height: WidgetSize(context).sizedBox18,),
            ],
          ),
          SizedBox(
            height: WidgetSize(context).sizedBox10,
          ),
          text3 != null
              ? Text(
                  text3!,
                  style: TextStyle(
                    fontSize: WidgetSize(context).sizedBox17,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                 )
              : SizedBox(height: WidgetSize(context).sizedBox18,),
        ],
      ),
    );
  }
}
