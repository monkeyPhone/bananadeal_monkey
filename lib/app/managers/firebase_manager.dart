// import 'dart:async';
// // import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
// class FirebaseManager{
//
//   @pragma('vm:entry-point')
//   static void notificationTapBackground(NotificationResponse notificationResponse) {
//     // ignore: avoid_print
//     if(kDebugMode){
//       print('notification(${notificationResponse.id}) action tapped: '
//           '${notificationResponse.actionId} with'
//           ' payload: ${notificationResponse.payload}');
//       if (notificationResponse.input?.isNotEmpty ?? false) {
//         // ignore: avoid_print
//         print(
//             'notification action tapped with input: ${notificationResponse.input}');
//         print(
//             'notification action tapped with input: ${notificationResponse.payload}');
//         print(
//             'notification action tapped with input: ${notificationResponse.actionId}');
//       }
//     }
//   }
//
//
//   // static fcmIosSetting() async{
//   //   FirebaseMessaging messaging = FirebaseMessaging.instance;
//   //
//   //   NotificationSettings settings = await messaging.requestPermission(
//   //     alert: true,
//   //     announcement: false,
//   //     badge: true,
//   //     carPlay: false,
//   //     criticalAlert: false,
//   //     provisional: false,
//   //     sound: true,
//   //   );
//   //
//   // }
//
//   // static Future<void> notiCache(RemoteMessage message) async{
//   //   await FcmCacheRepository.notiBackCache(message);
//   // }
//
//
// Future<void> notiBack() async{
//
//
//     AndroidNotificationChannel channel = const AndroidNotificationChannel(
//       'BananaDealGroup', // id
//       '일반 알림', // title
//       description:
//       'This channel is used for important notifications.', // description
//       importance: Importance.high,
//     );
//
//
//     // const String chanel_id = 'BananaDealGroup';
//     // const String groupKey = 'com.bananadealbymc.bananadeal_consumer_mc';
//     // const String groupChannelName = '일반 알림';
//     // const String groupChannelDescription = '푸시알림';
//     int pushId = switch(
//     message.data['type']){
//       'banana_push' => 1,
//       _ => 2
//     };
//
//     final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//     FlutterLocalNotificationsPlugin();
//
//     await flutterLocalNotificationsPlugin
//         .resolvePlatformSpecificImplementation<
//         AndroidFlutterLocalNotificationsPlugin>()
//         ?.createNotificationChannel(channel);
//
//     const AndroidInitializationSettings initializationSettingsAndroid =
//     AndroidInitializationSettings('@mipmap/ic_launcher');
//
//     // final List<DarwinNotificationCategory> darwinNotificationCategories =
//     // <DarwinNotificationCategory>[
//     //   DarwinNotificationCategory(
//     //     'BananaDealGroup',
//     //     actions: <DarwinNotificationAction>[
//     //       DarwinNotificationAction.text(
//     //         '일반 알림',
//     //         'Action 1',
//     //         buttonTitle: 'Send',
//     //         placeholder: 'Placeholder',
//     //       ),
//     //     ],
//     //   ),
//     // ];
//
//     final DarwinInitializationSettings initializationSettingsDarwin =
//     DarwinInitializationSettings(
//       requestAlertPermission: false,
//       requestBadgePermission: false,
//       requestSoundPermission: false,
//       // notificationCategories: darwinNotificationCategories,
//     );
//
//     final InitializationSettings initializationSettings =
//     InitializationSettings(android: initializationSettingsAndroid, iOS: initializationSettingsDarwin);
//
//     await flutterLocalNotificationsPlugin.initialize(initializationSettings,
//       onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
//     );
//
//
//
//     AndroidNotificationDetails androidPlatformChannelSpecifics =
//     AndroidNotificationDetails(
//         channel.id, channel.name, channelDescription: channel.description,
//         importance: Importance.max, priority: Priority.max,
//     );
//
//     DarwinNotificationDetails iOSPlatformChannelSpecificsGroup = DarwinNotificationDetails(threadIdentifier: channel.id);
//
//     NotificationDetails platformChannelSpecifics =
//     NotificationDetails( android: androidPlatformChannelSpecifics, iOS: iOSPlatformChannelSpecificsGroup );
//
//       // await flutterLocalNotificationsPlugin.show(
//       //   pushId, '${message.data['title']}', '${message.data['msg']}', platformChannelSpecifics,
//       //   payload: 'null',
//       // );
//
//     // try{
//     //   await FcmCacheRepository.notiBackCache(message);
//     //   AppPushStatus push = await PayRo.getPushStatus();
//     //   if(push.result.first.mAppPush == 'Y')
//     //   {
//     //     message.data['type'] == 'banana_push'
//     //         ? push.result.first.mChatPush == 'Y'
//     //         ? await flutterLocalNotificationsPlugin.show(
//     //       pushId, '${message.data['title']}', '${message.data['msg']}', platformChannelSpecifics,
//     //       payload: 'null',
//     //     )
//     //         : null
//     //         : message.data['type'] == 'banana_deal'
//     //         ? await flutterLocalNotificationsPlugin.show(
//     //       pushId, '${message.data['title']}', '${message.data['msg']}', platformChannelSpecifics,
//     //       payload: 'null',
//     //     )
//     //         :  push.result.first.mGwanggoPush == 'Y'
//     //         ? await flutterLocalNotificationsPlugin.show(
//     //       pushId, '${message.data['title']}', '${message.data['msg']}',
//     //       platformChannelSpecifics, payload: 'null',
//     //     )
//     //         : null;
//     //   }
//     // } catch(_){
//     //   await flutterLocalNotificationsPlugin.show(
//     //     pushId, '${message.data['title']}', '${message.data['msg']}', platformChannelSpecifics,
//     //     payload: 'null',
//     //   );
//     // }
//
//
//
//
//     // 그룹화 현재안씀
//     // List<ActiveNotification>? activeNotifications =
//     // await flutterLocalNotificationsPlugin
//     //     .resolvePlatformSpecificImplementation<
//     //     AndroidFlutterLocalNotificationsPlugin>()
//     //     ?.getActiveNotifications();
//     // if (activeNotifications!.length > 0) {
//     //   List<String> lines =
//     //   activeNotifications.map((e) => e.title.toString()).toList();
//     //
//     //   InboxStyleInformation inboxStyleInformation = InboxStyleInformation(
//     //       lines,
//     //       contentTitle: "${activeNotifications.length - 1} 메시지가 있습니다.",
//     //       summaryText: "${activeNotifications.length - 1} 메시지가 있습니다");
//     //
//     //
//     //   AndroidNotificationDetails androidPlatformChannelSpecificsGroup =
//     //   AndroidNotificationDetails(
//     //     chanel_id, groupChannelName, channelDescription: groupChannelDescription,
//     //     importance: Importance.max, priority: Priority.high,
//     //     styleInformation: inboxStyleInformation,
//     //     setAsGroupSummary: true,
//     //     groupKey: groupKey,
//     //   );
//     //   const DarwinNotificationDetails iOSPlatformChannelSpecificsGroup = DarwinNotificationDetails(threadIdentifier: chanel_id);
//     //
//     //   NotificationDetails groupNotificationDetailsPlatformSpefics =
//     //   NotificationDetails(android: androidPlatformChannelSpecificsGroup, iOS: iOSPlatformChannelSpecificsGroup);
//     //   await flutterLocalNotificationsPlugin.show(
//     //       0, '', '', groupNotificationDetailsPlatformSpefics);
//     // }
//
//
//   }
//
//
// }