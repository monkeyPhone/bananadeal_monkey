import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../controllers/search_phone_controllers/search_phone_telecom_controller.dart';
import '../body_button_area/search_phone_case_telecom_button_area.dart';
import '../body_list_area/search_phone_case_telecom_list_area.dart';

class SearchPhoneCaseTelecomBody extends StatelessWidget {
  const SearchPhoneCaseTelecomBody({
    super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchPhoneTelecomController>(
      builder: (controller) =>
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchPhoneCaseTelecomButtonArea(
                makerList: controller.makerList,
                currentIndex: controller.currentIndex.value,
                currentSort: controller.currentSort.value,
              ),
              Expanded(
                  child: SearchPhoneCaseTelecomListArea(
                    datas: controller.datas.value,
                    phoneDatas: controller.phoneDatas.value,
                    searchPhoneText: controller.searchPhoneText.value,
                  )
              )
            ],
          ),
    );
  }
}
