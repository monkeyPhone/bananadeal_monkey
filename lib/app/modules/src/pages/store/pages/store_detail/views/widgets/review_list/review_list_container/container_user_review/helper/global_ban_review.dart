import 'package:flutter/material.dart';

import '../../../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../../../css/style.dart';

class GlobalBanReview extends StatelessWidget {
  final allTime;
  const GlobalBanReview({
    required this.allTime,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text('※ 운영정책에 위반된 댓글입니다 ※',
          style: TextStyle(
              fontSize: WidgetSize(context).sizedBox16,
              fontWeight: FontWeight.w400,
              color: Style.ultimateGrey
          ),
          textAlign: TextAlign.start,
        ),

        SizedBox(
          height: WidgetSize(context).sizedBox10,
        ),
        Text('$allTime',
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: WidgetSize(context).sizedBox14,
              color: Style.grey999999
          ),
        ),
      ],
    );
  }
}
