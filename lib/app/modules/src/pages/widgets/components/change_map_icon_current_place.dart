import 'package:banana_deal_by_monkeycompany/app/modules/src/src_components/controllers/src_info_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../css/size.dart';

class ChangeMapIconCurrentPlace extends GetView<SrcInfoController> {
  const ChangeMapIconCurrentPlace({super.key});

  @override
  Widget build(BuildContext context) {
    return ObxValue(
            (mDong) =>
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    mDong.value,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: WidgetSize(context).sizedBox18
                    ),
                    textAlign: TextAlign.right,
                  ),
                )
      ,controller.mAddDong);
  }
}
