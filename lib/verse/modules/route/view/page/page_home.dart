import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/api/deal/model/action/deal_action.dart';
import 'package:banana_deal_by_monkeycompany/package/api/deal/model/deal_api_impl.dart';
import 'package:banana_deal_by_monkeycompany/package/api/user_edit/model/action/user_edit_action.dart';
import 'package:banana_deal_by_monkeycompany/package/api/user_edit/model/user_edit_api_impl.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/broad/src/broad_repository_impl.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/cache/singleton/noti_cache_singleton.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/fcm/fcm_singleton.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/fcm/repository/fcm_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/fcm/state/cubit/banana_fcm/banana_fcm_cubit.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_route.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/broad/manager/broad_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/broad/state/bloc/banana_broad_deal/banana_broad_deal_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/broad/state/bloc/banana_broad_helper/banana_broad_helper_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/broad/state/bloc/banana_broad_nav/banana_broad_nav_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/broad/view/broad_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/route/state/cubit/banana_route/banana_route_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

GoRoute homeBrew = GoRoute(
    path: pageHome,
    builder: (BuildContext context, GoRouterState state){
      return MultiRepositoryProvider(
          providers: [
            RepositoryProvider<FcmRepositoryImpl>(
              create: (BuildContext context) => FcmRepositoryImpl(
                  helper: FcmSingleton.managerNotiHelper,
                  dio: context.read<VerseConfig>().dio,
                  snackBar: context.read<VerseConfig>().browser.snackBar,
                  notiCache: NotiCacheSingleton()
              ),
            ),
            RepositoryProvider<DealApiImpl>(
                create: (BuildContext context) =>
                    const DealApiImpl(action: DealAction())
            ),
            RepositoryProvider<UserEditApiImpl>(
                create: (BuildContext context) =>
                const UserEditApiImpl(action: UserEditAction())
            ),
            RepositoryProvider<BroadRepositoryImpl>(
              create: (BuildContext context) => BroadRepositoryImpl(
                  dealApi: context.read<DealApiImpl>(),
                  userEditApi: context.read<UserEditApiImpl>(),
                  dio: context.read<VerseConfig>().dio,
                  mIdx: context.read<BananaRouteCubit>().state.userVO.mIdx
              ),
            ),
            RepositoryProvider<BroadManager>(
              create: (BuildContext context) => const BroadManager(),
            ),
          ],
          child: MultiBlocProvider(
            providers: [
              BlocProvider<BananaFcmCubit>(
                create: (BuildContext context) =>
                    BananaFcmCubit(
                      mainContext: context,
                        repository: context.read<FcmRepositoryImpl>(),
                    ),
              ),
              BlocProvider<BananaBroadNavBloc>(
                create: (BuildContext context) =>
                    BananaBroadNavBloc(
                      route: context.read<VerseConfig>().route
                    ),
              ),
              BlocProvider<BananaBroadDealBloc>(
                create: (BuildContext context) =>
                BananaBroadDealBloc(
                    repository: context.read<BroadRepositoryImpl>(),
                    tab: context.read<VerseConfig>().tab,
                    snackbar: context.read<VerseConfig>().browser.snackBar,
                    dialog: context.read<VerseConfig>().browser.dialog,
                )..add(const InitDealData()),
              ),
              BlocProvider<BananaBroadHelperBloc>(
                create: (BuildContext context) =>
                    BananaBroadHelperBloc(
                      repository: context.read<BroadRepositoryImpl>(),
                      route: context.read<VerseConfig>().route,
                      snackbar: context.read<VerseConfig>().browser.snackBar,
                      url: context.read<VerseConfig>().url,
                      tab: context.read<VerseConfig>().tab,

                    ),
              )
            ],
            child: const BroadView(),
          )
      );
    }
);