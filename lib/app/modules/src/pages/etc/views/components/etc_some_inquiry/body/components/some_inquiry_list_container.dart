
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_some_inquiry/etc_some_inquiry_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../../components/widget_components/etc_components/container_row_widget.dart';
import '../../../../../../../../../css/size.dart';
import '../../../../../../../../../css/style.dart';

class SomeInquiryListContianer extends GetView<EtcSomeInquiryController> {
  final int index;
  final String title;
  final bool isEmptyList;
  final bool isWhere;
  const SomeInquiryListContianer({
    required this.index,
    required this.title,
    required this.isEmptyList,
    required this.isWhere,
    super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        controller.listTapEvent(index);
      },
      child: Container(
        padding: EdgeInsets.only(
            left: WidgetSize(context).sizedBox16, right: WidgetSize(context).sizedBox16
        ),
        width: WidgetSize(context).widthCommon,
        height: WidgetSize(context).sizedBox72,
        decoration: BoxDecoration(
            color: Style.white,
            border: Border(
                top: BorderSide(
                    width: index == 0 ? WidgetSize(context).sizedBox1 : 0,
                    color: Style.greyDDDDDD
                ),
                bottom: BorderSide(
                    width: WidgetSize(context).sizedBox1,
                    color: Style.greyDDDDDD
                )
            )
        ),
        child: ContainerRowWidget(title: title, isEmptyList: isEmptyList, isWhere: isWhere,)
      ),
    );
  }
}
