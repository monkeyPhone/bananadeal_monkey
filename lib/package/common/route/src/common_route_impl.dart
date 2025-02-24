import 'package:banana_deal_by_monkeycompany/package/common/route/common_route.dart';
import 'package:banana_deal_by_monkeycompany/package/common/route/src/part/common_route_func.dart';
import 'package:banana_deal_by_monkeycompany/verse/bootstrap/route/manager/route_manager.dart';
import 'package:flutter/material.dart';


class CommonRouteImpl implements CommonRoute {
  final RouteManager routeManager;
  const CommonRouteImpl({
    required this.routeManager,
  });

  final CommonRouteFunc _func = const CommonRouteFunc();

  @override
  void appRouting(BuildContext context) => routeManager.appRouting(context);

  @override
  void homeRouting(BuildContext context) => routeManager.homeRouting(context);

  @override
  void logout({required BuildContext context, required bool how}) => routeManager.logout(context: context, how: how);

  @override
  void updateInfo(BuildContext context) => routeManager.updateInfo(context);

  @override
  void closeApp() async => _func.closeApp();

  @override
  void closeDialog(BuildContext context) => _func.closeDialog(context: context);
  @override
  void closePage(BuildContext context) => _func.closePage(context: context);

  @override
  void createRoute({
    required BuildContext context,
    required Widget routerWidget,
    bool? isIntro,
    WidgetDirectionEnum? direction,
    bool? connectCheck,
    int? iosCheck,
    EventEnum? eventEnum,
  }) => routeProvider.createRoute(
      context: context,
      routerWidget: routerWidget, direction: direction, connectCheck: connectCheck, iosCheck: iosCheck, snackbar: snackbar, isIntro: isIntro);


  @override
  void closeAppDialog(BuildContext context) => dialog.closeAppDialog(
      routerContext: context
  );

}