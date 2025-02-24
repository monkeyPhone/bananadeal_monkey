import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/components/home_banner_button.dart';
import 'package:banana_deal_by_monkeycompany/config/app_config.dart';
import 'package:flutter/material.dart';
import '../../../../../../../../css/size.dart';
import '../../../../../widgets/components/alert_page/alert_icon.dart';
import '../../../../../widgets/components/change_map_appbar_icon_button.dart';
import '../../../ios_alert_icon.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: WidgetSize(context).height60px,
      child: Padding(
        padding: EdgeInsets.only(right: WidgetSize(context).sizedBox16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                HomeBannerButton()
              ],
            ),
            Row(
              children: [
                // IosAlertIconView(),
                AlertIcon(),
                ChangeMapAppbarIconButton(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
