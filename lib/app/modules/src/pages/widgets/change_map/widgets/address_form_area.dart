import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_search_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../components/custom_text_form.dart';
import '../../../../../../css/size.dart';
import '../change_map_controller.dart';

class AddressFormArea extends StatelessWidget {
  final BuildContext mediaContext;
  const AddressFormArea({
    required this.mediaContext,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: WidgetSize(context).paddingBodyWhole,
      child: GetBuilder<ChangeMapController>(
          builder: (controller){
            return  controller.longtitude.value != '' && controller.latitude.value != ''
                && controller.dong.value != '' && controller.addr.value != ''
                ?  const SizedBox()
                :  CustomTextFormField(
                    focusNode: controller.focus,
                    textInputAction: TextInputAction.search,
                    onFieldSubmitted: (String value) async{
                      if(controller.addressInput.value == ''){
                        controller.noInputClick();
                      } else{
                        if(controller.addressInput.value.length > 1){
                          controller.focus.unfocus();
                          controller.currentPage.value = 1;
                          await controller.getAdress(search: controller.addressInput.value, currentPage: controller.currentPage.value, context: mediaContext);
                        } else{
                          controller.commonWidgets.customSnackbar('두 글자 이상 검색해주세요.');
                        }
                      }
                    },
                    onChanged: controller.inputAddr, textController: controller.addressFormController,
                    hintText:  '주소를 입력해주세요.', enabled: true,
                    suffixIcon: RippleSearchIconButton(
                      onTap:  controller.addressInput.value != ''
                          ? () async{
                        if(controller.addressInput.value.length > 1){
                          controller.focus.unfocus();
                          controller.currentPage.value = 1;
                          await controller.getAdress(search: controller.addressInput.value, currentPage: controller.currentPage.value, context: mediaContext);
                        } else{
                          controller.commonWidgets.customSnackbar('두 글자 이상 검색해주세요.');
                        }
                      }
                          : (){
                        controller.noInputClick();
                      },
                    ),

              width: WidgetSize(context).widthCommon,
            );
          }
      ),
    );
  }
}
