import 'package:banana_deal_by_monkeycompany/banana/ui/ads/view/ads_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../verse/bootstrap/route/const_route.dart';

GoRoute init = GoRoute(
    path: pageInit,
    builder: (BuildContext context, GoRouterState state){
      return const AdsView();
    }
);