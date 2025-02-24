import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/views/pages/search_phone/components/common/search_phone_future.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../controllers/search_phone_controllers/search_phone_telecom_controller.dart';
import 'body/search_phone_case_telecom_body.dart';


class SearchPhoneCaseTelecom extends GetView<SearchPhoneTelecomController> {
  final int agencyNum;
  const SearchPhoneCaseTelecom({
    required this.agencyNum,
    super.key});

  @override
  Widget build(BuildContext context) {
    return SearchPhoneFuture(
        future: controller.getModelTelecom(agencyNum),
        successWidget: SearchPhoneCaseTelecomBody(),
    );
  }
}
