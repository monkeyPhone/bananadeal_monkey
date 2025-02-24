import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_button.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_notice/etc_notice_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../../../../components/widget_components/etc_components/container_row_widget.dart';
import '../../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../../css/style.dart';

class EtcNoticeMainScrollContainer extends GetView<EtcNoticeController> {
  final int index;
  final String title;
  final bool isEmptyList;
  final bool isWhere;
  const EtcNoticeMainScrollContainer({
    required this.index,
    required this.title,
    required this.isEmptyList,
    required this.isWhere,
    super.key});

  @override
  Widget build(BuildContext context) {
    return RippleDecorationButton(
        onTap: (){
          controller.listTapEvent(index);
        },
        padding: EdgeInsets.only(
            left: WidgetSize(context).sizedBox20, right: WidgetSize(context).sizedBox15
        ),
        width: WidgetSize(context).widthCommon,
        height: WidgetSize(context).sizedBox72,
        border: Border(
            top: BorderSide(
                width: index == 0 ? WidgetSize(context).sizedBox1 : 0,
                color: Style.greyDDDDDD
            ),
            bottom: BorderSide(
                width: WidgetSize(context).sizedBox1,
                color: Style.greyDDDDDD
            )
        ),
        widget: ContainerRowWidget(title: title, isEmptyList: isEmptyList, isWhere: isWhere,)
    );

  }
}
