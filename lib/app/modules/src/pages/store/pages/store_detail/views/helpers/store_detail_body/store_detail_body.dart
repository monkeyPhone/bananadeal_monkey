import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/store/pages/store_detail/controllers/store_detail_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/store/pages/store_detail/views/helpers/store_detail_body/store_detail_body_scroll/store_detail_body_scroll.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../../components/loading.dart';


class StoreDetailBody extends GetView<StoreDetailController> {
  final String smid;
  final int midx;
  final int? indexs1;
  final int? rong;
  final bool isInvite;
  const StoreDetailBody({
    required this.smid,
    required this.midx,
    required this.indexs1,
    required this.rong,
    required this.isInvite,
    super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: controller.getDetail(smMid: smid, mIdx: midx, isReset: false),
        builder:
            (BuildContext contexts, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {

            return Loading2(text: '잠시만 기다려주세요',);
          } else if (snapshot.hasError) {

            return Loading2(text: '잠시만 기다려주세요',);
          } else {
            return StoreDetailBodyScroll( midx: midx, rong: rong, indexs1: indexs1 ?? null,
              isInvite: isInvite,
            );
          }
        });
  }


}
