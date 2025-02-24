import 'package:banana_deal_by_monkeycompany/verse/core/common/cache/singleton/main_cache_singleton.dart';

class NotiCacheSingleton {
  static final NotiCacheSingleton instance = NotiCacheSingleton._internal();
  factory NotiCacheSingleton() => instance;
  NotiCacheSingleton._internal();

  static final _notiBox = MainCacheSingleton.notiBox;

  Future<bool> saveNoti({
    required String key,
    required String value,
  }) async{
    try{
      await _notiBox.put(key, value);
      return true;
    } catch(_){
      return false;
    }
  }


  Future<String?> getNoti({
    required String key,
  }) async{
    await _futureDelay(50);
    return _notiBox.get(key);
  }


  Future<void> _futureDelay(int milliseconds) async{
    await Future.delayed(Duration(milliseconds: milliseconds));
  }

}