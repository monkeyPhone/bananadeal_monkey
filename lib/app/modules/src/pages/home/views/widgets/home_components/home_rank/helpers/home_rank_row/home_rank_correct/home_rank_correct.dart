import 'package:banana_deal_by_monkeycompany/app/css/size.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/src_components/controllers/src_rank_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../../../../models/rank/rank_list.dart';
import 'home_rank_row_list.dart';

class HomeRankCorrect extends GetView<SrcRankController> {
  final List<Rankinfo> items;
  const HomeRankCorrect({
    required this.items,
    super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: WidgetSize(context).widthCommon,
      height: WidgetSize(context).imageWidth,
      child: ListView.builder(
          physics: ClampingScrollPhysics(),
          padding: EdgeInsets.only(left: WidgetSize(context).sizedBox8),
          scrollDirection: Axis.horizontal,
          controller: controller.scrollController,
          itemCount: items.length,
          itemBuilder:(BuildContext context, int index){
            return  HomeRankRowList(
              item: items[index]
            );
          }
      ),
    );
  }
}
