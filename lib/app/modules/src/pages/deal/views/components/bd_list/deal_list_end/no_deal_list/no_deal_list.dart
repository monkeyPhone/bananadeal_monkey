import 'package:flutter/material.dart';
import '../../../../../../../../../css/size.dart';
import '../../../../../../../../../models/nav/deal/deal_status.dart';
import '../../deal_list/deak_list_main/deal_list_main_status_no.dart';


class NoDealList extends StatelessWidget {
  final List<DealStatusList>  dealStatus;
  const NoDealList({
    super.key,
    required this.dealStatus,
  });

  @override
  Widget build(BuildContext context) {
    return dealStatus.where((element) => element.diStatus == '진행중').isEmpty
            ?    DealListMainStatusNo(
                   width: WidgetSize(context).widthCommon,
                   height: WidgetSize(context).sizedBox136,
                  )
            : const SizedBox()
    ;
  }
}
