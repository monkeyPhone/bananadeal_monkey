import 'package:banana_deal_by_monkeycompany/verse/modules/route/state/cubit/banana_route/banana_route_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class RouteManager {
  const RouteManager();

  void appRouting(BuildContext context);

  void authRouting(BuildContext context);

  void logout({required BuildContext context, required int idx, required bool how});

  void updateInfo(BuildContext context);

}

class RouteManagerImpl implements RouteManager {
  const RouteManagerImpl();

  @override
  void appRouting(BuildContext context) => context.read<BananaRouteCubit>().appRouting();

  @override
  void authRouting(BuildContext context) => context.read<BananaRouteCubit>().authRouting();

  @override
  void logout({required BuildContext context, required int idx, required bool how}) async => await context.read<BananaRouteCubit>().logout(idx: idx, how: how);

  @override
  void updateInfo(BuildContext context) => context.read<BananaRouteCubit>().memberInfoUpdate();

}