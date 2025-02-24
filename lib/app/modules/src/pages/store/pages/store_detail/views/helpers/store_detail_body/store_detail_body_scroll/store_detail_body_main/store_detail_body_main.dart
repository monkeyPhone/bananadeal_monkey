import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/store/pages/store_detail/views/helpers/store_detail_body/store_detail_body_scroll/store_detail_body_main/store_detail_body_main_true/store_detail_body_main_true.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../../../../components/loading.dart';
import '../../../../../controllers/store_detail_controller.dart';

class StoreDetailBodyMain extends StatelessWidget {
  final bool isInvite;
  final int midx;
  final int? indexs1;
  final int? rong;
  const StoreDetailBodyMain({
    required this.isInvite,
    required this.midx,
    required this.indexs1,
    required this.rong,
    super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StoreDetailController>(
      builder: (sdC){
        return sdC.updateFail.value
                 ? StoreDetailBodyMainTrue(
                    isInvite: isInvite,
                    midx: midx, rong: rong, indexs1: indexs1 ?? null,
                    storeDetail: sdC.storeDetail.value,
                    reviewList:  sdC.reViewListAll,
                    storePreview: sdC.storePreView,
                    storeEvent: sdC.storeEvent,
                    storeIcon: sdC.storeIcon,
                    isOpen: sdC.isOpen.value,
                    textString: sdC.dayPas.value,
                   )
                 : const DefaultView(text1: '해당 매장을 불러오는 것에 실패하였습니다.', text2: ' ',);
      },
    );
  }
}
