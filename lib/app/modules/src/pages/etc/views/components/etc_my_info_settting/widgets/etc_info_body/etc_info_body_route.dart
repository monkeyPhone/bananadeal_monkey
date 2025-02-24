import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_my_info_settting/widgets/etc_info_body/etc_info_body_route_position.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../../css/size.dart';
import 'etc_info_body_current/etc_info_my_current.dart';

class EtcInfoBodyRoute extends StatelessWidget {
  const EtcInfoBodyRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        EtcInfoMyCurrent(),
        Positioned(
            top: WidgetSize(context).sizedBox119,
            right: WidgetSize(context).sizedBox16,
            child: EtcInfoBodyRoutePosition()
        )
      ],
    );
  }
}
