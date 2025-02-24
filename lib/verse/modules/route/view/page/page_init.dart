import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_route.dart';
import 'package:flutter/material.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/ads/view/ads_view.dart';
import 'package:go_router/go_router.dart';

GoRoute init = GoRoute(
    path: pageInit,
    builder: (BuildContext context, GoRouterState state){
      return const AdsView();
    }
);