import 'package:banana_deal_by_monkeycompany/verse/core/common/route/api/provider/route_provider.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/route/manager/route_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/browser/dialog/browser_dialog.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/browser/snack/browser_snackbar.dart';
import 'package:flutter/material.dart';

abstract class CommonRouteRepository {
  const CommonRouteRepository();

  void appRouting(BuildContext context);
  void authRouting(BuildContext context);
  void logout({required BuildContext context, required int idx, required bool how});


  void closeDialog(BuildContext context);
  void closePage(BuildContext context);
  void closeApp();
  void closeAppDialog(BuildContext context);

  void updateInfo(BuildContext context);

  void createRoute({
    required BuildContext context,
    required Widget routerWidget,
    bool? isIntro,
    WidgetDirectionEnum? direction,
    bool? connectCheck,
    int? iosCheck,
    EventEnum? eventEnum,
  });

}

class CommonRouteRepositoryImpl implements CommonRouteRepository {
  final RouteProvider routeProvider;
  final RouteManager routeManager;
  final BrowserDialog dialog;
  final BrowserSnackbar snackbar;
  const CommonRouteRepositoryImpl({
    required this.routeProvider,
    required this.routeManager,
    required this.dialog,
    required this.snackbar,
  });

  @override
  void appRouting(BuildContext context) => routeManager.appRouting(context);

  @override
  void closeApp() => routeProvider.closeApp();

  @override
  void authRouting(BuildContext context) => routeManager.authRouting(context);
  @override
  void logout({required BuildContext context, required int idx, required bool how}) => routeManager.logout(context: context, idx: idx, how: how);

  @override
  void closeDialog(BuildContext context) => routeProvider.closeDialog(context: context);
  @override
  void closePage(BuildContext context) => routeProvider.closePage(context: context);
  @override
  void closeAppDialog(BuildContext context) => dialog.closeAppDialog(
      routerContext: context
  );

  @override
  void updateInfo(BuildContext context) => routeManager.updateInfo(context);

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


}