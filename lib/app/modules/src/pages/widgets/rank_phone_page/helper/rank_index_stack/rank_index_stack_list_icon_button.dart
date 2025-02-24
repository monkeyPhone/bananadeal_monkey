import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/rank_phone_page/rank_phone_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../css/size.dart';
import '../../../../../../../css/style.dart';
import '../../../../../../../models/rank/rank_list.dart';

class RankIndexStackListIconButton extends GetView<RankPhoneController> {
  final List<Rankinfo> rank;
  final int index;
  const RankIndexStackListIconButton({
    required this.rank,
    required this.index,
    super.key});

  @override
  Widget build(BuildContext context) {
    return ObxValue(
            (bnt) => InkWell(
              borderRadius: BorderRadius.circular(999),
                onTap: (){
                  controller.searchClick(index, rank);
                }, child: Padding(
                  padding: EdgeInsets.all(WidgetSize(context).sizedBox2_5),
                  child: Icon(Icons.search, size: WidgetSize(context).sizedBox24, color: bnt.value == index ? Style.yellow :Style.greyWrite,),
                ))
        , controller.button);
  }
}
