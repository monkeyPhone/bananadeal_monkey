import 'package:banana_deal_by_monkeycompany/app/routes/api_url.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../../models/rank/rank_list.dart';
import '../../../../../../../../../src_components/controllers/src_route_controller.dart';
import 'home_rank_list.dart';



class HomeRankRowList extends StatelessWidget {
  final Rankinfo item;

  const HomeRankRowList({
    required this.item,
    super.key});

  @override
  Widget build(BuildContext context) {
    if (item.piPath == '') {
      return SizedBox();
    } else {
      if (item.piPath.isNotEmpty) {
        return HomeRankList(
          imageSrc: '${ApiConsole.monkeyImageUrl}${item.piPath}',
          idx : item.psIdx,
          description: item.psName,
          onPressed: () async {
            await SrcRouteController.to.rankDeal(
                context: context,
                phoneName: item.psName,
                phoneIdx: item.psIdx,
                phoneModel: item.psModel,
                phoneImg: item.piPath
            );
          },
          fontSzie: item.psName.length > 16
              ? WidgetSize(context).sizedBox12
              : WidgetSize(context).sizedBox14,
        );
      }
      else {
        return const SizedBox();
      }
    }
  }
}


