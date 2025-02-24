import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_search_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../css/size.dart';
import '../../../../../../css/style.dart';
import '../../controllers/deal_controller.dart';
import 'management_button/end_deal_management_button.dart';

class DealAppbar extends GetView<DealController> {
  const DealAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: WidgetSize(context).sizedBox16, right: WidgetSize(context).sizedBox7_5),
      child: SizedBox(
        width: WidgetSize(context).widthCommon,
        height: WidgetSize(context).height60px,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'My 딜',
              style: TextStyle(color: Colors.black, fontSize: WidgetSize(context).sizedBox24, fontWeight: FontWeight.w700),
            ),
            Row(
              children: [
                EndDealManagementButton(),
                SizedBox(
                  width: WidgetSize(context).sizedBox7_5,
                ),
                ObxValue(
                        (click) =>
                            RippleIconButton(
                                onTap: () async{
                                  await controller.clickRefresh(context, true);
                                },
                                icon: Icons.refresh,
                                iconSize: WidgetSize(context).sizedBox50,
                                padding: WidgetSize(context).sizedBox5,
                                iconColor: !controller.refreshClick.value ? Style.blackWrite : Style.yellow
                            )
                    , controller.refreshClick
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
