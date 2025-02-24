import 'dart:async';
import 'package:banana_deal_by_monkeycompany/app/app_outs/function/app_outs_routing.dart';
import 'package:banana_deal_by_monkeycompany/app/components/future_loading_overlay.dart';
import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_search_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../css/style.dart';
import '../../../../../../../../routes/const/const_info.dart';
import '../../estimate_controller.dart';

class EstimateAppbarActions extends GetView<EstimatedController> {
  final String dealStatus;
  final int diIdx;
  const EstimateAppbarActions({
    required this.dealStatus,
    required this.diIdx,
    super.key});

  @override
  Widget build(BuildContext context) {
    return dealStatus == InfoString.dealStatusIng || dealStatus == '에러' ?
    ObxValue(
            (reFresh)=>
                RippleIconButton(
                    onTap: (){
                      Timer(const Duration(milliseconds: 50),
                              () async{
                                controller.changeBool(true);
                             await showFutureLoadingOverlay(
                                context: Get.context!,
                                expanded: true,
                                future: controller.refreshButton()
                            );
                            Timer(const Duration(milliseconds: 50),
                                    () {
                                  controller.changeBool(false);
                                  // Get.to(StoreSearchPage);
                                }
                            );
                          }
                      );
                    },
                    icon: Icons.refresh,
                    iconColor: !reFresh.value ? Style.blackWrite : Style.yellow
                ),controller.refreshClick)
        :

    RippleIconButton(
        onTap: (){
          controller.gotoDetail(context: context, diIdx: diIdx);
        },
        icon: Icons.phone_android_outlined,
        iconColor:  Style.blackWrite
    );
  }
}
