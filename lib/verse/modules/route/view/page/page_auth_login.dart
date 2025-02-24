import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_route.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/auth/auth/view/auth_view.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

GoRoute authLogin = GoRoute(
    path: pageAuthLogin,
    builder: (BuildContext context, GoRouterState state){
      return const AuthView(isCanPop: false,);
    }
);