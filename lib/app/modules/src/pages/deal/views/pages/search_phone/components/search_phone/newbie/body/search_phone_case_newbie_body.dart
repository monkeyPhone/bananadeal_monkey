import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/controllers/search_phone_controllers/search_phone_spec_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/views/pages/search_phone/components/search_phone/newbie/body_button_area/search_phone_case_newbie_button_area.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/views/pages/search_phone/components/search_phone/newbie/body_list_area/search_phone_case_newbie_list_area.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class SearchPhoneCaseNewBieBody extends StatelessWidget {
  const SearchPhoneCaseNewBieBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchPhoneSpecController>(
      builder: (controller) =>
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchPhoneCaseNewBieButtonArea(
                makerList: controller.makerList,
                currentIndex: controller.currentIndex.value,
                currentSort: controller.currentSort.value,
              ),
              Expanded(
                  child: SearchPhoneCaseNewbieListArea(
                    currentDatas: controller.currentDatas.value,
                    showDatas: controller.showDatas.value,
                    searchPhoneText: controller.searchPhoneText.value,
                  )
              )
            ],
          ),
    );
  }
}
