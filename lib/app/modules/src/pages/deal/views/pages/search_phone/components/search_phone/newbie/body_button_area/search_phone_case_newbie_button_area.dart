import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/views/pages/search_phone/components/search_phone/newbie/body_button_area/search_bar/newbie_search_bar.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/views/pages/search_phone/components/search_phone/newbie/body_button_area/sort_bar/newbie_sort_bar.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/views/pages/search_phone/components/search_phone/newbie/body_button_area/tap_menu/newbie_maker_list_tap_menu.dart';
import 'package:flutter/material.dart';
import '../../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../../models/deal/model_list_mobile_maker.dart';

class SearchPhoneCaseNewBieButtonArea extends StatelessWidget {
  final List<ModeListMobileMakerList> makerList;
  final int currentIndex;
  final int currentSort;
  const SearchPhoneCaseNewBieButtonArea({
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
        NewbieMakerListTapMenu(
            makerList: makerList,
            currentIndex: currentIndex
        ),
        SizedBox(
          height: WidgetSize(context).sizedBox3,
        ),
        NewbieSearchBar(),
        SizedBox(
          height: WidgetSize(context).sizedBox3,
        ),
        NewbieSortBar(
            currentSort: currentSort
        ),
        SizedBox(
          height: WidgetSize(context).sizedBox8,
        ),
      ],
    );
  }
}
