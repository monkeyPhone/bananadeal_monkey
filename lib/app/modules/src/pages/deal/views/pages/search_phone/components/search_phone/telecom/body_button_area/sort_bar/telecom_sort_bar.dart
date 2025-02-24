import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/views/pages/search_phone/components/common/search_phone_sort_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../../../css/style.dart';
import '../../../../../../../../controllers/search_phone_controllers/search_phone_telecom_controller.dart';

class TelecomSortBar extends GetView<SearchPhoneTelecomController> {
  final int currentSort;
  const TelecomSortBar({
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
               onTap:  controller.saleOnTap(),
               boxColor: currentSort == 1 || currentSort == 2 ? Style.yellow : Style.white,
               borderColor: currentSort == 1 || currentSort == 2 ? Colors.transparent : Style.greyAAAAAA,
               text: currentSort == 1 || currentSort == 2 ?  controller.arraySort[currentSort] :  controller.arraySort[1],
               textColor: currentSort == 1 || currentSort == 2 ? Style.brown : Style.greyAAAAAA
           ),
           SearchPhoneSortButton(
               onTap:  controller.recentOnTap(),
               boxColor: currentSort == 3 ? Style.yellow : Style.white,
               borderColor: currentSort == 3 ? Colors.transparent : Style.greyAAAAAA,
               text:  controller.arraySort[3],
               textColor: currentSort == 3 ? Style.brown : Style.greyAAAAAA
           ),
           SearchPhoneSortButton(
               onTap:  controller.nameOnTap(),
               boxColor: currentSort == 4 || currentSort == 5 ? Style.yellow : Style.white,
               borderColor: currentSort == 4 || currentSort == 5 ? Colors.transparent : Style.greyAAAAAA,
               text: currentSort == 4 || currentSort == 5 ?  controller.arraySort[currentSort] :  controller.arraySort[4],
               textColor: currentSort == 4 || currentSort == 5 ? Style.brown : Style.greyAAAAAA
           ),
         ],
        ),
      ),
    );
  }
}
