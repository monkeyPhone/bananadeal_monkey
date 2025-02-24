import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/controllers/search_rateplan_controllers/search_rateplan_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/views/pages/search_rateplan/search_rateplan_status/widgets/sort_bar/rate_sort_bar_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../css/style.dart';

class RateSortBar extends GetView<SearchRateplanController> {
  final List arraySort;
  final int currentSort;
  const RateSortBar({
    super.key,
    required this.arraySort,
    required this.currentSort
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: WidgetSize(context).sizedBox16),
      child: SizedBox(
        width: WidgetSize(context).widthCommon,
        child: Row(
            children: [
              RateSortBarButton(
                  onTap: (){
                    controller.rateSortClick(0);
                  },
                  boxColor: currentSort == 0 ? Style.yellow : Style.white,
                  borderColor:currentSort == 0 ? Style.yellow : Style.greyAAAAAA,
                  text: arraySort[0],
                  textColor: currentSort == 0 ? Style.brown : Style.greyAAAAAA
              ),
              RateSortBarButton(
                  onTap: (){
                    controller.rateSortClick(1);
                  },
                  boxColor: currentSort == 1 || currentSort == 2 ? Style.yellow : Style.white,
                  borderColor: currentSort == 1 || currentSort == 2 ? Style.yellow : Style.greyAAAAAA,
                  text: currentSort == 1 || currentSort == 2 ? arraySort[currentSort] : arraySort[1],
                  textColor: currentSort == 1 || currentSort == 2 ? Style.brown : Style.greyAAAAAA
              ),
              RateSortBarButton(
                  onTap: (){
                    controller.rateSortClick(2);
                  },
                  boxColor: currentSort == 3 ? Style.yellow : Style.white,
                  borderColor: currentSort == 3 ? Style.yellow : Style.greyAAAAAA,
                  text: arraySort[3],
                  textColor: currentSort == 3 ? Style.brown : Style.greyAAAAAA
              ),
              RateSortBarButton(
                  onTap: (){
                    controller.rateSortClick(3);
                  },
                  boxColor: currentSort == 4 || currentSort == 5 ? Style.yellow : Style.white,
                  borderColor: currentSort == 4 || currentSort == 5 ? Style.yellow : Style.greyAAAAAA,
                  text: currentSort == 4 || currentSort == 5 ? arraySort[currentSort] : arraySort[4],
                  textColor:currentSort == 4 || currentSort == 5 ? Style.brown : Style.greyAAAAAA
              ),
            ]
        ),
      ),
    );
  }
}
