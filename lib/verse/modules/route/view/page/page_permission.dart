import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/permission/src/helper/dialog/permission_dialog.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/permission/src/permission_repository_impl.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/route/src/route_repository_impl.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_route.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/onboarding/permission/manager/permission_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/onboarding/permission/state/bloc/banana_permission/banana_permission_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/onboarding/permission/view/permission_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

GoRoute permission = GoRoute(
    path: pagePermission,
    builder: (BuildContext context, GoRouterState state){
      return MultiRepositoryProvider(
        providers: [
          RepositoryProvider<PermissionRepositoryImpl>(
              create: (BuildContext context) =>
                  PermissionRepositoryImpl(
                      context: context,
                      dialog: const PermissionDialog(),
                      api: context.read<RouteRepositoryImpl>().permissionApi,
                      sdkVersion:  context.read<VerseConfig>().cache.mainCache.deviceEntity.sdkVersion,
                      mainPrefs: context.read<VerseConfig>().cache.mainCache.prefs,
                      deviceFunc: context.read<VerseConfig>().cache.mainCache.deviceFunc,
                      deviceEntity: context.read<VerseConfig>().cache.mainCache.deviceEntity
                  )
          ),
          RepositoryProvider<PermissionManager>(
            create: (BuildContext context) => const PermissionManager(),
          )
        ],
        child: BlocProvider<BananaPermissionBloc>(
            create: (BuildContext context)=>
            BananaPermissionBloc(
                repository: context.read<PermissionRepositoryImpl>()
            )..add(const PermissionFetched()),
            child: const PermissionView()
        ),
      );

    }
);