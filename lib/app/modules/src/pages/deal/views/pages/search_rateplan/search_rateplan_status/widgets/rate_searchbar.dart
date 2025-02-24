import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/controllers/search_rateplan_controllers/search_rateplan_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../../components/widget_components/ripple_button/ripple_search_icon_button.dart';
import '../../../../../../../../../css/size.dart';
import '../../../../../../../../../css/style.dart';
import '../../../../widgets/sign_text_form.dart';

class RateSearchBar extends GetView<SearchRateplanController> {
  const RateSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: WidgetSize(context).sizedBox16,
          vertical: WidgetSize(context).sizedBox8
      ),
      child: SignTextForm(
        hintText: '검색어를 입력해주세요.',
        controller: controller.searchPlanC,
        keyboardType: TextInputType.text,
        enabled: true,
        textInputAction: TextInputAction.search,
        suffixIcon: RippleSearchIconButton(
          onTap: (){
            controller.searchButtonIcon();
            FocusManager.instance.primaryFocus?.unfocus();
          },
        ),
        onChanged:  controller.inputPhone,
        onFieldSubmitted: controller.searchButton,
        maxLength: 30,
        inputTextStyle: TextStyle(
            fontSize: WidgetSize(context).sizedBox14,
            color: Style.blackWrite,
            fontWeight: FontWeight.w400
        ),
      ),
    );
  }
}
