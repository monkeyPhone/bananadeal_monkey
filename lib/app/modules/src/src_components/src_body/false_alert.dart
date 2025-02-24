import 'package:banana_deal_by_monkeycompany/app/components/common_dialog/common_widgets_2.dart';
import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../css/size.dart';
import '../../../../css/style.dart';
import '../controllers/src_info_controller.dart';

class FalseAlert extends GetView<SrcInfoController> {
  const FalseAlert({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return RippleDecorationButton(
        onTap: (){
          CommonWidgets2().customDialogPermission(routerContext: context, route: 5);
        },
        color: Style.white,
        borderRadius: BorderRadius.circular(999),
        height: WidgetSize(context).sizedBox45,
        width: WidgetSize(context).sizedBox45,
        padding: EdgeInsets.all(WidgetSize(context).sizedBox4),
        widget: FittedBox(
          fit: BoxFit.scaleDown,
          child: Padding(
            padding: EdgeInsets.all(WidgetSize(context).sizedBox5),
            child: Icon(CupertinoIcons.app_badge, color: Style.red, size: WidgetSize(context).sizedBox45,),
          ),
        )
    );

  }


}



