import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/views/pages/search_phone/components/search_phone/telecom/body_list_area/telecom_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../../../../components/text_class/text_class.dart';
import '../../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../../models/deal/model_list_mobile.dart';
import '../../../../../../../controllers/search_phone_controllers/search_phone_telecom_controller.dart';

class SearchPhoneCaseTelecomListArea extends GetView<SearchPhoneTelecomController> {
  final ModelListMobile datas;
  final ModelListMobile phoneDatas;
  final String searchPhoneText;
  const SearchPhoneCaseTelecomListArea({
    required this.datas,
    required this.phoneDatas,
    required this.searchPhoneText,
    super.key});

  @override
  Widget build(BuildContext context) {
    return
      datas.list.isEmpty
        ? Center(
          child: CustomTextWidget(text: '선택한 통신사에서 제공하는 단말기가 없습니다.',  fontWeight: FontWeight.w500,)
          )
        : phoneDatas.list.isEmpty && searchPhoneText == ''
              ?  Center(
                  child: CustomTextWidget(text: '선택한 통신사에서 제공하는 단말기가 없습니다.',  fontWeight: FontWeight.w500,)
                  // GestureDetector(
                  //   onTap: (){
                  //     controller.reFreshButton();
                  //   }, child: Icon(
                  //       Icons.refresh, size: WidgetSize(context).sizedBox48, color: Style.yellow,
                  //     ),
                  //   ),
                  )
              :  MediaQuery.of(context).viewInsets.bottom > 0
                    ? SizedBox(
                         width: WidgetSize(context).widthCommon,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                  child: Center(
                                      child: SearchPhoneAlertText(
                                          text: '기기 검색중입니다.')
                                  )
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).viewInsets.bottom,
                              )
                            ],
                            ),
                         )

                    : phoneDatas.list.isNotEmpty
                            ? TelecomList(
                                  phoneDatas: phoneDatas,
                              )
                            :  Center(
                                  child: SearchPhoneAlertText(text: '검색된 기기가 없어요.')
                                );
  }
}
