import 'package:flutter/material.dart';

import '../../../../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../../../../css/style.dart';

class InquiryCommentText extends StatelessWidget {
  final String miComment;
  const InquiryCommentText({super.key, required this.miComment});

  @override
  Widget build(BuildContext context) {
    return
      miComment != ''
          ?  Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: WidgetSize(context).sizedBox16,),
                Text(miComment,
                  style: TextStyle(
                      fontSize: WidgetSize(context).sizedBox17,
                      fontWeight: FontWeight.w400,
                      color: Style.blackWrite
                  ),
                ),
              ],
             )
          : SizedBox();
  }
}
