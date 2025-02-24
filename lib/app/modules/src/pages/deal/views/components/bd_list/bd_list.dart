import 'package:flutter/material.dart';

import '../../../../../../../css/size.dart';
import '../../../../../../../models/nav/deal/deal_status.dart';
import 'deal_list/deal_list.dart';
import 'deal_list_end/deal_list_end.dart';

class BdList extends StatelessWidget {
  final List<DealStatusList> dealStatus;
  final int dealStatusLength;
  final ScrollController scrollController;
  final bool isLoading;
  const BdList({
    required this.dealStatus,
    required this.dealStatusLength,
    required this.scrollController,
    required this.isLoading,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // DealList(dealStatus: dealStatus,),
        // SizedBox(height: WidgetSize(context).sizedBox20,),
        DealListEnd(
          isLoading: isLoading,
          dealStatus: dealStatus,
          dealStatusLenght: dealStatusLength,
          scrollController: scrollController,
        )
      ],
    );
  }
}
