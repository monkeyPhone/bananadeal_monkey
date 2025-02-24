import 'package:banana_deal_by_monkeycompany/app/components/common_widgets.dart';
import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_search_icon_button.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/sign/controllers/sign_view_4_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../components/custom_text_form.dart';
import '../../../../../../../../css/size.dart';

class Sign4AddressFormAreaCurrent extends GetView<SignView4Controller> {

   const Sign4AddressFormAreaCurrent({

     super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      focusNode: controller.focus,
      onChanged: controller.inputAddr, textController: controller.addressFormController,
      hintText:  '주소를 입력해주세요.', enabled: true, width: WidgetSize(context).widthCommon,
      textInputAction: TextInputAction.search,
      onFieldSubmitted: (String value){
        if(controller.addressInput.value.length > 1){
          controller.focus.unfocus();
          controller.currentPage.value = 1;
          controller.getAdress(controller.addressInput.value, controller.currentPage.value, context);
        } else{
          controller.commonWidgets.customSnackbar('두 글자 이상 검색해주세요.');
        }
      },
      suffixIcon: RippleSearchIconButton(
          onTap: (){
            if(controller.addressInput.value.length > 1){
              controller.focus.unfocus();
              controller.currentPage.value = 1;
              controller.getAdress(controller.addressInput.value, controller.currentPage.value, context);
            } else{
              controller.commonWidgets.customSnackbar('두 글자 이상 검색해주세요.');
            }
          }
      )

    );
  }
}

