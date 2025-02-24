import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/store/controllers/store_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../store_list/store_scroll_list.dart';
import '../store_body_count.dart';

class StoreBodyChangeBottomUpMain extends GetView<StoreController> {

  const StoreBodyChangeBottomUpMain({

    super.key});

  @override
  Widget build(BuildContext context) {
    return ObxValue(
            (search) =>
            search.isNotEmpty
                ? StoreScrollList()
                : ObxValue((input) =>
                   input.value == ''
                      ? CounterCenter(text: '검색어를 입력해주세요.')
                      : ObxValue(
                           (load) =>
                           load.value.$1
                               ? CounterCenter(text: '잠시만 기다려주세요.')
                               : load.value.$2 == '실패'
                                    ? CounterCenter(text: '해당하는 매장이 없어요.')
                                    : SizedBox()
                        , controller.loadingSearch)
                , controller.storeInput)
      , controller.storeSearch);
  }
}
