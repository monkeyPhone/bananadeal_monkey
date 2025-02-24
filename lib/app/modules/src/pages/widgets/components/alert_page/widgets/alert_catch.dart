import 'package:flutter/material.dart';

import '../../../../../../../components/pad.dart';
import '../../../../../../../css/size.dart';
import '../../../../../../../routes/const_element.dart';
import 'deal_active/helper/deal_active_scroll_member/helper/svg_pic.dart';

class AlertCatch extends StatelessWidget {
  const AlertCatch({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPic(asset:  AppElement.iconBanana),
        Pad(width: WidgetSize(context).sizedBox8,),
        Container(
          constraints: BoxConstraints(
            maxWidth: WidgetSize(context).sizedBox0_6,
            minWidth: 0,
            minHeight: 0,
            maxHeight: WidgetSize(context).sizedBox0_1,
          ),
          child: Text(
            '알림 기간이 지난 개통된 딜입니다.',
            style: TextStyle(fontSize: WidgetSize(context).sizedBox14, fontWeight: FontWeight.w400,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        )
        ,
        Pad(width: WidgetSize(context).sizedBox8,),
        SvgPic(asset: AppElement.iconBanana2),
      ],
    );
  }
}
