import 'package:banana_deal_by_monkeycompany/app/components/pad.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/components/alert_page/widgets/deal_active/helper/deal_active_scroll_member/helper/svg_pic.dart';
import 'package:banana_deal_by_monkeycompany/app/routes/const_element.dart';
import 'package:flutter/material.dart';
import '../../../../../../../../../../../css/size.dart';


class DealActiveEndAlert extends StatelessWidget {
  final String text;

  const DealActiveEndAlert({
   required this.text,
    super.key});

  @override
  Widget build(BuildContext context) {
    try{
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPic(asset: AppElement.iconSvgSiren),
          Pad(width: WidgetSize(context).sizedBox8,),
          Container(
            constraints: BoxConstraints(
                maxWidth: WidgetSize(context).sizedBox0_6,
                minWidth: 0,
                minHeight: 0,
                maxHeight: WidgetSize(context).sizedBox0_1
            ),
            child: Text(
              text,
              style: TextStyle(fontSize: WidgetSize(context).sizedBox14, fontWeight: FontWeight.w400,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          )
          ,
          Pad(width: WidgetSize(context).sizedBox8,),
          SvgPic(asset: AppElement.iconSvgSiren),
        ],
      );
    } catch(e){
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPic(asset: AppElement.iconSvgSiren),
          Pad(width: WidgetSize(context).sizedBox8,),
          Container(
            constraints: BoxConstraints(
                maxWidth: WidgetSize(context).sizedBox0_6,
                minWidth: 0,
                minHeight: 0,
                maxHeight: WidgetSize(context).sizedBox0_1
            ),
            child: Text(
              '알림 기간이 지난 종료된 딜입니다.',
              style: TextStyle(fontSize: WidgetSize(context).sizedBox14, fontWeight: FontWeight.w400,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          )
          ,
          Pad(width: WidgetSize(context).sizedBox8,),
          SvgPic(asset: AppElement.iconSvgSiren),
        ],
      );
    }
  }


}
