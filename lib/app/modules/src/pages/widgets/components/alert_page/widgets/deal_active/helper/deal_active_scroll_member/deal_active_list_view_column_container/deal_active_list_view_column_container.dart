import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/components/alert_page/widgets/deal_active/helper/deal_active_scroll_member/helper/deal_active_end_alert.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/components/alert_page/widgets/deal_active/helper/deal_active_scroll_member/helper/deal_active_open_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../../css/style.dart';
import '../../../../../../../../../../../models/fcm/message_data_name.dart';
import '../../../../../../../../../src_components/controllers/src_deal_controller.dart';

class DealActiveListViewColumnContainer extends StatelessWidget {
  final bool titleBool;
  final bool elementBool;
  final String name;
  const DealActiveListViewColumnContainer({
    required this.titleBool,
    required this.elementBool,
    required this.name,
    super.key});

  @override
  Widget build(BuildContext context) {
    return titleBool
        ?  Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(WidgetSize(context).sizedBox12),
            color: elementBool
                ? Style.red
                : Style.yellow
        ),
        margin: EdgeInsets.symmetric(vertical: WidgetSize(context).sizedBox12),
        padding: EdgeInsets.all(
            elementBool
                ? WidgetSize(context).sizedBox1_5
                : WidgetSize(context).sizedBox2
        ),
        child: Container(
          padding: elementBool
              ? EdgeInsets.symmetric( vertical: WidgetSize(context).sizedBox5 )
              : EdgeInsets.all( WidgetSize(context).sizedBox10 ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(WidgetSize(context).sizedBox12),
            color: Style.white,
          ),
          child: elementBool
              ? GetBuilder<SrcDealController>(
              builder: (srcD)=>
                  DealActiveEndAlert(
                      text: "'${name}' 딜 종료"
                  )
          )

              :  DealActiveOpenAlert(messageData: messageDataNameFromJson('${name}')),
        )
    )
        : const SizedBox();
  }
}
