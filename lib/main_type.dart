// import 'dart:async';
// import 'package:banana_deal_by_monkeycompany/verse/core/bootstrap/bootstrap.dart';
// import 'package:banana_deal_by_monkeycompany/verse/core/common/cache/singleton/main_cache_singleton.dart';
// import 'package:banana_deal_by_monkeycompany/verse/core/fcm/fcm_singleton.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';
// import 'package:flutter_naver_map/flutter_naver_map.dart';
// import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
// import 'firebase_options.dart';
// import 'package:timezone/data/latest.dart' as tz;




// @pragma('vm:entry-point')
//  Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   tz.initializeTimeZones();
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   await MainCacheSingleton.setStart(false);
//   await FcmSingleton.setupFlutterNotifications();
//   await FcmSingleton.showNotification(message);
// }
//
// Future<void> main() async{
//   WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
//   await MainCacheSingleton.setStart(false);
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   await FcmSingleton.setupFlutterNotifications();
//   FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
//   FcmSingleton.fcmForeGround();
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
//           statusBarColor: Colors.transparent,
//           statusBarIconBrightness: Brightness.dark
//       )
//   );
//
//   FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
//
//   tz.initializeTimeZones();
//
//   bootstrap();
//
// }

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:globals/globals.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:timezone/data/latest.dart' as tz;

import 'banana/src/bootstrap/bootstrap.dart';


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


