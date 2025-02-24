import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/controllers/search_phone_controllers/search_phone_telecom_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../../../../../components/widget_components/ripple_button/ripple_button.dart';
import '../../../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../../../css/style.dart';
import '../../../../../../../../../../../../models/deal/model_list_mobile_maker.dart';

class TelecomMakerListTapMenu extends GetView<SearchPhoneTelecomController> {
  final List<ModeListMobileMakerList> makerList;
  final int currentIndex;
  const TelecomMakerListTapMenu({
    required this.makerList,
    required this.currentIndex,
    super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: WidgetSize(context).widthCommon,
      height: WidgetSize(context).sizedBox40,
      child:
      makerList.isEmpty
      ?  Center(
          child: CircularProgressIndicator(
            color: Style.progressBar,
          ))
      : Padding(
        padding: WidgetSize(context).paddingBodyWhole,
        child: Row(
          children: List.generate(
              makerList.length,
                  (index) => Flexible(
                  flex: 1,
                  child: RippleDecorationButton(
                    onTap: () {
                      controller.onTapCompany(index);
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
                        width: WidgetSize(context).sizedBox1
                    ),
                    widget: Center(
                        child: Text(
                          makerList[index].mkName,
                          style: TextStyle(
                              fontSize: WidgetSize(context).sizedBox18,
                              fontWeight: FontWeight.w400,
                              color: currentIndex == index
                                  ? Style.brown
                                  : Style.blackWrite),
                        )
                    ),

                  )
                  )
          ),
        ),
      ),
    );
  }
}
