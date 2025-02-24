import 'package:banana_deal_by_monkeycompany/verse/bootstrap/route/bloc/banana_route_bloc/banana_route_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class RouteManager {
  const RouteManager();

  void appRouting(BuildContext context);

  void homeRouting(BuildContext context);

  void logout({required BuildContext context, required bool how});

  void updateInfo(BuildContext context);

}

class RouteManagerImpl implements RouteManager {
  const RouteManagerImpl();

  @override
  void appRouting(BuildContext context) => context.read<BananaRouteBloc>().add(const RouteAdsAction());

  @override
  void homeRouting(BuildContext context) => context.read<BananaRouteBloc>().add(const RouteHomeAction(token: ''));

  @override
  void logout({required BuildContext context, required bool how}) async =>
      context.read<BananaRouteBloc>().add(RouteLogoutAction(how: how));

  @override
  void updateInfo(BuildContext context) => context.read<BananaRouteBloc>().add(const RouteInfoUpdateAction());

}