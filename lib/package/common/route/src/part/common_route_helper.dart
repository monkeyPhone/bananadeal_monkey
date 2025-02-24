import 'package:permission_handler/permission_handler.dart';

class CommonRouteHelper {
  const CommonRouteHelper();

  Future<PermissionStatus> _checkPermission(Permission permission) async {
    try{
      final PermissionStatus status = await permission.status;
      return status;
    }catch(_){
      return PermissionStatus.denied;
    }
  }

  void _connectCheck({
    required BrowserSnackbar snackbar,
    required BuildContext context,
    required Widget routerWidget,
    bool? isIntro,
    WidgetDirectionEnum? direction,
    bool? connectCheck,
    required RouteHelperDialog routeDialog,
    required DioProvider dioProvider
  }){
    connectCheck == null
        ? Navigator.of(context).push(
        createRoute(
            routerWidget: routerWidget,
            isIntro: isIntro,
            direction: direction ?? WidgetDirectionEnum.left
        )
    )
        : _getInternetStatus(dioProvider: dioProvider).then((value) =>
    context.mounted ?
    switch(value){
      true =>  Navigator.of(context).push(
          createRoute(
              routerWidget: routerWidget,
              isIntro: isIntro,
              direction: direction ?? WidgetDirectionEnum.left
          )
      ),
      false =>  routeDialog.showSnackBar(text: networkError, context: context, snackbar: snackbar)
    } : null

    );
  }

  

}