import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../../css/size.dart';
import '../../../../../../../../../css/style.dart';

class RateAppBar extends StatelessWidget {
  const RateAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: WidgetSize(context).widthCommon,
      height: WidgetSize(context).height60px,
      child: Padding(
        padding: WidgetSize(context).paddingBodyWhole,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '요금제 선택하기',
              style: TextStyle(
                  color: Style.blackWrite,
                  fontSize: WidgetSize(context).sizedBox24,
                  fontWeight: FontWeight.w700),
            ),
            Material(
              color: Style.white,
              child: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(
                    Icons.close,
                    size: WidgetSize(context).sizedBox28,
                    color: Style.greyAAAAAA,
                  )
              ),
            )
          ],
        ),
      ),
    );
  }
}
