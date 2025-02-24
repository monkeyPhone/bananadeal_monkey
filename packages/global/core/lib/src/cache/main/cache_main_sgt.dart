import 'package:core/src/cache/main/part/device_sgt_model.dart';
import 'package:core/src/cache/main/part/func.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:utils/utils.dart';

class CacheMainSgt {
  static final CacheMainSgt instance = CacheMainSgt._internal();
  factory CacheMainSgt() => instance;
  CacheMainSgt._internal();

  static late final SharedPreferences prefs;

  static late DeviceSgtModel dm;

  static late final String baseDomain;
  static late final String basePortHome;
  static late final String basePortChat;
  static late final Flavor baseMode;

  static void create({required String domain, required String portHome, required String portChat, required Flavor mode}) {
    baseDomain = domain;
    basePortHome = portHome;
    basePortChat = portChat;
    baseMode = mode;

  }


  static Future<void> settings(bool? isRelease)async{
    create(
        domain: isRelease == true ? "release" : "imsi",
        portHome: isRelease == true ? "5000" : "3000",
        portChat: isRelease == true ? "7002" : "7001",
        mode: switch(isRelease){
          true => Flavor.prod,
          false => Flavor.dev,
          _ => Flavor.type
        }
    );
    prefs = await SharedPreferences.getInstance();
    dm = await Func().getModel();
  }


}