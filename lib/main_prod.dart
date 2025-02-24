import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'app/css/style.dart';
import 'app/routes/app_pages.dart';
import 'app/managers/fcm/fcm_manager.dart';
import 'config/app_config.dart';
import 'firebase_options.dart';
import 'package:timezone/data/latest.dart' as tz;


@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  tz.initializeTimeZones();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FcmManager.setupFlutterNotifications();
  await FcmManager.showNotification(message);
}


// @pragma('vm:entry-point')
// Future<void> _firebaseMessagingBackgroundHandlerIos(RemoteMessage message) async {
//   tz.initializeTimeZones();
//   if(message.data['send'] == 'none'){
//     await FcmCacheRepository.notiBackCache(message);
//   } else{
//     await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//     await FcmManager.setupFlutterNotifications();
//     await FcmCacheRepository.notiBackCache(message);
//   }
//   try{
//     if (kDebugMode) {
//       print('its fcm : => ${message.data['type']}');
//     }
//   } catch(e){
//     if (kDebugMode) {
//       print('$e');
//     }
//   }
// }

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FcmManager.setupFlutterNotifications();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  FcmManager.fcmForeGround();

  await NaverMapSdk.instance.initialize(clientId: 'ou1uss6e93');

  KakaoSdk.init(
      nativeAppKey: 'b6f82f18c7bb15be6fae6ea51e633516',
      javaScriptAppKey: '086d86e148422acece31fd96e0758c77'
  );

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          statusBarColor: Style.white,
          statusBarIconBrightness: Brightness.dark
      )
  );


  tz.initializeTimeZones();
  await GetStorage.init();

  AppConfig.create(
    domain: "release",
    port: "5000",
    mode: Flavor.prod,
  );

  runApp(
      GetMaterialApp(
        builder: (context, child) {
          return MediaQuery.withNoTextScaling(
              child: child!
          );
        },
        color: Style.crowdFlower,
        debugShowCheckedModeBanner: false,
        title: "바나나딜",
        initialRoute: Routes.AUTH,
        getPages: AppPages.routes,
        theme: ThemeData(
            useMaterial3: false,
            appBarTheme: const AppBarTheme(
              elevation: 0,
              toolbarHeight: 0,
              systemOverlayStyle: SystemUiOverlayStyle.dark,
              backgroundColor: Style.white,
              surfaceTintColor: Style.white,
            )
        ),
      )
  );
}