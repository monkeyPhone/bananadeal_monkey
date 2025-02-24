import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/components/alert_page/widgets/helper/alert_app_bar/alert_app_bar_actions.dart';
import 'package:flutter/material.dart';
import '../../../../../../../../../css/app_basic_component/basic_app_bar.dart';
import '../../../../../../../../../css/size.dart';


class AlertAppbar extends StatelessWidget {
  const AlertAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return BasicAppbar(title:  Text('따끈따끈~ 알림이 도착했어요', style: TextStyle(fontWeight: FontWeight.w700, fontSize: WidgetSize(context).sizedBox20), maxLines: 1,
      overflow: TextOverflow.ellipsis,
    ),
      actions: AlertAppBarActions(),
    );
  }
}
