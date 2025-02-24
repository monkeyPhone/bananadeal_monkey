import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/controllers/deal_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../../css/size.dart';
import '../../../../../../../../../models/nav/deal/deal_status.dart';
import 'deal_list_end_scroll_bar_item/deal_list_end_scroll_bar_item.dart';

class DealListEndScrollBar extends GetView<DealController> {
  final List<DealStatusList>  dealStatus;
  final int dealStatusLenght;
  final ScrollController scrollController;
  final bool isLoading;
  const DealListEndScrollBar({
    required this.dealStatus,
    required this.dealStatusLenght,
    required this.scrollController,
    required this.isLoading,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: scrollController,
      thumbVisibility: true,
      child: ListView.builder(
          controller: scrollController,
          physics: const ClampingScrollPhysics(),
          itemCount: dealStatusLenght,
          itemBuilder: (BuildContext context, int index){
            return DealListEndScrollBarItem(
                dealStatus: dealStatus,
              index: index,
              onTap: controller.pageGo(context: context, currentDeal: dealStatus[index], route: 1, isLoading: isLoading),
            );
          }
      ),
    );
  }
}
