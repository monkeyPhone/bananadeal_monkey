import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/api/banner/model/action/banner_action.dart';
import 'package:banana_deal_by_monkeycompany/package/api/banner/model/banner_api_impl.dart';
import 'package:banana_deal_by_monkeycompany/package/api/rank/model/action/rank_action.dart';
import 'package:banana_deal_by_monkeycompany/package/api/rank/model/rank_api_impl.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/home/src/home_repository_impl.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/home/manager/home_manager.dart';

import 'package:banana_deal_by_monkeycompany/verse/modules/brew/home/state/bloc/banana_home_banner/banana_home_banner_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/home/state/bloc/banana_home_rank/banana_home_rank_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/home/view/widgets/appbar/home_appbar_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/home/view/widgets/banner/home_banner_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/home/view/widgets/deal/home_deal_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/home/view/widgets/rank/home_rank_view.dart';

import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_custom_pad.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/loading/indicator/bd_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider<BannerApiImpl>(
              create: (BuildContext context) =>
                    const BannerApiImpl(action: BannerAction())
          ),
          RepositoryProvider<RankApiImpl>(
              create: (BuildContext context) =>
              const RankApiImpl(action: RankAction())
          ),

          RepositoryProvider<HomeRepositoryImpl>(
            create: (BuildContext context) => HomeRepositoryImpl(
                dio: context.read<VerseConfig>().dio,
                bannerApi: context.read<BannerApiImpl>(),
                rankApi: context.read<RankApiImpl>(),

            ),
          ),
          RepositoryProvider<HomeManager>(
            create: (BuildContext context) => const HomeManager(),
          ),
        ],
        child: MultiBlocProvider(
            providers: [
              BlocProvider<BananaHomeBannerBloc>(
                  create: (BuildContext context) =>
                  BananaHomeBannerBloc(
                      repository: context.read<HomeRepositoryImpl>()
                    )..add(const HomeBannerListFetch(isLoading: true)
                  )
              ),
              BlocProvider<BananaHomeRankBloc>(
                  create: (BuildContext context) =>
                  BananaHomeRankBloc(
                      tab: context.read<VerseConfig>().tab,
                      repository: context.read<HomeRepositoryImpl>()
                  )..add(const GetHomeRank(isLoading: true))
              )
            ],
            child: const _Content()
        )
    );
  }
}


class _Content extends StatefulWidget {
  const _Content();

  @override
  State<_Content> createState() => _ContentState();
}

class _ContentState extends State<_Content> {

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
    return Column(
      children: [
        const HomeAppbarView(),
        Expanded(
          child: BdRefreshIndicator(
            onRefresh: () async{
              context.read<HomeManager>().clickIndicator(context);
            },
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics().applyTo(const ClampingScrollPhysics()),
              controller: _controller,
              children: const [
                BdCustomPad(padEnum: PadEnum.height8),
                HomeBannerView(),
                BdCustomPad(padEnum: PadEnum.height8),
                HomeDealView(),
                _Rank(),
                BdCustomPad(padEnum: PadEnum.height8),
                // CustomPad(padEnum: PadEnum.height32),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _Rank extends StatelessWidget {
  const _Rank();

  @override
  Widget build(BuildContext context) {
    return context.read<VerseConfig>().cache.mainCache.isIos
        ? const SizedBox()
        : const HomeRankView();
  }
}
