import 'package:banana_deal_by_monkeycompany/verse/core/common/cache/singleton/noti_cache_singleton.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/fcm/model/action/fcm_action.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/fcm/model/data/noti_entity.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/fcm/model/data/noti_vo.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/fcm/model/helper/fcm_helper.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:async';
import 'dart:developer';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_noti.dart' as ConstNoti;

class FcmSingleton {
  static final FcmSingleton instance = FcmSingleton._internal();
  factory FcmSingleton() => instance;
  FcmSingleton._internal();

  static late final StreamSubscription<RemoteMessage> _firebaseForeGround;

  static final FcmHelper managerNotiHelper = FcmHelper(action: FcmAction(notiCache: NotiCacheSingleton()));
  // static final ManagerNotiDto _dto = ManagerNotiDto();

  static final StreamController<NotiVO> didReceiveLocalNotificationStream =
  StreamController<NotiVO>.broadcast();


  static void fcmForeGround() async{
    _firebaseForeGround =
        FirebaseMessaging.onMessage.listen((RemoteMessage message) {
          // showNotification(message);
          log('whiteColor');
          managerNotiHelper.saveCache(message).then((value) => didReceiveLocalNotificationStream.add(
              NotiVO(
                id: 0,
                title: message.data['title'] ?? '',
                msg: message.data['msg'] ?? '',
                img: message.data['img'] ?? '',
                type: message.data['type'] ?? '',
                room: message.data['room'] ?? '',
                name: message.data['name'] ?? '',
                send: message.data['send'] ?? '',
                payload: '',
              )
           )
          );
          // await showNotification(message);

        });
  }

  static late FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;
  static late AndroidNotificationChannel _channel;
  static bool _isFlutterLocalNotificationsInitialized = false;


  @pragma('vm:entry-point')
  static void _notificationTapBackground(NotificationResponse notificationResponse) async{
    managerNotiHelper.clickTap(notificationResponse.payload!);
// ignore: avoid_print
    // switch (notificationResponse.notificationResponseType) {
    //   case NotificationResponseType.selectedNotification:
    //     selectNotificationStream.add(notificationResponse.payload);
    //     break;
    //   case NotificationResponseType.selectedNotificationAction:
    //     selectNotificationStream.add(notificationResponse.payload);
    //     break;
    // }
    if (kDebugMode) {
      print('notification(${notificationResponse.id}) action tapped: '
          '${notificationResponse.actionId} with'
          ' payload: ${notificationResponse.payload}');
    }
    if (notificationResponse.input?.isNotEmpty ?? false) {
// ignore: avoid_print
      if (kDebugMode) {
        print(
            'notification action tapped with input: ${notificationResponse.input}');
        print(
            'notification action tapped with input: ${notificationResponse.payload}');
        print(
            'notification action tapped with input: ${notificationResponse.actionId}');
      }

    }
  }


  static Future<void> setupFlutterNotifications() async {
    if (_isFlutterLocalNotificationsInitialized) {
      return;
    }
    _channel = const AndroidNotificationChannel(
      'BananaDealGroup', // id
      '일반 알림', // title
      description:
      'This channel is used for important notifications.', // description
      importance: Importance.high,
    );



    _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    final NotificationAppLaunchDetails? notificationAppLaunchDetails =
    await _flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();

    if (notificationAppLaunchDetails?.didNotificationLaunchApp ?? false) {

      String selectedNotificationPayload = notificationAppLaunchDetails!.notificationResponse?.payload ?? '';
      managerNotiHelper.clickTap(selectedNotificationPayload);
      NotiEntity pay = NotiEntity(idx: 1, title: '',
          msg:'', profile: '', type:  selectedNotificationPayload, name: '',
          time: '', img:  '', send: '' , isRead: false
      );
      await managerNotiHelper.action.notiCache.saveNoti(key: ConstNoti.notiRouteBack, value: notiEntityToJson(pay));

    }



    await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(_channel);

    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');

    const DarwinInitializationSettings initializationSettingsDarwin =
    DarwinInitializationSettings(
        requestAlertPermission: false,
        requestSoundPermission: false,
        requestBadgePermission: false,
        requestProvisionalPermission: true,
        requestCriticalPermission: false,
        defaultPresentAlert: false,
        defaultPresentSound: false,
        defaultPresentBadge: false,
        defaultPresentBanner: false,
        defaultPresentList: false,
        notificationCategories: <DarwinNotificationCategory>[]
    );

    const InitializationSettings initializationSettings =
    InitializationSettings(android: initializationSettingsAndroid, iOS: initializationSettingsDarwin);

    await _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,

      onDidReceiveNotificationResponse: (NotificationResponse notificationResponse) async{
        String selectedNotificationPayload = notificationAppLaunchDetails!.notificationResponse?.payload ?? '';
        managerNotiHelper.clickTap(selectedNotificationPayload);

      },
      onDidReceiveBackgroundNotificationResponse: _notificationTapBackground,
    );

  }


  static Future<void> showNotification(RemoteMessage message) async{
    int pushId = switch(message.data['type']){
      'banana_push' => 1,
      _ => 2
    };

    AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
      _channel.id, _channel.name, channelDescription: _channel.description,
      importance: Importance.high, priority: Priority.high,
    );

    DarwinNotificationDetails iOSPlatformChannelSpecificsGroup = const DarwinNotificationDetails(
        interruptionLevel: InterruptionLevel.active
    );

    NotificationDetails platformChannelSpecifics =
    NotificationDetails( android: androidPlatformChannelSpecifics, iOS: iOSPlatformChannelSpecificsGroup );

    try{
      managerNotiHelper.saveCache(message).then((value) async =>
      message.data['send'] == 'none'
          ? null
          : message.data['type'] == 'banana_push'
          ? message.data['msg'].contains('채팅을 종료했어요')
          ? null
          : await _flutterLocalNotificationsPlugin.show(
        pushId, '${message.data['title']}',
        message.data['msg'].contains('{"imageUrl":"UPLOAD') || message.data['msg'].contains('UPLOAD/IMAGES')
            ? '사진을 보냈습니다.'
            : '${message.data['msg']}', platformChannelSpecifics, payload: '${message.data['type']},${message.data['room']}',)

          : message.data['type'] == 'banana_deal'
          ? await _flutterLocalNotificationsPlugin.show(
        pushId, '${message.data['title']}', '${message.data['msg']}', platformChannelSpecifics, payload: '${message.data['type']},${message.data['room']}',)
          : message.data['type'] == ''
          ? await _flutterLocalNotificationsPlugin.show(pushId, '${message.data['title']}', '${message.data['msg']}',
        platformChannelSpecifics, payload: '${message.data['type']},${message.data['profile']}',)
          : null
      );

    } catch(_){
      await _flutterLocalNotificationsPlugin.show(
        pushId, '${message.data['title']}', '${message.data['msg']}', platformChannelSpecifics,
        payload: '${message.data['type']},${message.data['profile']}',
      );
    }
  }


  static void close(){
    _firebaseForeGround.cancel();
    didReceiveLocalNotificationStream.close();
  }


}