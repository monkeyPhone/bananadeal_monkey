import 'package:banana_deal_by_monkeycompany/app/modules/naver_maps/pages/naver_marker/widgets/helper/body/bottom_view/naver_map_bottom_text.dart';
import 'package:flutter/material.dart';
import '../../../../../../../../css/size.dart';
import '../../../../../../../../css/style.dart';


class NaverMapBottomView extends StatelessWidget {
  const NaverMapBottomView({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(WidgetSize(context).sizedBox16),
      color: Style.white,
      child: NaverMapBottomText(),
    );
  }

}
