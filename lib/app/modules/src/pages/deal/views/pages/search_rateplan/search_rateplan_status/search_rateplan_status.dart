import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/views/pages/search_rateplan/search_rateplan_status/widgets/list/rate_list.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/views/pages/search_rateplan/search_rateplan_status/widgets/list/rate_list_empty.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/views/pages/search_rateplan/search_rateplan_status/widgets/rate_appbar.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/views/pages/search_rateplan/search_rateplan_status/widgets/rate_searchbar.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/views/pages/search_rateplan/search_rateplan_status/widgets/rate_tap_menu.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/views/pages/search_rateplan/search_rateplan_status/widgets/sort_bar/rate_sort_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../css/size.dart';
import '../../../../../../../../css/style.dart';
import '../../../../controllers/search_rateplan_controllers/search_rateplan_controller.dart';


class SearchRateplanStatus extends StatelessWidget {
  const SearchRateplanStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchRateplanController>(
        builder: (controller) =>
        controller.error.value == 'N'
            ? SizedBox()
            :
        Container(
          color: Style.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RateAppBar(),
              SizedBox(
                height: WidgetSize(context).sizedBox8,
              ),
              RateTapMenu(
                  isMenu: controller.rateData.value.rateList!.isEmpty || controller.nameData.value.list[0].pgName == '',
                  nameList: controller.nameData.value,
                  currentIndex: controller.currentIndex.value,
              ),
              SizedBox(
                height: WidgetSize(context).sizedBox3,
              ),
              RateSearchBar(),
              SizedBox(
                height: WidgetSize(context).sizedBox3,
              ),
              RateSortBar(
                  arraySort: controller.arraySort, 
                  currentSort:  controller.currentSort.value
              ),
              SizedBox(
                height: WidgetSize(context).sizedBox8,
              ),
              //routecase 0미완료
              Expanded(
                child: controller.rateData.value.rateList!.isEmpty || controller.nameData.value.list[0].pgName == ''
                    ? Center(child: const CircularProgressIndicator(color: Style.progressBar,))
                    : MediaQuery.of(context).viewInsets.bottom > 0
                        ? RateListEmpty()
                        : controller.rateListModel.isEmpty || controller.rateListModel.length == 0 ||
                         (controller.rateListModel.isEmpty && controller.searchPlanText.value == '')
                            ? RateListEmpty()
                            : RateListWidget(rateList: controller.rateListModel,),
              )
            ],
          ),
        )
    );
  }
  
}
