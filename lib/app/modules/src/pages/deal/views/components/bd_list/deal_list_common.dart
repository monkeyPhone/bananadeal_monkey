import 'package:banana_deal_by_monkeycompany/app/components/rich_text_widget.dart';
import 'package:flutter/material.dart';

import '../../../../../../../components/widget_components/ripple_button/ripple_button.dart';
import '../../../../../../../css/size.dart';
import '../../../../../../../css/style.dart';
import '../../../../../../../models/nav/deal/deal_status.dart';
import 'deal_list/deak_list_main/deal_list_main_status_ing/deal_list_main_status_ing_image_area.dart';
import 'deal_list_textarea.dart';

class DealListCommon extends StatelessWidget {
  final DealStatusList dealStatus;
  final GestureTapCallback onTap;
  final Color color;
  final double? width;
  final double? height;
  const DealListCommon({
    super.key,
    required this.dealStatus,
    required this.onTap,
    required this.color,
    this.width,
    this.height
  });

  @override
  Widget build(BuildContext context) {
    return RippleDecorationButton(
      onTap: onTap,
      color: color,
      outBorder: Border(bottom: BorderSide(
        width: WidgetSize(context).sizedBox1_5,
          color: Colors.grey.shade50
      )),
      inerMargin: EdgeInsets.symmetric(vertical: WidgetSize(context).sizedBox10_5),
      width: width ??  WidgetSize(context).widthCommon,
      height: height ?? WidgetSize(context).sizedBox136,
      padding: WidgetSize(context).paddingBodyWhole,
      widget: Row(
        children: [
          DealListMainStatusIngImageArea(
            dealStatus: dealStatus,
            borderGap: WidgetSize(context).sizedBox1_5,
            borderRadius: BorderRadius.circular(WidgetSize(context).sizedBox5),
          ),
          SizedBox(width: WidgetSize(context).sizedBox15,),
          Expanded(
            child: Container(
              color: Colors.transparent,
              padding: EdgeInsets.symmetric(
                horizontal: WidgetSize(context).sizedBox5,
                vertical: WidgetSize(context).sizedBox8,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DealListTextArea(
                      text: dealStatus.diHopePhone,
                      style22: TextStyle(
                          fontSize: WidgetSize(context).sizedBox22,
                          fontWeight: FontWeight.w700,
                          color: Style.blackWrite
                      ),
                      style18:TextStyle(
                          fontSize: WidgetSize(context).sizedBox18,
                          fontWeight: FontWeight.w700,
                          color: Style.blackWrite
                      )
                  ),
                  // Row(
                  //   crossAxisAlignment: CrossAxisAlignment.end,
                  //   children: [
                  //     Text('받은 견적  ', style: TextStyle(
                  //         fontSize: WidgetSize(context).sizedBox18,
                  //         fontWeight: FontWeight.w700,
                  //         color: Style.blackWrite
                  //     )),
                  //     Text(dealStatus.diEstimateCnt.toString(), style:TextStyle(
                  //         fontSize: WidgetSize(context).sizedBox18,
                  //         fontWeight: FontWeight.w700,
                  //         color: Style.red
                  //     ),),
                  //     Text('건 ', style: TextStyle(
                  //         fontSize: WidgetSize(context).sizedBox18,
                  //         fontWeight: FontWeight.w700,
                  //         color: Style.blackWrite
                  //     ),),
                  //   ],
                  // ),
                  RichTextWidget(
                    list: [
                      ('받은 견적   ',
                      TextStyle(
                          fontSize: WidgetSize(context).sizedBox18,
                          fontWeight: FontWeight.w700,
                          color: Style.blackWrite
                        )
                      ),
                      ('${dealStatus.diEstimateCnt}',
                      TextStyle(
                          fontSize: WidgetSize(context).sizedBox18,
                          fontWeight: FontWeight.w700,
                          color: Style.red
                      )
                      ),
                      (' 건',
                      TextStyle(
                          fontSize: WidgetSize(context).sizedBox18,
                          fontWeight: FontWeight.w700,
                          color: Style.blackWrite
                      )
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(WidgetSize(context).sizedBox4),
            child: Center(
              child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Icon(Icons.arrow_forward_ios, size: WidgetSize(context).sizedBox22,)),
            ),
          )
        ],
      ),
    );
  }
}
