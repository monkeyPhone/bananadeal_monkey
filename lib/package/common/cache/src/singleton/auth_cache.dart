import 'package:banana_deal_by_monkeycompany/package/common/cache/src/singleton/main_cache.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_noti.dart' as CacheString;


class AuthCacheSgt {
  static final AuthCacheSgt instance = AuthCacheSgt._internal();
  factory AuthCacheSgt() => instance;
  AuthCacheSgt._internal();

  static final _prefs = MainCacheSgt.prefs;
  static final _authBox = MainCacheSgt.authBox;

  static Future<bool> saveToken(String token) async{
    try{
      await  _prefs.setString(CacheString.token, token);
      await _authBox.put(CacheString.token, token);
      return true;
    } catch(_){
      return false;
    }
  }

  static Future<bool> saveIdx(int idx) async{
    try{
      await _authBox.put(CacheString.idx, idx);
      return true;
    } catch(_){
      return false;
    }
  }

  static Future<bool> saveInfo(String info) async{
    try{
      await _authBox.put(CacheString.info, info);
      return true;
    } catch(_){
      return false;
    }

  }

  static Future<String> getToken() async{
    await _futureDelay(50);
    return _authBox.get(CacheString.token) ?? _prefs.get(CacheString.token) ?? '';
  }

  static Future<int> getIdx() async{
    await _futureDelay(50);
    return _authBox.get(CacheString.idx) ?? 0;
  }

  static Future<String> getInfo() async{
    await _futureDelay(50);
    return _authBox.get(CacheString.info) ?? '';
  }


  static void logout(){
    _authBox.clear();
    _prefs.clear();
    //ManagerMain.authBox.delete(CacheString.token);
    // MainManager.authBox.delete(CacheString.idx);
    //ManagerMain.authBox.delete(CacheString.info);
  }

  static Future<void> _futureDelay(int milliseconds) async{
    await Future.delayed(Duration(milliseconds: milliseconds));
  }

}