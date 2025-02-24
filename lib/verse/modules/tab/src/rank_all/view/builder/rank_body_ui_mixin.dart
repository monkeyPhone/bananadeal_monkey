import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/data/rank_vo.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/rank_all/const/rank_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/rank_all/state/bloc/banana_rank_all/banana_rank_all_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/rank_all/view/widgets/body/grid/rank_all_body_grid_tile_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/rank_all/view/widgets/body/list/rank_all_body_list_tile_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/loading/spin/bd_loading_spin.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/ui/bd_ui_indexed_stack_animated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RankBodyUiMixin extends StatelessWidget {
  const RankBodyUiMixin({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<BananaRankAllBloc, BananaRankAllState, RankEnum>(
        selector: (state) => state.rankEnum,
        builder: (context, rank) =>
            BlocSelector<BananaRankAllBloc, BananaRankAllState, int>(
                selector: (state) => state.isList,
                builder: (context, isList) =>
                    BdUiIndexedStackAnimated(
                      index: isList,
                      children: [
                        _List(rankEnum: rank),
                        _Grid(rankEnum: rank)
                      ],
                    )
            )
    );
  }
}


class _List extends StatelessWidget {
  final RankEnum rankEnum;
  const _List({
    required this.rankEnum,
  });

  @override
  Widget build(BuildContext context) {
    return BdUiIndexedStackAnimated(
      index: rankEnum.index,
      children: const [
        _RankListView(rankEnum: RankEnum.all, isList: 0,),
        _RankListView(rankEnum: RankEnum.premium,  isList: 0,),
        _RankListView(rankEnum: RankEnum.high,  isList: 0,),
        _RankListView(rankEnum: RankEnum.normal,  isList: 0,),
        _RankListView(rankEnum: RankEnum.worthy,  isList: 0,),
      ],
    );
  }
}


class _Grid extends StatelessWidget {
  final RankEnum rankEnum;
  const _Grid({
    required this.rankEnum,
  });

  @override
  Widget build(BuildContext context) {
    return BdUiIndexedStackAnimated(
      index: rankEnum.index,
      children: const [
        _RankListView(rankEnum: RankEnum.all, isList: 1,),
        _RankListView(rankEnum: RankEnum.premium,  isList: 1,),
        _RankListView(rankEnum: RankEnum.high,  isList: 1,),
        _RankListView(rankEnum: RankEnum.normal,  isList: 1,),
        _RankListView(rankEnum: RankEnum.worthy,  isList: 1,),
      ],
    );
  }
}




class _RankListView extends StatelessWidget {
  final RankEnum rankEnum;
  final int isList;
  const _RankListView({
    required this.rankEnum,
    required this.isList,
  });

  @override
  Widget build(BuildContext context) {
    return BlocSelector<BananaRankAllBloc, BananaRankAllState, List<RankVO>>(
        selector: switch(rankEnum){
          RankEnum.all => (state) => state.rankAll,
          RankEnum.high => (state) => state.rankHigh,
          RankEnum.normal => (state) => state.rankNormal,
          RankEnum.premium => (state) => state.rankPremium,
          RankEnum.worthy => (state) => state.rankWorthy,
        },
        builder: (context, rankList) =>
            rankList.isEmpty
                ? const BdLoadingSpin()
                : switch(isList){
              0 => _RankList(
                rankList: rankList,
                isAll: rankEnum == RankEnum.all,
              ),
              _ => _RankGrid(
                rankList: rankList,
                isAll: rankEnum == RankEnum.all,
              ),
            },
    );
  }
}

class _RankList extends StatefulWidget {
  final List<RankVO> rankList;
  final bool isAll;
  const _RankList({required this.rankList, required this.isAll,});

  @override
  State<_RankList> createState() => _RankListState();
}

class _RankListState extends State<_RankList> {
  late final ScrollController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = ScrollController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return ListView.builder(
        physics: const ClampingScrollPhysics(),
        itemCount: widget.rankList.length,
        controller: _controller,
        padding: EdgeInsets.symmetric(
          horizontal: size.sized8grid,
        ),
        itemBuilder: (BuildContext context, int index) =>
            RankAllBodyListTileView(
              size: size,
              rank: widget.rankList[index],
              isAll: widget.isAll,
            )
    );
  }
}



class _RankGrid extends StatefulWidget {
  final List<RankVO> rankList;
  final bool isAll;
  const _RankGrid({required this.isAll, required this.rankList});

  @override
  State<_RankGrid> createState() => _RankGridState();
}

class _RankGridState extends State<_RankGrid> {
  late final ScrollController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = ScrollController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      controller: _controller,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: widget.rankList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 5/8,
          crossAxisCount: 2,
          crossAxisSpacing: size.sized16grid,
          mainAxisSpacing: size.sized16grid,
        ),
        padding: EdgeInsets.symmetric(horizontal: size.sized16grid),
        itemBuilder: (BuildContext context, int index) =>
            RankAllBodyGridTileView(
                element: widget.rankList[index],
                index: index,
                isAll: widget.isAll,
                size: size
            ),
      ),
    );
  }
}




