import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/rank_phone_page/helper/rank_phone_route.dart';
import 'package:flutter/material.dart';
import '../../../../../css/app_basic_component/bagic_canvas.dart';
import '../../../../../css/app_basic_component/basic_app_bar.dart';
import '../../../../../css/size.dart';
import '../../../../../css/style.dart';


class RankPhoneView extends StatelessWidget {
  const RankPhoneView(
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasicCanvas(
        canPop: true,
        body: Column(
          children: [
            BasicAppbar(title: Text(
              '휴대폰 인기 순위',
              style: TextStyle(
                  color: Style.blackWrite,
                  fontSize: WidgetSize(context).sizedBox24,
                  fontWeight: FontWeight.w700),
              ),
            ),
            Expanded(
              child: RankPhoneRoute()
            )
          ],
        ),
        bottomNavigationBar: Container(
            color: Style.white,
            child: Container(
                color: Style.white,
                child: const SafeArea(child: SizedBox())))
    );
  }

}
