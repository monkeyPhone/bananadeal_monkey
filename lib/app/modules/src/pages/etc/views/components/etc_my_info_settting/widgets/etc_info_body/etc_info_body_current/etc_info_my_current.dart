import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_my_info_settting/widgets/etc_info_body/etc_info_body_current/etc_info_body_current_src_info/etc_info_body_current_src_info.dart';
import 'package:flutter/material.dart';
import '../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../css/style.dart';

class EtcInfoMyCurrent extends StatelessWidget {
  const EtcInfoMyCurrent({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Style.white,
      width: WidgetSize(context).widthCommon,
      child: Column(
        children: [
          Expanded(
              child: EtcInfoBodyCurrentSrcInfo()
          ),

        ],
      ),
    );
  }
}
