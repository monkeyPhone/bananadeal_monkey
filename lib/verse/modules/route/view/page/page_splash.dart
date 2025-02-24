import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/route/src/route_repository_impl.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/splash/src/splash_repository_impl.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_route.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/onboarding/splash/manager/helper/splash_manager_helper.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/onboarding/splash/manager/splash_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/onboarding/splash/state/bloc/banana_appversion/banana_appversion_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/onboarding/splash/view/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

GoRoute splash = GoRoute(
    path: pageSplash,
    builder: (BuildContext context, GoRouterState state){
      return MultiRepositoryProvider(
          providers: [
            RepositoryProvider<SplashRepositoryImpl>(
              create: (BuildContext context) => SplashRepositoryImpl(
                  api: context.read<RouteRepositoryImpl>().checkVersionApi,
                  dio: context.read<VerseConfig>().dio
              ),
            ),
            RepositoryProvider<SplashManager>(
                create: (BuildContext context) => const SplashManager(
                  helper: SplashManagerHelper(),
                )
            )
          ],
          child: BlocProvider<BananaAppversionBloc>(
              create: (BuildContext context) =>
              BananaAppversionBloc(
                  repository: context.read<SplashRepositoryImpl>()
              )..add(const VersionFetched()),
              child: const SplashView()
          )
      );

    }
);