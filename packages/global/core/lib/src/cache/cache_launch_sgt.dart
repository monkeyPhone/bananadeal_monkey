import 'package:core/src/cache/cache_auth_sgt.dart';
import 'package:core/src/cache/cache_fcm_sgt.dart';
import 'package:core/src/cache/main/cache_main_sgt.dart';
import 'package:core/src/const/const_string.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as p;

class CacheLaunchSgt {
  static final CacheLaunchSgt instance = CacheLaunchSgt._internal();
  factory CacheLaunchSgt() => instance;
  CacheLaunchSgt._internal();



  static Future<void> setStart(bool? isRelease) async {
    try {
      final directory = await p.getApplicationDocumentsDirectory();
      Hive.init(directory.path);
    } catch(_){

    }

    await Hive.openBox(authBox);
    await Hive.openBox(fcmBox);
    // await Hive.openBox(chatBox);

    CacheAuthSgt.authBox = Hive.box(authBox);
    CacheFcmSgt.fcmBox = Hive.box(fcmBox);

    await CacheMainSgt.settings(isRelease);

  }

}