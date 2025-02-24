import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/data/rank_vo.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_label.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/broad/manager/broad_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/home/manager/home_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/home/state/bloc/banana_home_rank/banana_home_rank_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/home/view/widgets/rank/home_rank_tile_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/bd_ripple_button_basic.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/error/bd_refresh_button.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_layout_padding.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_layout_ratio_box.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/text/bd_text_widget.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/ui/bd_ui_ratio_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeRankView extends StatelessWidget {
  const HomeRankView({super.key});

  @override
  Widget build(BuildContext context) {
    return const BdLayoutRatioBox(
      child: _RankList(),
    );
  }
}


class _RankList extends StatelessWidget {
  const _RankList();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<BananaHomeRankBloc, BananaHomeRankState, StatusEnum>(
      selector: (state) => state.status,
      builder: (context, state) =>
      switch(state){
        StatusEnum.initial || StatusEnum.loading  => const BdUiRatioLoading(),
        StatusEnum.success => const _Success(),
        _ => const _Error()
      },
    );
  }
}



class _Error extends StatelessWidget {
  const _Error();

  @override
  Widget build(BuildContext context) {
    return BdRefreshButton(
        onTap: (){
          context.read<HomeManager>().homeRankRefresh(context);
    });
  }
}


class _Success extends StatelessWidget {
  const _Success();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _Title(),
        Expanded(
          child: BlocSelector<BananaHomeRankBloc, BananaHomeRankState, List<RankVO>>(
              selector: (state) => state.rankAll,
              builder: (context, rankList) =>
                  ListView.builder(
                      physics: const ClampingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: rankList.length,
                      padding: EdgeInsets.only(
                          left: context.read<VerseConfig>().size.sized16grid,
                          bottom: context.read<VerseConfig>().size.sized16grid
                      ),
                      itemBuilder: (context, index) =>
                          HomeRankTileView(
                              rank: rankList[index],
                              size: context.read<VerseConfig>().size,
                              index: index
                          )
                  ),
          ),
        ),
      ],
    );
  }
}

class _Title extends StatelessWidget {
  const _Title();

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return BdLayoutPadding(
        padding: PaddingEnum.home,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const BdTextWidget(
              text: '휴대폰 인기순위',
              textStyle: bodyBold,
            ),
            BdRippleButtonBasic(
                onTap: (){
                  context.read<BroadManager>().gotoRankAllView(context);
                },
                padding: EdgeInsets.all(size.sizedBox3),
                child: const BdTextWidget(
                  text: '전체보기',
                  textStyle: subGrey,
                )
            )
          ],
        )
    )
    ;
  }
}
