import 'package:banana_deal_by_monkeycompany/app/managers/fcm/func/fcm_repository.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/fcm/payload.dart';
import 'func/chache_payro.dart';
import 'func/fcm_cache_repository.dart';


// TODO: 푸시 메시지 관리

class FcmManager{
  static final FcmManager instance = FcmManager._internal();
  factory FcmManager() => instance;
  FcmManager._internal();

  static FcmRepository _fcmRepository = FcmRepository();


  // TODO: 푸시 메시지 - 포그라운드 ( 컨트롤러가 유지되는 상태이기 때문에, 아래 컨트롤러에서 변경이 가능하다. )

  static void fcmForeGround(){
    _fcmRepository.fcmForeGround();
  }


  static late FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;
  static late AndroidNotificationChannel _channel;
  static bool _isFlutterLocalNotificationsInitialized = false;

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
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      NotiPayLoad pay = await PayRo().groupRoute();
      pay = NotiPayLoad(idx: 1, title: '',
          msg:'', profile: '', type:  selectedNotificationPayload, name: '',
          time: '', img:  '', send: ''
      );

      await prefs.setString('groupRouteBack', notiPayLoadToJson(pay));
    }

    await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(_channel);

    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');


    final DarwinInitializationSettings initializationSettingsDarwin =
    DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
      // notificationCategories: darwinNotificationCategories,
    );

    final InitializationSettings initializationSettings =
    InitializationSettings(android: initializationSettingsAndroid, iOS: initializationSettingsDarwin);

    await _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,

      onDidReceiveNotificationResponse: (NotificationResponse notificationResponse) async{
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        NotiPayLoad pay = await PayRo().groupRoute();
        pay = NotiPayLoad(idx: 1, title: '',
            msg:'', profile: '', type: notificationResponse.payload!, name: '',
            time: '', img:  '', send: ''
        );

        await prefs.setString('groupRouteBack', notiPayLoadToJson(pay));

      },
      onDidReceiveBackgroundNotificationResponse: _notificationTapBackground,
    );

  }


  static Future<void> showNotification(RemoteMessage message) async{
    int pushId = switch(message.data['type']){
      'banana_deal' => 1,
      'banana_push' => 2,
      _ => message.hashCode
    };

    AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
      _channel.id, _channel.name, channelDescription: _channel.description,
      importance: Importance.high, priority: Priority.high,
    );

    DarwinNotificationDetails iOSPlatformChannelSpecificsGroup = DarwinNotificationDetails(
      interruptionLevel: InterruptionLevel.active
    );

    NotificationDetails platformChannelSpecifics =
    NotificationDetails( android: androidPlatformChannelSpecifics, iOS: iOSPlatformChannelSpecificsGroup );

    try{
      await FcmCacheRepository.notiBackCache(message);
      message.data['send'] == 'none'
          ? null
          : message.data['type'] == 'banana_push'
              ? message.data['msg'].contains('채팅을 종료했어요')
                ? null
                : await _flutterLocalNotificationsPlugin.show(
        pushId, '${message.data['title']}',
        message.data['msg'].contains('UPLOAD/IMAGES') ||  message.data['msg'].contains('{"imageUrl":"UPLOAD')
            ? '사진을 보냈습니다.'
            : '${message.data['msg']}', platformChannelSpecifics, payload: '${message.data['type']},${message.data['room']}',)

          : message.data['type'] == 'banana_deal'
          ? await _flutterLocalNotificationsPlugin.show(
        pushId, '${message.data['title']}', '${message.data['msg']}', platformChannelSpecifics, payload: '${message.data['type']},${message.data['room']},${message.data['title']}',)
          : message.data['type'] == ''
          ? await _flutterLocalNotificationsPlugin.show(pushId, '${message.data['title']}', '${message.data['msg']}',
        platformChannelSpecifics, payload: '${message.data['type']},${message.data['profile']}',)
          : null;
//TODO: 종료된 방으로 가게끔 코드 변경해줘야됨.
    } catch(_){
      message.data['send'] == 'none'
          ? null
          : message.data['type'] == 'banana_push'
          ? message.data['msg'].contains('채팅을 종료했어요')
          ? null
          : await _flutterLocalNotificationsPlugin.show(
        pushId, '${message.data['title']}',
        message.data['msg'].contains('UPLOAD/IMAGES') ||  message.data['msg'].contains('{"imageUrl":"UPLOAD')
            ? '사진을 보냈습니다.'
            : '${message.data['msg']}', platformChannelSpecifics, payload: '${message.data['type']},${message.data['room']}',)

          : message.data['type'] == 'banana_deal'
          ? await _flutterLocalNotificationsPlugin.show(
        pushId, '${message.data['title']}', '${message.data['msg']}', platformChannelSpecifics, payload: '${message.data['type']},${message.data['room']},${message.data['title']}',)
          : message.data['type'] == ''
          ? await _flutterLocalNotificationsPlugin.show(pushId, '${message.data['title']}', '${message.data['msg']}',
        platformChannelSpecifics, payload: '${message.data['type']},${message.data['profile']}',)
          : null;
    }
  }



  @pragma('vm:entry-point')
  static void _notificationTapBackground(NotificationResponse notificationResponse) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    NotiPayLoad pay = await PayRo().groupRoute();
    pay = NotiPayLoad(
        idx: 1, title: '',
        msg:'', profile: '', type: notificationResponse.payload!, name: '',
        time: '', img:  '', send: ''
    );

    await prefs.setString('groupRouteBack', notiPayLoadToJson(pay));
// ignore: avoid_print
    // switch (notificationResponse.notificationResponseType) {
    //   case NotificationResponseType.selectedNotification:
    //     selectNotificationStream.add(notificationResponse.payload);
    //     break;
    //   case NotificationResponseType.selectedNotificationAction:
    //     selectNotificationStream.add(notificationResponse.payload);
    //     break;
    // }
//     print('notification(${notificationResponse.id}) action tapped: '
//         '${notificationResponse.actionId} with'
//         ' payload: ${notificationResponse.payload}');
//     if (notificationResponse.input?.isNotEmpty ?? false) {
// // ignore: avoid_print
//       print(
//           'notification action tapped with input: ${notificationResponse.input}');
//       print(
//           'notification action tapped with input: ${notificationResponse.payload}');
//       print(
//           'notification action tapped with input: ${notificationResponse.actionId}');
//     }
  }


}



