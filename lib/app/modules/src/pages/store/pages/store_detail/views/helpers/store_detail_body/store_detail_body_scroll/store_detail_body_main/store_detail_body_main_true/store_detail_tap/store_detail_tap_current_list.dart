import 'package:flutter/material.dart';

import '../../../../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../../../../models/store/store_detail_info.dart';
import '../../../../../../../../../../../../../models/store/store_detail_review.dart';
import 'helper/store_detail_home_event/store_detail_home_event.dart';
import 'helper/store_detail_home_intro/store_detail_home_intro.dart';
import 'helper/store_detail_tap_0_review/store_detail_tap_0_review.dart';

class StoreDetailTapCurrentList extends StatelessWidget {
  final StoreDetail storeDetail;
  final List<StoreReViewList> reviewList;
  final List storeEvent;
  final List storeIcon;
  final bool isInvite;

  const StoreDetailTapCurrentList({
    required this.storeDetail,
    required this.reviewList,
    required this.storeEvent,
    required this.storeIcon,
    required this.isInvite,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: WidgetSize(context).widthCommon,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StoreDetailHomeIntro(homeIntro: storeDetail.smStoreIntroduce),
          SizedBox(height: WidgetSize(context).sizedBox26),
          StoreDetailHomeEvent(storeEvent: storeEvent, storeIcon: storeIcon),
         
          StoreDetailTap0Review(storeDetail: storeDetail, reviewList: reviewList, isInvite: isInvite,),
        ],
      ),
    );
  }
}
