import 'package:flutter/material.dart';
import '../../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../../css/style.dart';

class ExPlainRowText extends StatelessWidget {
  final String text1;
  final String text2;
  const ExPlainRowText({
    required this.text1,
    required this.text2,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: WidgetSize(context).sizedBox15),
      child: Row(
        children: [
          Flexible(
            flex: 3,
            fit: FlexFit.tight,
            child: Text(text1,
              style: TextStyle(
                  color: Style.blackWrite,
                  fontWeight: FontWeight.w700,
                  fontSize: WidgetSize(context).sizedBox17
              ),
            ),
          ),
          Flexible(
            flex: 9,
            fit: FlexFit.tight,
            child: Container(
                padding:EdgeInsets.only(left: WidgetSize(context).sizedBox15),
                decoration:BoxDecoration(
                    border: Border(left: BorderSide(color: Style.greyDDDDDD, width: WidgetSize(context).sizedBox1))
                ),
                child:
                RichText(
                  overflow:
                  TextOverflow.ellipsis,
                  maxLines: 3,
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text: text2,
                    style: TextStyle(
                      fontWeight:
                      FontWeight.w400,
                      color: Style.blackWrite,
                      fontSize:
                      WidgetSize(context).sizedBox17,
                    ),
                  ),
                )
            ),
          ),
        ],
      ),
    );
  }
}
