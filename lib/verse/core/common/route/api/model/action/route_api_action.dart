import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/provider/dio_provider.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/route/api/model/helper/loading_animation_widget.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/route/api/model/helper/route_helper_dialog.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/browser/snack/browser_snackbar.dart';
import 'package:flutter/material.dart';

import '../../../../../util/string/const_string.dart';

class RouteApiAction{
  const RouteApiAction();

  void connectCheck({
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


  Route createRoute({required Widget routerWidget, required WidgetDirectionEnum direction, bool? isIntro}) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          LoadingAnimationWidget(
            buildWidget: routerWidget,
            isIntro: isIntro,
          ),
      transitionsBuilder: (
          context,
          animation,
          secondaryAnimation,
          child) {
        Offset begin = switch(direction){
          WidgetDirectionEnum.left => const Offset(1.0, 0.0),
          WidgetDirectionEnum.right => const Offset(-1.0, 0.0),
          WidgetDirectionEnum.top => const Offset(0.0, -1.0),
          WidgetDirectionEnum.bottom => const Offset(0.0, 1.0)
        };
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  Future<bool> _getInternetStatus({required DioProvider dioProvider}) async{
    final bool isConnect = await dioProvider.getInternetStatus();
    return isConnect;
  }

}