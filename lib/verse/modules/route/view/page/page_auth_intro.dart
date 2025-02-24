import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/api/intro_image/model/intro_image_api_impl.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/intro/src/intro_repository_impl.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_route.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/auth/intro/manager/intro_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/auth/intro/state/bloc/banana_intro/banana_intro_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/auth/intro/view/intro_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

GoRoute authIntro = GoRoute(
    path: pageAuthIntro,
    builder: (BuildContext context, GoRouterState state){
      return MultiRepositoryProvider(
        providers: [
          RepositoryProvider<IntroImageApiImpl>(
              create: (BuildContext context) =>
                const IntroImageApiImpl()
          ),
          RepositoryProvider<IntroRepositoryImpl>(
              create: (BuildContext context) =>
                  IntroRepositoryImpl(
                      dio: context.read<VerseConfig>().dio,
                      api: context.read<IntroImageApiImpl>()
                  )
          ),
          RepositoryProvider<IntroManager>(
              create: (BuildContext context) =>
              const IntroManager()
          ),
        ],
        child: BlocProvider<BananaIntroBloc>(
          create: (BuildContext context)=>
          BananaIntroBloc(
              repository: context.read<IntroRepositoryImpl>()
          )..add(const BananaIntroImageFetched()),
          child: const IntroView(),
        ),
      );


      //   RepositoryProvider<BananaPermissionRepositoryRes>(
      //   create: (BuildContext context) => BananaPermissionRepositoryRes(),
      //   child: BlocProvider<BananaPermissionBloc>(
      //     create: (BuildContext context) =>
      //     BananaPermissionBloc(
      //         permissionRepository: context.read<BananaPermissionRepositoryRes>()
      //     )..add(const PermissionFetched()),
      //     child: const PermissionView(),
      //   ),
      // );
    }
);