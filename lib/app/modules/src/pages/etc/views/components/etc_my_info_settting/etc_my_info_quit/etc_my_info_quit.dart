import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_my_info_settting/etc_my_info_quit/quit_column_widget/quit_column_widget.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_my_info_settting/etc_my_info_quit/quit_text_from.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../css/size.dart';
import '../../../../../../src_components/controllers/src_info_controller.dart';

class EtcMyInfoQuit extends StatelessWidget {
  const EtcMyInfoQuit({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: WidgetSize(context).paddingBodyWhole,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child:
              ListView(
                children: [
                  QuitColumnWidget(
                      text: '${SrcInfoController.to.infoM.value.mName}님, 잠깐만요! 계정을 삭제하면...',
                      caseNumber: 0,
                  ),
                  Stack(
                    children: [
                      QuitColumnWidget(
                          text: '${SrcInfoController.to.infoM.value.mName}님이 계정을 삭제하려는 이유가 궁금해요',
                          caseNumber: 1,
                      ),
                      Positioned(
                          bottom: 0,
                          child: QuitTextForm()
                      )
                    ],
                  )
                ],
              )
          ),
          SizedBox(
            height: WidgetSize(context).sizedBox8,
          ),
        ],
      ),
    );
  }
}
