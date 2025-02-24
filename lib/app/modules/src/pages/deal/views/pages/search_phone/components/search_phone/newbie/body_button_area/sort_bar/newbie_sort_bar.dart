import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/controllers/search_phone_controllers/search_phone_spec_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/views/pages/search_phone/components/common/search_phone_sort_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../../../css/style.dart';

class NewbieSortBar extends GetView<SearchPhoneSpecController> {
  final int currentSort;
  const NewbieSortBar({
    required this.currentSort,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: WidgetSize(context).sizedBox16),
      child: SizedBox(
        width: WidgetSize(context).widthCommon,
        child: Row(
         children: [
           SearchPhoneSortButton(
               onTap: controller.basicOnTap(),
               boxColor: currentSort == 0 ? Style.yellow : Style.white,
               borderColor: currentSort == 0 ? Colors.transparent : Style.greyAAAAAA,
               text: controller.arraySort[0],
               textColor: currentSort == 0 ? Style.brown : Style.greyAAAAAA
           ),
           SearchPhoneSortButton(
               onTap: controller.latestOnTap(),
               boxColor: currentSort == 1 ? Style.yellow : Style.white,
               borderColor: currentSort == 1 ? Colors.transparent : Style.greyAAAAAA,
               text: controller.arraySort[1],
               textColor: currentSort == 1 ? Style.brown : Style.greyAAAAAA
           ),
           SearchPhoneSortButton(
               onTap:  controller.nameOnTap(),
               boxColor: currentSort == 2 || currentSort == 3 ? Style.yellow : Style.white,
               borderColor: currentSort == 2 || currentSort == 3 ? Colors.transparent : Style.greyAAAAAA,
               text: currentSort == 2 || currentSort == 3 ?  controller.arraySort[currentSort] :  controller.arraySort[2],
               textColor: currentSort == 2 || currentSort == 3 ? Style.brown : Style.greyAAAAAA,
           ),
         ],
        ),
      ),
    );
  }
}
