import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/store/controllers/store_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../../css/style.dart';
import 'appbar_button_list.dart';


class StoreAppbarSortButton extends GetView<StoreController> {
  final int rong;
  final List buttonName;
  final int currentButton;
  const StoreAppbarSortButton({
    required this.rong,
    required this.buttonName,
    required this.currentButton,
    super.key});

  @override
  Widget build(BuildContext context) {
    return rong == 0
        ?
    Padding(
      padding: EdgeInsets.only(left: WidgetSize(context).sizedBox16),
      child: SizedBox(
        width: WidgetSize(context).widthCommon,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(buttonName.length, (index) =>
                AppBarButtonList(
                    colorBackground: index == currentButton ? Style.yellow : Style.white,
                    colorBorder: index == currentButton ? Style.yellow : Style.greyAAAAAA,
                    colorText: index == currentButton ? Style.brown: Style.greyAAAAAA,
                    text: buttonName[index],
                    onPressed: () async{
                      controller.focus.unfocus();
                      await controller.clickSortBar(index);
                    }
                )
            ).toList(),
          ),
        ),
      ),
    )
        :
    const SizedBox();
  }
}
