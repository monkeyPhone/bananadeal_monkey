import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/controllers/search_phone_controllers/search_phone_spec_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common/search_phone_future.dart';
import 'body/search_phone_case_newbie_body.dart';


class SearchPhoneCaseNewBie extends GetView<SearchPhoneSpecController> {
  final int routeCase;
  final String agency;
  final int agencyNum;
  const SearchPhoneCaseNewBie({
    required this.routeCase,
    required this.agency,
    required this.agencyNum,
    super.key});

  @override
  Widget build(BuildContext context) {
    return SearchPhoneFuture(
      future: controller.getMaker(),
      successWidget: SearchPhoneFuture(
        future: controller.getFirstSpec(),
        successWidget: SearchPhoneCaseNewBieBody(),
      ),
    );
  }
}
