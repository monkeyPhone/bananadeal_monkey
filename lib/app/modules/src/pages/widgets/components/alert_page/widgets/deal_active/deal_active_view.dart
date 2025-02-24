import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/components/alert_page/widgets/alert_noti_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/components/alert_page/widgets/deal_active/helper/deal_active_expanded.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../css/size.dart';

class DealActiveView extends GetView<AlertNotiController> {
  const DealActiveView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: WidgetSize(context).extendsGap,
        ),
        Expanded(
            child: Container(
                padding: EdgeInsets.only(top: WidgetSize(context).sizedBox12),
                color: Colors.grey[100],
                child: DealActiveContainerChild()
            )
        ),
      ],
    );


  }
}
