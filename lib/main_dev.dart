import 'dart:async';
import 'dart:io';
// import 'dart:io';
// import 'package:banana_deal_by_monkeycompany/verse/core/bootstrap/bootstrap.dart';
// import 'package:banana_deal_by_monkeycompany/verse/core/common/cache/singleton/main_cache_singleton.dart';
// import 'package:banana_deal_by_monkeycompany/verse/core/fcm/fcm_singleton.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:globals/globals.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'app/css/style.dart';
import 'app/routes/app_pages.dart';
import 'app/managers/fcm/fcm_manager.dart';
import 'banana/src/bootstrap/bootstrap.dart';
import 'config/app_config.dart';
import 'firebase_options.dart';
import 'package:timezone/data/latest.dart' as tz;




Future<void> main() async{
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await CacheLaunchSgt.setStart(false);

  await NaverMapSdk.instance.initialize(clientId: 'ou1uss6e93');

  KakaoSdk.init(
      nativeAppKey: 'b6f82f18c7bb15be6fae6ea51e633516',
      javaScriptAppKey: '086d86e148422acece31fd96e0758c77'
  );

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark
      )
  );

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  tz.initializeTimeZones();

  bootstrap();

}

// @pragma('vm:entry-point')
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   tz.initializeTimeZones();
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   await FcmManager.setupFlutterNotifications();
//   await FcmManager.showNotification(message);
// }
//
// Future<void> main() async{
//   WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
//
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//
//
//   FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
//   await FcmManager.setupFlutterNotifications();
//   FcmManager.fcmForeGround();
//
//   await NaverMapSdk.instance.initialize(clientId: 'ou1uss6e93');
//
//   KakaoSdk.init(
//       nativeAppKey: 'b6f82f18c7bb15be6fae6ea51e633516',
//       javaScriptAppKey: '086d86e148422acece31fd96e0758c77'
//   );
//
//   SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
//   SystemChrome.setSystemUIOverlayStyle(
//       const SystemUiOverlayStyle(
//           statusBarColor: Style.white,
//           statusBarIconBrightness: Brightness.dark
//       )
//   );
//
//   tz.initializeTimeZones();
//
//   await GetStorage.init();
//
//   AppConfig.create(
//     domain: "imsi",
//     port: "3000",
//     mode: Flavor.dev,
//   );
//
//   runApp(
//     GetMaterialApp(
//       builder: (context, child) {
//         return MediaQuery.withNoTextScaling(
//             child: child!
//         );
//       },
//       color: Style.crowdFlower,
//       debugShowCheckedModeBanner: false,
//       title: "바나나딜 테스트",
//       initialRoute: Routes.AUTH,
//       getPages: AppPages.routes,
//       theme: ThemeData(
//           useMaterial3: false,
//           appBarTheme: const AppBarTheme(
//             elevation: 0,
//             toolbarHeight: 0,
//             systemOverlayStyle: SystemUiOverlayStyle.dark,
//             backgroundColor: Style.white,
//             surfaceTintColor: Style.white,
//           )
//       ),
//     ),
//   );
//
//
// }
