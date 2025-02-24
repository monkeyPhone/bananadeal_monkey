import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/components/estimate/estimate_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/components/estimate/helper/estimate_sortbar/estimate_sortbar.dart';
import 'package:banana_deal_by_monkeycompany/app/routes/const/const_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../models/nav/deal/deal_status.dart';
import 'estimate_body/estimate_body.dart';
import 'estimate_statusbar/estimate_status_bar.dart';

class Estimate extends StatelessWidget {
  const Estimate({
    super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EstimatedController>(
        builder: (controller) {
          return Column(
          children: [
            EstimateStatusbar(
                dealStatus: controller.estimateStatus.value,
                currentDeal: controller.currentDeal,
            ),
            EstimateSortBar(
                isEmpty: controller.estimateList.isEmpty,
                estimateCurrentSort: controller.currentSort.value,
                estimateSortName: ['월 납부액 순','할부원금 순','가까운 순'],
            ),
            Expanded(
                child: EstimateBody(
                  scrollController: controller.scrollController,
                  isLoading: controller.isLoading.value,
                  isUpdate: controller.isUpdate.value,
                  selectEstimateList: controller.estimateList,
                  selectEstimateLength: controller.estimateList.length,
                  currentSort: controller.currentSort.value,
                  isStatus: controller.estimateStatus.value == InfoString.dealStatusIng,
                )

            )
          ],
          );
        }
    );
  }
}
