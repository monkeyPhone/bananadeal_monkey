import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/api/estimate/model/action/estimate_action.dart';
import 'package:banana_deal_by_monkeycompany/package/api/estimate/model/estimate_api_impl.dart';
import 'package:banana_deal_by_monkeycompany/package/data/broad/my_deal_list_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/estimate/src/estimate_repository_imp.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/method/api/model/data/canvas_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/estimate/manager/estimate_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/estimate/state/bloc/banana_estimate/banana_estimate_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/estimate/state/bloc/banana_estimate_option/banana_estimate_option_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/estimate/view/widgets/body/list/estimate_body_list_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/estimate/view/widgets/body/sort_bar/estimate_body_sort_bar_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/estimate/view/widgets/body/status_bar/estimate_body_status_bar_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/neo/bd_neo_button.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/canvas/bd_canvas.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EstimateView extends StatelessWidget {
  final MyDealListVO myDeal;
  final BuildContext routerContext;
  const EstimateView({super.key,
    required this.myDeal,
    required this.routerContext,
  });

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider<EstimateApiImpl>(
              create: (BuildContext context) =>
                  const EstimateApiImpl(
                      action: EstimateAction(),
                )
          ),
          RepositoryProvider<EstimateRepositoryImpl>(
            create: (BuildContext context) => EstimateRepositoryImpl(
                api: context.read<EstimateApiImpl>(),
                dio: context.read<VerseConfig>().dio
            ),
          ),
          RepositoryProvider<EstimateManager>(
            create: (BuildContext context) => EstimateManager(
                myDeal: myDeal,
                routerContext: routerContext,
                sortName: ['할부원금 순','월 납부액 순','가까운 순']
            ),
          )
        ],
        child: MultiBlocProvider(
            providers: [
              BlocProvider<BananaEstimateOptionBloc>(
                create: (BuildContext context) => BananaEstimateOptionBloc(
                  repository: context.read<EstimateRepositoryImpl>()
                )..add(SetController(ScrollController()))..add(ConvertDStatus(diIdx: myDeal.diIdx, diStatus: myDeal.diStatus)),
              ),
              BlocProvider<BananaEstimateBloc>(
                create: (BuildContext context) => BananaEstimateBloc(
                  diIdx: myDeal.diIdx,
                  repository: context.read<EstimateRepositoryImpl>()
                )..add(const RisingEstimate(0)),
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
    return BdCanvas(
        canvasEnum: CanvasEnum.basic,
        appbar: (context.read<VerseConfig>().function.convertHopePhone(
          context.read<EstimateManager>().myDeal.diHopePhone
        ), null, null, null),
        body: const _Body(),
        navbarWidget: const _Nav(),
    );
  }
}


class _Nav extends StatelessWidget {
  const _Nav();

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return BlocSelector<BananaEstimateOptionBloc, BananaEstimateOptionState, String>(
      selector: (state) => state.dStatus,
      builder: (context, dStatus) =>
        switch(dStatus){
        '진행중' =>  BdNeoButton(
          size: size,
          height: size.sizedAppbar,
          fontSize: size.titleLittle,
          text: '종료하기',
          onPressed: () {
            context.read<EstimateManager>().endDeal(context);
          },
        ),
        _ => const SizedBox()
      }
    );
  }
}


class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        EstimateBodyStatusBarView(),
        EstimateBodySortBarView(),
        Expanded(
            child: EstimateBodyListView()
        )
      ],
    );
  }
}



