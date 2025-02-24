import 'package:banana_deal_by_monkeycompany/app/css/size.dart';
import 'package:banana_deal_by_monkeycompany/app/css/style.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/invite/view/invite/helper/invite_nav_bar/invite_nav_bar_children.dart';
import 'package:banana_deal_by_monkeycompany/app/routes/const_element.dart';
import 'package:flutter/material.dart';

class InviteNavBar extends StatelessWidget {
  final bool isClose;
  const InviteNavBar({super.key,
    required this.isClose,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Style.white,
      child: SafeArea(
        child: SizedBox(
            height: AppElement.defaultBottomPadding,
            child: Padding(
              padding: WidgetSize(context).paddingBodyWhole,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InviteNavBarChildren(
                    isClose: isClose,
                  )
                ],
              ),
            )),
      ),
    );
  }
}
