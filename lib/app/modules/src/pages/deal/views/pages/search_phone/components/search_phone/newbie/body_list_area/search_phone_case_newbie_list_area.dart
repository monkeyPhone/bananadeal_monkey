import 'package:banana_deal_by_monkeycompany/app/css/style.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/controllers/search_phone_controllers/search_phone_spec_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/views/pages/search_phone/components/search_phone/newbie/body_list_area/newbie_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../../../../components/text_class/text_class.dart';
import '../../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../../models/deal/model_list_phone_spec.dart';

class SearchPhoneCaseNewbieListArea extends GetView<SearchPhoneSpecController> {
  final ModelListPhoneSpec currentDatas;
  final ModelListPhoneSpec showDatas;
  final String searchPhoneText;
  const SearchPhoneCaseNewbieListArea({
    required this.currentDatas,
    required this.showDatas,
    required this.searchPhoneText,
    super.key});

  @override
  Widget build(BuildContext context) {
    return
      currentDatas.list.isEmpty
        ? Center(child: CircularProgressIndicator(
            color: Style.progressBar,
          ))
        : showDatas.list.isEmpty && searchPhoneText == ''
              ?  Center(child: CircularProgressIndicator(
                    color: Style.progressBar,
                  ))
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

                    : showDatas.list.isNotEmpty
                            ? NewbieList(
                                  showDatas: showDatas,
                              )
                            :  Center(
                                  child: SearchPhoneAlertText(text: '검색된 기기가 없어요.')
                                );
  }
}
