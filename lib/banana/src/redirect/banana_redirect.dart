import 'package:banana_deal_by_monkeycompany/banana/src/redirect/bloc/banana_redirect/banana_redirect_bloc.dart';
import 'package:banana_deal_by_monkeycompany/banana/src/redirect/page/page_init.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'const/const_redirect.dart';

final GoRouter bananaDealRouter = GoRouter(
  routes: [
    init,
    // permission,
    // splash,
    // authIntro,
    // authLogin,
    // // // pageAuth,
    // // // pageAuthPass,
    // userInfo,
    // userStop,
    // homeBrew
  ],
  redirect: bananaDealRouterRedirect,
);

GoRouterRedirect bananaDealRouterRedirect = (context, state) {
  final redirectBloc = context.watch<BananaRedirectBloc>();
  final redirectState = redirectBloc.state;
  final EnumRedirect redirect = redirectState.enumRedirect;

  final String router = switch(kIsWeb){
    true => switch(redirect){
      EnumRedirect.initial => pageInit,
      _ => pageInit
    },
    false => switch(redirect){
      EnumRedirect.initial => pageInit,
      _ => pageInit
    }
  };

  return router;
};