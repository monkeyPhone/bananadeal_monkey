import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/api/monkey/plan/model/action/plan_action.dart';
import 'package:banana_deal_by_monkeycompany/package/api/monkey/plan/model/plan_api_impl.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/monkey/plan/src/plan_repository_impl.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/method/api/model/data/canvas_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/rate_list/manager/rate_list_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/rate_list/state/bloc/banana_rate_list_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/rate_list/view/widgets/body/rate_list_body_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple_appbar_icon/ripple_appbar_icon_button.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/canvas/bd_canvas.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_custom_pad.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/loading/spin/bd_loading_spin.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/text/bd_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RateListView extends StatelessWidget {
  final BuildContext routerContext;
  final String psIdx;
  final String tkIdx;
  const RateListView({super.key,
    required this.routerContext,
    required this.psIdx,
    required this.tkIdx,
  });

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider<PlanApiImpl>(
            create: (BuildContext context) => const PlanApiImpl(
                action: PlanAction()
            ),
          ),

          RepositoryProvider<PlanRepositoryImpl>(
            create: (BuildContext context) => PlanRepositoryImpl(
              api: context.read<PlanApiImpl>(),
              monkeyUrl: context.read<VerseConfig>().url.monkeyUrl,
              dio: context.read<VerseConfig>().dio,

            ),
          ),
          RepositoryProvider<RateListManager>(
              create: (BuildContext context) =>
                  RateListManager(
                    routerContext: routerContext,
                    psIdx: psIdx,
                    tkIdx: tkIdx, repository: context.read<PlanRepositoryImpl>(),
                  )
          )
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider<BananaRateListBloc>(
                create: (BuildContext context) =>
                BananaRateListBloc(
                   repository:  context.read<PlanRepositoryImpl>()
                )..add(InitRateList((psIdx, tkIdx)))
            ),
          ],
          child: const _Canvas(),
        )
    );
  }
}


class _Canvas extends StatelessWidget {
  const _Canvas();

  @override
  Widget build(BuildContext context) {
    return  BlocSelector<BananaRateListBloc, BananaRateListState, StatusEnum>(
        selector: (state) => state.statusEnum,
        builder: (context, status) =>
            BdCanvas(
              canvasEnum: CanvasEnum.basic,
              appbar: ('요금제 선택하기', null, null,
              status == StatusEnum.initial
                  ? const SizedBox()
                  : const _SearchButton(),
              ),
              body: Column(
                children: [
                  const BdCustomPad(padEnum: PadEnum.heightQuarter),
                  status == StatusEnum.initial
                      ? const _Initial()
                      : status == StatusEnum.success
                      ? const _Success()
                      : const _Error(),
                ],
              ),
              navNullAble: true,
            )
    );

  }
}



class _SearchButton extends StatelessWidget {
  const _SearchButton();

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return BlocBuilder<BananaRateListBloc, BananaRateListState>(
        builder: (context, state) =>
            RippleIconOnButton(
                size: size,
                onTap: () {
                  List<String> keyword = [];
                  if(state.rateDto.isNotEmpty){
                    List<String> keyword1 = state.rateDto
                        .map((item) => item.pPlanName!
                    ).toList();
                    keyword.addAll(keyword1);
                  }
                  context.read<RateListManager>().gotoRateListSearchView(
                      context: context,
                      keyword: keyword,
                      readContext: context,
                  );
                },
                padding: EdgeInsets.all(size.sizedBox11),
                icon: Icons.search
            )
    );
  }
}


class _Initial extends StatelessWidget {
  const _Initial();

  @override
  Widget build(BuildContext context) {
    return const Expanded(
        child: BdLoadingSpin()
    );
  }
}


class _Error extends StatelessWidget {
  const _Error();

  @override
  Widget build(BuildContext context) {
    return const Expanded(
        child: BdTextWidget(
          text: '잠시 후 다시 시도해주세요.',
        ));
  }
}


class _Success extends StatefulWidget {
  const _Success();

  @override
  State<_Success> createState() => _SuccessState();
}

class _SuccessState extends State<_Success> {

  late ScrollController _controller;

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
    return Expanded(
        child: RateListBodyView(controller: _controller,)
    );
  }
}
