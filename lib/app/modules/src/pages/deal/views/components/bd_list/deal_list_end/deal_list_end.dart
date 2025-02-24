import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/views/components/bd_list/deal_list_end/deal_list_end_scroll_bar/deal_list_end_scroll_bar.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/views/components/bd_list/deal_list_end/deal_list_end_status_bar/deal_list_end_status_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../css/size.dart';
import '../../../../../../../../css/style.dart';
import '../../../../../../../../models/nav/deal/deal_status.dart';
import '../../../../controllers/deal_controller.dart';
import 'no_deal_list/no_deal_list.dart';

class DealListEnd extends StatelessWidget {
  final List<DealStatusList>  dealStatus;
  final int dealStatusLenght;
  final ScrollController scrollController;
  final bool isLoading;
  const DealListEnd({
    required this.dealStatus,
    required this.dealStatusLenght,
    required this.scrollController,
    required this.isLoading,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
          width: WidgetSize(context).widthCommon,
          color: Style.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(height: WidgetSize(context).sizedBox10,),
              Expanded(
                child: Column(
                  children: [
                    // NoDealList(dealStatus: dealStatus,),
                    Expanded(
                        child: DealListEndScrollBar(
                          dealStatus: dealStatus,
                          dealStatusLenght: dealStatusLenght,
                          scrollController: scrollController,
                          isLoading: isLoading,
                        )
                    ),
                  ],
                ),
              )
            ],
          ),
        )
    );
  }
}
