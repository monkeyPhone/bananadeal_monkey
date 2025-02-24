
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_route.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/route/state/cubit/banana_route/banana_route_cubit.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/route/view/page/page_auth_intro.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/route/view/page/page_auth_login.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/route/view/page/page_home.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/route/view/page/page_init.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/route/view/page/page_permission.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/route/view/page/page_splash.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/route/view/page/page_user_info.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/route/view/page/page_user_stop.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final GoRouter bananaDealRouter = GoRouter(
  routes: [
    init,
    permission,
    splash,
    authIntro,
    authLogin,
    // // pageAuth,
    // // pageAuthPass,
    userInfo,
    userStop,
    homeBrew
  ],
  redirect: bananaDealRouterRedirect,
);


GoRouterRedirect bananaDealRouterRedirect = (context, state) {
  final redirectCubit = context.watch<BananaRouteCubit>();
  final redirectState = redirectCubit.state;
  final RouterEnum routerEnum = redirectState.appRouter;

  final String router = switch(kIsWeb){
    true => switch(routerEnum){
      RouterEnum.pagePermission => pageAuthIntro,
      RouterEnum.pageSplash => pageAuthIntro,
      RouterEnum.pagAuthIntro =>  pageAuthIntro,
      RouterEnum.pageAuthLogin =>  pageAuthLogin,
      RouterEnum.userInfo => pageUserInfo,
      RouterEnum.userStop => pageUserStop,
      RouterEnum.loginSuccess => pageHome,
      _ => pageInit
    },
    false => switch(routerEnum){
      RouterEnum.pagePermission => pagePermission,
      RouterEnum.pageSplash => pageSplash,
      RouterEnum.pagAuthIntro =>  pageAuthIntro,
      RouterEnum.pageAuthLogin =>  pageAuthLogin,
      RouterEnum.userInfo => pageUserInfo,
      RouterEnum.userStop => pageUserStop,
      RouterEnum.loginSuccess => pageHome,
      _ => pageInit
    }
  };

  return router;
};