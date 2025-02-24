import 'package:banana_deal_by_monkeycompany/app/app_outs/bottom_sheet_detail/view/bottom_sheet_detail.dart';
import 'package:banana_deal_by_monkeycompany/app/app_outs/bottom_sheet_detail/view/dialog/goto_detail.dart';
import 'package:banana_deal_by_monkeycompany/app/models/src/deal/user_deal.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/controllers/search_phone_controllers/search_phone_detail_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/views/pages/search_phone/search_phone_detail.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/src_components/controllers/src_deal_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/routes/api_url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppOutsRouting {
  const AppOutsRouting();

  void gotoInvite(){
    SrcDealController.to.gotoInvite();
  }

  void showDetailBottomSheet({
    required BuildContext context,
    required UserDealInfo userDealInfo,
  }){
    BrowserBottomSheetOption().showSheet(routerContext: context,
        userDealInfo: userDealInfo);
  }




  void gotoModelDetail({
    required int diHopePhoneIdx,
    required String diHopePhone
  }){
    Get.to(
            () => SearchPhoneDetail(
            psIdex: diHopePhoneIdx,
            psName: diHopePhone
        ),
        binding: BindingsBuilder(
                () {
              Get.put(SearchPhoneDetailController());
            }
        )
    );
  }

  void gotoRateDetail({
    required BuildContext context,
    required String pIdx
  }){
    GotoDetail().gotoRateDetailDialog(context: context, pIdx: pIdx,
        baseUrl: ApiConsole.monkeyUrl);
  }

}