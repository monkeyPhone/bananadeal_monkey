import 'dart:developer';
import 'package:banana_deal_by_monkeycompany/banana/src/bootstrap/bloc/app_bloc_observer.dart';
import 'package:banana_deal_by_monkeycompany/banana/ui/app/view/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void initialization() async {
  await Future.delayed(const Duration(seconds: 1));
  FlutterNativeSplash.remove();
}

void bootstrap() {

  Bloc.observer = AppBlocObserver();
  if(!kIsWeb){
    initialization();
  }

  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  // final RouterRepository routerRepository = RouterRepositoryRes();
  // final HiveAuthProviderRes hiveAuthProviderRes = HiveAuthProviderRes();
  // final BananaRouterCubit routingCubit =
  // BananaRouterCubit(
  //     routerRepository: routerRepository,
  //     hiveAuthProviderRes: hiveAuthProviderRes
  // );

  // debugPaintSizeEnabled = true;
  runApp(
      const App(

        //   hiveAuthProviderRes: hiveAuthProviderRes,
        //   routingCubit: routingCubit,
        //   // routingCubit: routingCubit,
        //   // resizeCubit: resizeCubit,
      )
  );

}