import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/api/rank/model/action/rank_action.dart';
import 'package:banana_deal_by_monkeycompany/package/api/rank/model/rank_api_impl.dart';
import 'package:banana_deal_by_monkeycompany/package/data/rank_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/rank_total/src/rank_total_repository_impl.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/method/api/model/data/canvas_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/rank_all/const/rank_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/rank_all/manager/rank_all_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/rank_all/state/bloc/banana_rank_all/banana_rank_all_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/rank_all/view/builder/rank_body_ui_mixin.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/bd_ripple_sort_button.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/canvas/bd_canvas.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_custom_pad.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_layout_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RankAllView extends StatelessWidget {
  final void Function(RankVO rank) listClickCallback;
  final List<RankVO> rankAll;
  final List<RankVO> rankPremium;
  final List<RankVO> rankHigh;
  final List<RankVO> rankNormal;
  final List<RankVO> rankWorthy;
  const RankAllView({super.key,
    required this.listClickCallback,
    required this.rankAll,
    required this.rankPremium,
    required this.rankHigh,
    required this.rankNormal,
    required this.rankWorthy,
  });

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider<RankApiImpl>(
              create: (BuildContext context) =>
                  const RankApiImpl(
                      action: RankAction()
                  )
          ),
          RepositoryProvider<RankTotalRepositoryImpl>(
              create: (BuildContext context) => RankTotalRepositoryImpl(
                  rankApi: context.read<RankApiImpl>(),
                  dio: context.read<VerseConfig>().dio
              )
          ),
          RepositoryProvider<RankAllManager>(
            create: (BuildContext context) => RankAllManager(
              listClickCallback: listClickCallback,
            ),
          )
        ],
        child: MultiBlocProvider(
            providers: [
              BlocProvider<BananaRankAllBloc>(
                create: (BuildContext context) =>  BananaRankAllBloc(
                    repository: context.read<RankTotalRepositoryImpl>()
                )..add(GetAllRank(
                  rankAll: rankAll,
                  rankPremium: rankPremium,
                  rankHigh: rankHigh,
                  rankNormal: rankNormal,
                  rankWorthy: rankWorthy
                 )
                ),
              ),
            ],
            child: const _Canvas()
        )
    );
  }
}


class _Canvas extends StatelessWidget {
  const _Canvas();

  @override
  Widget build(BuildContext context) {
    return const BdCanvas(
      canvasEnum: CanvasEnum.basic,
      appbar: ('휴대폰 인기순위', null, null, null),
      body: _Body(),
      navNullAble: true,
    );
  }
}


class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        _Category(),
        _BodyList()
      ],
    );
  }
}


class _Category extends StatelessWidget {

  const _Category();

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;

    return  BdLayoutPadding(
      padding: PaddingEnum.category,
      child: SizedBox(
          width: size.widthCommon,
          child:  Row(
            children: [
              const _ChangeListButton(),
              const BdCustomPad(padEnum: PadEnum.width16),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: BlocSelector<BananaRankAllBloc, BananaRankAllState, RankEnum>(
                    selector: (state) => state.rankEnum,
                    builder: (context, rankEnum)=> Row(
                      children: List.generate(RankEnum.values.length,
                              (index) => Stack(
                            children: [
                              BdRippleSortButton(
                                  size: size,
                                  text: switch(RankEnum.values[index]){
                                    RankEnum.all => '전체',
                                    RankEnum.premium => '프리미엄형',
                                    RankEnum.high => '고급형',
                                    RankEnum.normal => '보급형',
                                    RankEnum.worthy => '실속형',
                                  },
                                  margin: EdgeInsets.only(right: size.sized8grid),
                                  padding: EdgeInsets.symmetric(vertical: size.sized8grid, horizontal: size.sized12grid),
                                  isSort: rankEnum == RankEnum.values[index],
                                  onTap: (){
                                    context.read<RankAllManager>().changeCategoryOnTap(
                                        rankEnum: RankEnum.values[index],
                                        context: context
                                    );
                                  }
                              ),
                            ],
                          )
                      ),
                    ),
                  ),
                ),
              ),

            ],
          ),
      ),
    );
  }
}



class _ChangeListButton extends StatelessWidget {
  const _ChangeListButton();

  @override
  Widget build(BuildContext context) {

    return  BlocSelector<BananaRankAllBloc, BananaRankAllState, int>(
        selector: (state) => state.isList,
        builder: (context, isList) =>
            BdRippleSortButton(
                size: context.read<VerseConfig>().size,
                sortEnum: SortEnum.fix,
                padding: EdgeInsets.symmetric(vertical: context.read<VerseConfig>().size.sized8grid, horizontal: context.read<VerseConfig>().size.sized12grid),
                text: isList == 0 ? '리스트' : '트레이',
                isSort: true,
                onTap: (){
                  context.read<RankAllManager>().changeList(context);
                }
            )
    );
  }
}


class _BodyList extends StatelessWidget {
  const _BodyList();

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: RankBodyUiMixin(),
    );
  }

}
