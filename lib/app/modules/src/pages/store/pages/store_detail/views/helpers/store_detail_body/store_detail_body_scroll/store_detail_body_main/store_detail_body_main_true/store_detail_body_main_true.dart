import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/store/pages/store_detail/views/helpers/store_detail_body/store_detail_body_scroll/store_detail_body_main/store_detail_body_main_true/store_detail_button_bar/store_detail_button_bar.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/store/pages/store_detail/views/helpers/store_detail_body/store_detail_body_scroll/store_detail_body_main/store_detail_body_main_true/store_detail_image_area/store_detail_image_area.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/store/pages/store_detail/views/helpers/store_detail_body/store_detail_body_scroll/store_detail_body_main/store_detail_body_main_true/store_detail_profile/store_detail_profile.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/store/pages/store_detail/views/helpers/store_detail_body/store_detail_body_scroll/store_detail_body_main/store_detail_body_main_true/store_detail_tap/store_detail_tap.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/store/pages/store_detail/views/helpers/store_detail_body/store_detail_body_scroll/store_detail_body_main/store_detail_body_main_true/store_detail_tap/store_detail_tap_bar.dart';
import 'package:flutter/material.dart';
import '../../../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../../../models/store/store_detail_info.dart';
import '../../../../../../../../../../../../models/store/store_detail_review.dart';


class StoreDetailBodyMainTrue extends StatelessWidget {
  final bool isInvite;
  final int midx;
  final int? indexs1;
  final int? rong;
  final StoreDetail storeDetail;
  final List<StoreReViewList> reviewList;
  final List storePreview;
  final List storeIcon;
  final List storeEvent;
  final bool isOpen;
  final String textString;


  const StoreDetailBodyMainTrue({
    required this.isInvite,
    required this.midx,
    required this.indexs1,
    required this.rong,
    required this.storeDetail,
    required this.reviewList,
    required this.storePreview,
    required this.storeIcon,
    required this.storeEvent,
    required this.isOpen,
    required this.textString,

    super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: WidgetSize(context).sizedBox3,
        ),
        StoreDetailImageArea(
            storeDetail: storeDetail, storePreview: storePreview,
        ),

        SizedBox(height: WidgetSize(context).sizedBox14,),

        StoreDetailProfile(storeDetail: storeDetail, rong: rong, isOpen: isOpen, indexs1: indexs1 ?? null, textString: textString,),

        SizedBox(height: WidgetSize(context).sizedBox14,),
        //buttonBar
        StoreDetailButtonBar(storeDetail: storeDetail, isInvite: isInvite,),

        StoreDetailTapbar(),

        SizedBox(height: WidgetSize(context).sizedBox26),

        StoreDetailTap(
          isInvite: isInvite,
          storeDetail: storeDetail, reviewList: reviewList,storeEvent: storeEvent, storeIcon: storeIcon,
        )
      ],
    );
  }

}
