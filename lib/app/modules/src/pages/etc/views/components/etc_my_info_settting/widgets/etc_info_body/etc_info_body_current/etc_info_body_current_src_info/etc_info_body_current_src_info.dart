import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_my_info_settting/widgets/etc_info_body/etc_info_body_current/etc_info_body_current_crop/etc_info_body_current_crop.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_my_info_settting/widgets/etc_info_body/etc_info_body_current/etc_info_body_current_nick_area/etc_info_body_current_nick_area.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_my_info_settting/widgets/etc_info_body/etc_info_body_current/etc_info_body_current_src_info/etc_info_body_current_src_info_detail.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/src_components/controllers/src_info_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../../../../css/size.dart';
import '../etc_info_body_current_password/etc_info_body_current_password_change.dart';

class EtcInfoBodyCurrentSrcInfo extends StatelessWidget {
  const EtcInfoBodyCurrentSrcInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SrcInfoController>(
      builder: (controller) =>
          SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height:WidgetSize(context).sizedBox14),
                Container(
                  constraints: BoxConstraints(
                      minWidth: WidgetSize(context).widthCommon,
                      maxWidth: WidgetSize(context).widthCommon,
                      minHeight: WidgetSize(context).sizedBox136,
                      maxHeight: double.infinity
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      EtcInfoBodyCurrentCrop(mPathImg: controller.infoM.value.mPathImg,),
                      SizedBox(height: WidgetSize(context).sizedBox30,),
                      EtcInfoBodyCurrentNickArea(
                        name: controller.infoM.value.mName,
                      ),
                      SizedBox(height: WidgetSize(context).sizedBox30,),
                    ],
                  ),
                ),
                SizedBox(height: WidgetSize(context).sizedBox34),
                EtcInfoBodyCurrentSrcInfoDetail(
                  infoM: controller.infoM.value,
                ),
                EtcInfoBodyCurrentPasswordChange(
                    infoM: controller.infoM.value)
              ],
            ),
          )
      ,
    );
  }
}
