import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../../../components/widget_components/ripple_button/ripple_text_button.dart';
import '../../../../../../../../../../css/size.dart';
import '../../../../../../../../src_components/controllers/src_rank_controller.dart';

class HomeRankTop extends GetView<SrcRankController> {
  const HomeRankTop({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: WidgetSize(context).height60px,
      width: WidgetSize(context).widthCommon,
      child: Padding(
        padding: EdgeInsets.only(left: WidgetSize(context).sizedBox16,
        right: WidgetSize(context).sizedBox6
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('휴대폰 인기순위', style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.black,
                fontSize: WidgetSize(context).sizedBox18
            ),),
            RippleTextButton(
              onTap: () {
                controller.clickAllView();
              },
              text: '전체보기',
            )
          ],
        ),
      ),
    );
  }
}
