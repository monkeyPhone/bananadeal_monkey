import 'package:banana_deal_by_monkeycompany/app/components/default_banana.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../../src_components/bottom_nav_bar/controllers/bd_bot_nav_store_controller.dart';
import '../../../../../../../controllers/store_controller.dart';
import '../store_list/store_scroll_list.dart';
import '../store_body_count.dart';

class StoreBodyChangeBottomDownSort extends StatelessWidget {
  const StoreBodyChangeBottomDownSort({
    super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BdBotNavStoreController>(
        builder: (bdC){
          return
            GetBuilder<StoreController>(
                builder: (controller) {
                  return controller.storeInput.value != ''
                    ? controller.loadingSearch.value.$1
                      ? CounterCenter(text: '잠시만 기다려주세요.')
                      : controller.loadingSearch.value.$2 == '실패'
                      ? Counter1(text: '해당하는 매장이 없어요')
                      : SizedBox()
                      :
                  bdC.storeStatus.value == 0
                    ? Counter1(text: '데이터를 불러오는 중입니다.')
                    : bdC.storeStatus >= 500
                        ? DefaultBanana(onPressed: (){
                          bdC.changeValue();
                  })
                        :
                  bdC.storeInfoSort.isEmpty
                          ? Counter1(text: '설정지역 주변에 등록된 매장이 없어요')
                          : StoreScrollList();


                }
            );
        }
    );

  }
}
