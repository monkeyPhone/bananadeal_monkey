import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_button.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/components/estimate/estimate_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../css/size.dart';
import '../../../../../../../../css/style.dart';

class EstimateSortBar extends GetView<EstimatedController> {
  final bool isEmpty;
  final int estimateCurrentSort;
  final List<String> estimateSortName;
  const EstimateSortBar({
    required this.isEmpty,
    required this.estimateCurrentSort,
    required this.estimateSortName,
    super.key});

  @override
  Widget build(BuildContext context) {
    return
    Padding(
      padding: EdgeInsets.only(
          left: WidgetSize(context).sizedBox16,
          right: WidgetSize(context).sizedBox16,
          bottom: WidgetSize(context).sizedBox20,
          top: WidgetSize(context).sizedBox12),
      child: isEmpty
          ? SizedBox()
          :Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(3,
                (index) =>
                    RippleDecorationButton(
                        onTap: () async{
                          await controller.clickSortButton(index);
                          },
                        color: estimateCurrentSort == index
                            ? Style.yellow
                            : Style.white,
                        width: WidgetSize(context).sizedBox126,
                        height: WidgetSize(context).sizedBox30,
                        border: Border.all(
                            color: estimateCurrentSort == index
                                ? Style.yellow
                                : Style.greyAAAAAA,
                            width:WidgetSize(context).sizedBox1
                        ),
                        borderRadius: BorderRadius.circular(999),
                        widget:  Center(
                            child: Text( estimateSortName[index],
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: WidgetSize(context).sizedBox14,
                                  color: estimateCurrentSort == index
                                      ? Style.brown
                                      : Style.greyAAAAAA
                          ),
                        )
                    )
                )
        ),
      ),
    );
  }
}
