import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../css/style.dart';
import '../../../../../../../../../../models/rank/rank_list.dart';
import '../../../../../../../../src_components/controllers/src_rank_controller.dart';
import 'home_rank_correct/home_rank_correct.dart';


class HomeRankRow extends StatelessWidget {
  const HomeRankRow({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<SrcRankController>(
        builder: (srcC) =>
            srcC.totalInfo.isEmpty ||
            srcC.totalInfo.last.psName == ''
                ? SizedBox(
                  width: WidgetSize(context).widthCommon,
                  height: WidgetSize(context).sizedBox120,
                  child: Center(child: CircularProgressIndicator(color: Style.progressBar,)))
                : HomeRankCorrect(
                    items: List<Rankinfo>.generate(srcC.totalInfo.length, (index) => srcC.totalInfo[index]).toList() ,
                   )
    );

  }
}
