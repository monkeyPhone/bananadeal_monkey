import 'package:banana_deal_by_monkeycompany/verse/bootstrap/route/bloc/banana_route_bloc/banana_route_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/bootstrap/route/const_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

// final GoRouter bananaDealRouter = GoRouter(
//   routes: [
//     init,
//     permission,
//     splash,
//     authIntro,
//     authLogin,
//     // // pageAuth,
//     // // pageAuthPass,
//     userInfo,
//     userStop,
//     homeBrew
//   ],
//   redirect: bananaDealRouterRedirect,
// );




GoRouterRedirect bananaDealRouterRedirect = (context, state) {
  final redirectBloc = context.watch<BananaRouteBloc>();
  final redirectState = redirectBloc.state;
  final RouterEnum routerEnum = redirectState.appRouter;

  final String router = switch(kIsWeb){
    true => switch(routerEnum){
      RouterEnum.pagePermission => pageAuthIntro,
      RouterEnum.pageSplash => pageAuthIntro,
      RouterEnum.pagAuthIntro =>  pageAuthIntro,
      RouterEnum.userInfo => pageUserInfo,
      RouterEnum.userStop => pageUserStop,
      RouterEnum.home => pageHome,
      _ => pageInit
    },
    false => switch(routerEnum){
      RouterEnum.pagePermission => pagePermission,
      RouterEnum.pageSplash => pageSplash,
      RouterEnum.pagAuthIntro =>  pageAuthIntro,
      RouterEnum.userInfo => pageUserInfo,
      RouterEnum.userStop => pageUserStop,
      RouterEnum.home => pageHome,
      _ => pageInit
    }
  };

  return router;
};