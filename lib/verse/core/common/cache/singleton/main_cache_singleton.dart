import 'package:banana_deal_by_monkeycompany/config/app_config.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/cache/model/data/device_entity.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/cache/model/func/device_func.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as p;
import 'package:shared_preferences/shared_preferences.dart';

class MainCacheSingleton {
  static final MainCacheSingleton instance = MainCacheSingleton._internal();
  factory MainCacheSingleton() => instance;
  MainCacheSingleton._internal();

  static late var authBox;
  static late var notiBox;
  static late var chatBox;
  static late final SharedPreferences prefs;
  static late final DeviceEntity deviceEntity;
  static bool isMode = false;

  static final DeviceFunc func = DeviceFunc();


  static void changeMode(){
    isMode =! isMode;
  }

  static Future<void> setStart(bool isRelease) async{

    try{
      final directory = await p.getApplicationDocumentsDirectory();
      Hive.init(directory.path);
    } catch(_){

    }
    await Hive.openBox('authBox');
    await Hive.openBox('notiBox');
    await Hive.openBox('chatBox');

    authBox = Hive.box('authBox');
    notiBox = Hive.box('notiBox');
    chatBox = Hive.box('chatBox');


    prefs = await SharedPreferences.getInstance();

    try{
      deviceEntity = DeviceEntity(
          platForm: await func.getPlatform(),
          isIos: func.isIos(),
          sdkVersion: await func.getSdkVersion(),
          isHeight60: await func.isHeight60()
      );
    } catch(_){
      deviceEntity = DeviceEntity(
          platForm: 'etc',
          isIos: false,
          sdkVersion: 500,
          isHeight60: false
      );
    }

    AppConfig.create(
      domain: isRelease ? "release" : "imsi",
      port: isRelease ? "5000" : "3000",
      mode: Flavor.type,
    );



  }


}
