import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/views/pages/search_phone/components/search_phone/telecom/body_button_area/search_bar/telecom_search_bar.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/views/pages/search_phone/components/search_phone/telecom/body_button_area/sort_bar/telecom_sort_bar.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/views/pages/search_phone/components/search_phone/telecom/body_button_area/tap_menu/telecom_maker_list_tap_menu.dart';
import 'package:flutter/material.dart';
import '../../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../../models/deal/model_list_mobile_maker.dart';

class SearchPhoneCaseTelecomButtonArea extends StatelessWidget {
  final List<ModeListMobileMakerList> makerList;
  final int currentIndex;
  final int currentSort;
  const SearchPhoneCaseTelecomButtonArea({
    required this.makerList,
    required this.currentIndex,
    required this.currentSort,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: WidgetSize(context).sizedBox8,
        ),
        TelecomMakerListTapMenu(
            makerList: makerList,
            currentIndex: currentIndex
        ),
        SizedBox(
          height: WidgetSize(context).sizedBox3,
        ),
        TelecomSearchBar(),
        SizedBox(
          height: WidgetSize(context).sizedBox3,
        ),
        TelecomSortBar(
            currentSort: currentSort
        ),
        SizedBox(
          height: WidgetSize(context).sizedBox8,
        ),
      ],
    );
  }
}
