import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_button.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_inquiry/etc_inquiry_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_inquiry/helper/widgets/container_widget/inquiry_list_container_time.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../css/style.dart';
import 'inquiry_list_container_result.dart';


class InquiryListContainer extends GetView<EtcInquiryController> {
  final int index;
  final String date;
  final String title;
  final String status;
  final bool isWhere;
  const InquiryListContainer({
    required this.index,
    required this.date,
    required this.title,
    required this.status,
    required this.isWhere,
    super.key});

  @override
  Widget build(BuildContext context) {
    return RippleDecorationButton(
        onTap: (){
          controller.listTapEvent(index);
        },
        padding: EdgeInsets.only(
            left: WidgetSize(context).sizedBox16, right: WidgetSize(context).sizedBox16
        ),
        width: WidgetSize(context).widthCommon,
        height: WidgetSize(context).sizedBox72,
        border: Border(
            top: BorderSide(
                width: index == 0 ? WidgetSize(context).sizedBox1 : 0,
                color: Style.greyDDDDDD
            ),
            bottom: BorderSide(
                width: WidgetSize(context).sizedBox1,
                color: Style.greyDDDDDD
            )
        ),
        widget: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  switch(isWhere){
                    true =>
                        Text('${title}',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: WidgetSize(context).etcTitleSize,
                            color: Style.blackWrite,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                    _ =>
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.centerLeft,
                        child: Text('${title}',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: WidgetSize(context).etcTitleSize,
                            color: Style.blackWrite,
                          ),
                        ),
                      )
                  },
                  SizedBox(height: WidgetSize(context).etcTimeGap,),
                  InquiryListContainerTime(date: date,)

                ],
              ),
            ),
            SizedBox(width: WidgetSize(context).sizedBox16,),
            InquiryListContainerResult(status: status,)
          ],
        )
    );
  }
}
