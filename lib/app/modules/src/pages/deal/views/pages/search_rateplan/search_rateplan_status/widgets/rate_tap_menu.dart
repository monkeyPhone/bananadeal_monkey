import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/controllers/search_rateplan_controllers/search_rateplan_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../../components/widget_components/ripple_button/ripple_button.dart';
import '../../../../../../../../../css/size.dart';
import '../../../../../../../../../css/style.dart';
import '../../../../../../../../../models/deal/rate_plan_name_list.dart';

class RateTapMenu extends GetView<SearchRateplanController> {
  final bool isMenu;
  final RatePlanNameList nameList;
  final int currentIndex;
  const RateTapMenu({
    super.key,
    required this.isMenu,
    required this.nameList,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: WidgetSize(context).widthCommon,
      height: WidgetSize(context).sizedBox45,
      child: switch(isMenu){
        true =>
            const SizedBox(),
        false =>
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: WidgetSize(context).sizedBox16),
                child: Row(
                  children: List.generate(
                      nameList.list.length,
                          (index) =>
                          RippleDecorationButton(
                              onTap: (){
                                controller.onTapComPany(index);
                              },
                              color: currentIndex == index
                                  ? Style.yellow
                                  : Style.greyF4F4F4,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(WidgetSize(context).sizedBox12),
                                topLeft: Radius.circular(WidgetSize(context).sizedBox12),
                              ),
                              border: Border.all(
                                  color: currentIndex == index
                                      ? Colors.transparent
                                      : Style.greyD7D7D7,
                                  width: WidgetSize(context).width00025
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: WidgetSize(context).sizedBox15
                              ),
                              widget: Center(
                                  child: Text(
                                    nameList.list[index].pgName,
                                    style: TextStyle(
                                        fontSize: WidgetSize(context).sizedBox18,
                                        fontWeight: FontWeight.w400,
                                        color: currentIndex == index
                                            ? Style.brown
                                            : Style.blackWrite
                                    ),
                                  )
                              )
                          )
                  ),
                ),
              ),
            )
      },
    );
  }
}
