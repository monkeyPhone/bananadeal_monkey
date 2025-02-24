import 'package:banana_deal_by_monkeycompany/app/modules/src/src_components/controllers/src_noti_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../components/widget_components/ripple_button/ripple_shadow_icon_button.dart';
import '../../../../../../css/size.dart';
import '../../../../../../css/style.dart';

class AlertIconDetail extends GetView<SrcNotiController> {
  const AlertIconDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(right: WidgetSize(context).sizedBox18, left: WidgetSize(context).sizedBox18),
          child: RippleShadowIconButton(
            onTap: (){
              controller.alertButtonClick('in');
            },
            child: const Icon(Icons.notifications, color: Style.yellow,),
          ),


        ),
        Positioned(
            top: 0,
            right: WidgetSize(context).sizedBox13,
            child:  GetBuilder<SrcNotiController>(
                builder: (_) {
                  return controller.notiDeal.isNotEmpty || controller.notiEtc.isNotEmpty
                            ?  ((controller.notiDeal.length - controller.cacheNotiDeal.value) + (controller.notiEtc.length - controller.cacheNotiEtc.value)) > 0
                                  ?   Container(
                                        width: WidgetSize(context).sizedBox19,
                                        height: WidgetSize(context).sizedBox19,
                                        decoration: BoxDecoration(
                                          color: Style.red,
                                          borderRadius: BorderRadius.circular(WidgetSize(context).widthCommon),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '${(controller.notiDeal.length - controller.cacheNotiDeal.value) + (controller.notiEtc.length - controller.cacheNotiEtc.value)}',
                                            style: TextStyle(
                                                color: Style.white,
                                                fontWeight: FontWeight.w700,
                                                fontSize: WidgetSize(context).sizedBox10
                                            ),
                                          ),
                                        ),
                                      )
                                  : SizedBox()
                            : SizedBox();
                }
            )
        )
      ],
    );
  }
}
