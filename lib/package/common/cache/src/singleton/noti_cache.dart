import 'package:banana_deal_by_monkeycompany/package/common/cache/src/singleton/main_cache.dart';

class NotiCacheSgt {
  static final NotiCacheSgt instance = NotiCacheSgt._internal();
  factory NotiCacheSgt() => instance;
  NotiCacheSgt._internal();

  static final _notiBox = MainCacheSgt.notiBox;

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