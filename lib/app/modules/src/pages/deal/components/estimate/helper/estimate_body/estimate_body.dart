
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/components/estimate/helper/estimate_body/estimate_empty_view.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/components/estimate/helper/estimate_body/estimate_first_view.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/components/estimate/helper/estimate_body/estimate_main/estimate_main_view.dart';
import 'package:flutter/material.dart';
import '../../../../../../../../models/nav/deal/deal_estimate.dart';

class EstimateBody extends StatelessWidget {
  final List<DealEstimateList> selectEstimateList;
  final ScrollController scrollController;
  final int selectEstimateLength;
  final int currentSort;
  final bool isUpdate;
  final bool isLoading;
  final bool isStatus;
  const EstimateBody({
    required this.selectEstimateList,
    required this.scrollController,
    required this.selectEstimateLength,
    required this.currentSort,
    required this.isUpdate,
    required this.isLoading,
    required this.isStatus,
    super.key});

  @override
  Widget build(BuildContext context) {
    return
      selectEstimateList.isEmpty
        ? EstimateEmptyView(
        isStatus: isStatus,
        isLoading: isLoading,)
        : selectEstimateList[0].deIdx == -1
        ? EstimateFirstView()
        : EstimateMainView(
        scrollController: scrollController,
      selectEstimate: selectEstimateList,
      selectEstimateLength: selectEstimateLength,
      currentSort: currentSort,
      isUpdate: isUpdate,
    );
  }
}
