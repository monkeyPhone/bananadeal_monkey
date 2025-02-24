import 'package:banana_deal_by_monkeycompany/verse/core/common/cache/model/func/device_func.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/provider/dio_provider.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/route/api/model/action/route_api_action.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/route/api/model/func/route_api_func.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/route/api/model/helper/route_helper_dialog.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/browser/snack/browser_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

abstract class RouteProvider {
  const RouteProvider();

  void closePage({
    required BuildContext context,
  });

  void closeDialog({
    required BuildContext context,
  });

  void closeApp();

  void createRoute({
    required BrowserSnackbar snackbar,
    required BuildContext context,
    required Widget routerWidget,
    bool? isIntro,
    WidgetDirectionEnum? direction,
    bool? connectCheck,
    int? iosCheck,
  });

}

class RouteProviderImpl implements RouteProvider{
  final RouteApiFunc func;
  final RouteApiAction action;
  final DioProvider dioProvider;
  final DeviceFunc deviceFunc;
  final RouteHelperDialog helperDialog;

  const RouteProviderImpl({
    required this.func,
    required this.action,
    required this.deviceFunc,
    required this.dioProvider,
    required this.helperDialog
  });

  @override
  void closePage({
    required BuildContext context,
  }) => func.closePage(context: context);

  @override
  void closeDialog({
    required BuildContext context,
  }) => func.closeDialog(context: context);


  @override
  void closeApp() => func.closeApp();


  @override
  void createRoute({
    required BrowserSnackbar snackbar,
    required BuildContext context,
    required Widget routerWidget,
    bool? isIntro,
    WidgetDirectionEnum? direction,
    bool? connectCheck,
    int? iosCheck,
  }) async{
    switch(iosCheck){
      case 0:
        deviceFunc.checkPermission(Permission.location).then((location) {
          if(context.mounted){
            if(location == PermissionStatus.granted){
              action.connectCheck(
                snackbar: snackbar,
                isIntro: isIntro,
                context: context,
                routerWidget: routerWidget,
                direction: direction,connectCheck:
                connectCheck, routeDialog: helperDialog,
                dioProvider: dioProvider,


              );
            }
            else{
              helperDialog.customDialogPermission(routerContext: context, route: iosCheck!);
            }
          }
        });
      case 1:
        deviceFunc.checkPermission(Permission.photos).then((photos) {
          if(context.mounted){
            if(photos == PermissionStatus.granted || photos == PermissionStatus.limited){
              action.connectCheck(
                snackbar: snackbar,
                isIntro: isIntro,
                context: context, routerWidget: routerWidget, direction: direction,connectCheck: connectCheck,
                dioProvider: dioProvider, routeDialog: helperDialog
              );
            }
            else{
              helperDialog.customDialogPermission(routerContext: context, route: iosCheck!);
            }
          }
        });
      case 3:
        deviceFunc.checkPermission(Permission.notification).then((notification) {
          if(context.mounted){
            if(notification == PermissionStatus.granted ){
              action.connectCheck(
                snackbar: snackbar,
                isIntro: isIntro,
                context: context, routerWidget: routerWidget, direction: direction,connectCheck: connectCheck, routeDialog: helperDialog, dioProvider: dioProvider,);
            }
            else{
              helperDialog.customDialogPermission(routerContext: context, route: iosCheck!);
            }
          }
        });
      case null :
        action.connectCheck(
          snackbar: snackbar,
          isIntro: isIntro,
          context: context, routerWidget: routerWidget, direction: direction,connectCheck: connectCheck, routeDialog: helperDialog, dioProvider: dioProvider,);

    }

  }

}