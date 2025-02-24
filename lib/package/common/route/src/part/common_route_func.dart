import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CommonRouteFunc {
  const CommonRouteFunc();

  void closePage({
    required BuildContext context,
  }){
    Navigator.pop(context);
  }

  void closeDialog({
    required BuildContext context,
  }){
    Navigator.of(context, rootNavigator: true).pop();
  }

  void closeApp() async{
    Platform.isAndroid ? await SystemNavigator.pop()
        : Platform.isIOS
        ?  exit(0)
        : null;
  }

}