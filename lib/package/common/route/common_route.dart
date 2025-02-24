import 'package:flutter/material.dart';

enum WidgetDirectionEnum {left, right, top, bottom}

abstract class CommonRoute {
  const CommonRoute();

  void appRouting(BuildContext context);
  void homeRouting(BuildContext context);
  void logout({required BuildContext context, required bool how});
  void updateInfo(BuildContext context);

  void closeDialog(BuildContext context);
  void closePage(BuildContext context);
  void closeApp();
  void closeAppDialog(BuildContext context);



  void createRoute({
    required BuildContext context,
    required Widget routerWidget,
    required bool isIntro,
    required WidgetDirectionEnum direction,
    // bool? connectCheck,
    required int iosCheck,
    // EventEnum? eventEnum,
  });


}