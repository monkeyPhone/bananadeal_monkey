import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/views/pages/search_rateplan/search_rateplan_status/search_rateplan_status.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../css/size.dart';
import '../../../../../../../css/style.dart';
import '../../../controllers/search_rateplan_controllers/search_rateplan_controller.dart';
import '../search_phone/components/common/search_phone_future.dart';


class SearchRateplan extends GetView<SearchRateplanController> {
  final int agencyNum;
  const SearchRateplan(
      {
      required this.agencyNum,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Style.greyD7D7D7,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Style.white,
        surfaceTintColor: Style.white,
        toolbarHeight: 0,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        color: Style.white,
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                  child: SearchRateplanStatus(),
              ),
              SizedBox(height: WidgetSize(context).extendsGap,)
            ],
          ),
        ),
      )
    );
  }
}

