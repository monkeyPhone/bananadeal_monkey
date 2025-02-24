import 'package:flutter/material.dart';

import '../../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../../css/style.dart';

class ExplainRowCamera extends StatelessWidget {
  final String text1;
  final String text2;
  const ExplainRowCamera({
    required this.text1,
    required this.text2,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: WidgetSize(context).sizedBox12),
      child: Row(
        children: [
          Flexible(
            flex: 3,
            fit: FlexFit.tight,
            child: Text('카메라',
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
                child: Column(
                  children: [
                    Row(
                      children: [
                       Flexible(
                         flex: 2,
                         fit: FlexFit.tight,
                           child:  Text('전면',
                             style: TextStyle(
                                 color: Style.ultimateGrey,
                                 fontWeight: FontWeight.w400,
                                 fontSize: WidgetSize(context).sizedBox17
                             ),
                           ),
                       ),
                        Flexible(
                          flex: 11,
                          fit: FlexFit.tight,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                overflow:
                                TextOverflow.ellipsis,
                                maxLines: 2,
                                textAlign: TextAlign.start,
                                text: TextSpan(
                                  text: text1,
                                  style: TextStyle(
                                    fontWeight:
                                    FontWeight.w400,
                                    color: Style.blackWrite,
                                    fontSize:
                                    WidgetSize(context).sizedBox17,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: WidgetSize(context).sizedBox7_5,),
                    Row(
                      children: [
                        Flexible(
                          flex: 2,
                          fit: FlexFit.tight,
                          child: Text('후면',
                            style: TextStyle(
                                color: Style.ultimateGrey,
                                fontWeight: FontWeight.w400,
                                fontSize: WidgetSize(context).sizedBox17
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 11,
                          fit: FlexFit.tight,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                overflow:
                                TextOverflow.ellipsis,
                                maxLines: 2,
                                textAlign: TextAlign.start,
                                text: TextSpan(
                                  text: text2,
                                  style: TextStyle(
                                    fontWeight:
                                    FontWeight.w400,
                                    color: Style.blackWrite,
                                    fontSize:
                                    WidgetSize(context).sizedBox16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                )
            ),
          ),
        ],
      ),
    );
  }
}
