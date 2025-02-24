import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_button.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/etc_widgets/etc_list_as.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/etc_widgets/etc_list_my_info.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/etc_widgets/etc_pause_row.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/etc_widgets/etc_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../css/size.dart';
import '../../../../../../css/style.dart';
import '../../../../src_components/controllers/src_info_controller.dart';
import '../../controllers/etc_controller.dart';

class EtcObxValueMainBanState extends GetView<EtcController> {
  const EtcObxValueMainBanState({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      controller: controller.sController,
      child: Column(
        children: [
          EtcListMyInfo(),
          EtcListAs(),
          Container(
            color: Style.white,
            width: WidgetSize(context).widthCommon,
            padding: EdgeInsets.all(
                WidgetSize(context).sizedBox16
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                EtcPauseRow(text1: '닉네임:', text2: SrcInfoController.to.infoM.value.mName,),
                EtcPauseRow(text1: '정지상태:', text2: SrcInfoController.to.infoM.value.mIsUsed, color: Colors.red),
                EtcPauseRow(text1: '정지사유:', text2: SrcInfoController.to.infoM.value.mPauseReason,),
                EtcPauseRow(
                  text1: '정지기간: ',
                  text2: '${SrcInfoController.to.infoM.value.mPauseDuration}',
                ),
                SizedBox(
                  height: WidgetSize(context).sizedBox8,
                ),
                RippleDecorationButton(
                    onTap: () async{
                      await controller.etcBanCall();
                    },
                    padding: EdgeInsets.all(WidgetSize(context).sizedBox5),
                    widget: EtcPauseText2(text: '새로고침', color: Colors.blue )
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
