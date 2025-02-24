import 'dart:io';

import 'package:banana_deal_by_monkeycompany/app/app_outs/widgets/layout/layout_ratio_58.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/home/views/widgets/home_components/home_rank/helpers/home_rank_row/home_rank_row.dart';
import 'package:flutter/material.dart';
import 'helpers/home_rank_top/home_rank_top.dart';

class HomeRank extends StatelessWidget {
  const HomeRank({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Platform.isIOS
          ? SizedBox()
          : LayoutRatio(
              child: Column(
                children: [
                  HomeRankTop(),
                  HomeRankRow()
                ],
              ),
            );

  }
}
