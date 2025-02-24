import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_search_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../../css/size.dart';
import '../../../../../../../../../css/style.dart';



class SearchTopAppbar extends StatelessWidget {
  const SearchTopAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: WidgetSize(context).widthCommon,
      height: WidgetSize(context).height60px,
      child: Padding(
        padding: WidgetSize(context).paddingBodyWholeIcon,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '단말기 선택하기',
              style: TextStyle(
                  color: Style.blackWrite,
                  fontSize: WidgetSize(context).sizedBox24,
                  fontWeight: FontWeight.w700),
            ),
            RippleBackButton(
              onTap: () {
                Get.back();
              },
            )
          ],
        ),
      ),
    );
  }
}
