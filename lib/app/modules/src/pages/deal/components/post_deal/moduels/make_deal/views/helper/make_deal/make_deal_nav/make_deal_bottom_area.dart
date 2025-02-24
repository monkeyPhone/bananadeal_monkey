import 'package:banana_deal_by_monkeycompany/app/components/disable_button.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/components/post_deal/moduels/make_deal/controllers/make_deal_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/components/post_deal/moduels/make_deal/views/helper/make_deal/make_deal_nav/make_deal_one_button.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/components/post_deal/moduels/make_deal/views/helper/make_deal/make_deal_nav/make_deal_two_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MakeDealBottomArea extends GetView<MakeDealController> {
  const MakeDealBottomArea({super.key});

  @override
  Widget build(BuildContext context) {
    return ObxValue((wait) =>
    wait.value
        ? DisableButton(
      text: '잠시만 기다려주세요.',
          )
        :
        ObxValue(
                (page) => page.value == 1 || page.value == 11
                ? MakeDealOneButton(page: page.value,)
                : MakeDealTwoButton(page: page.value,)
            , controller.currentStep)
        , controller.waitPost);
  }
}
