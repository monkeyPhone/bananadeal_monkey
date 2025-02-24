import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/views/components/bd_list/deal_list_common.dart';
import 'package:flutter/material.dart';
import '../../../../../../../../../../css/style.dart';
import '../../../../../../../../../../models/nav/deal/deal_status.dart';

class DealListEndScrollBarItem extends StatelessWidget {
  final List<DealStatusList>  dealStatus;
  final int index;
  final GestureTapCallback onTap;
  const DealListEndScrollBarItem({
    required this.dealStatus,
    required this.index,
    required this.onTap,
    super.key});

  @override
  Widget build(BuildContext context) {
    return DealListCommon(dealStatus: dealStatus[index], onTap: onTap,
        color: dealStatus[index].diStatus == '진행중'
          ? Style.white
          : Style.greyF4F4F4);

  }
}
