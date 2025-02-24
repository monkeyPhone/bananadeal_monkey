import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/rank_phone_page/rank_phone_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../css/size.dart';
import '../../../../../../../css/style.dart';
import '../../../../../../../models/rank/rank_list.dart';

class RankIndexStackListInkWell extends GetView<RankPhoneController> {
  final Rankinfo rank;
  const RankIndexStackListInkWell({
    required this.rank,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Style.yellow,
        borderRadius:
        BorderRadius.circular(
            WidgetSize(context).widthCommon),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius:  BorderRadius.circular(
              WidgetSize(context).widthCommon),
          onTap: controller.inkwellClick(
              context: context,
              phoneName: rank.psName, phoneIdx: rank.psIdx, phoneModel: rank.psModel, phoneImg: rank.piPath),
          child: Container(
            color: Colors.transparent,
            padding:
            EdgeInsets.symmetric(
                horizontal:
                WidgetSize(context).sizedBox26,
                vertical:
                WidgetSize(context).sizedBox6_5),

            child: Text(
              '딜 만들기',
              style: TextStyle(
                  fontWeight:
                  FontWeight.w400,
                  fontSize:
                  WidgetSize(context).sizedBox12,
                  color: Style.brown),
            ),
          ),
        ),
      ),
    );
  }
}
