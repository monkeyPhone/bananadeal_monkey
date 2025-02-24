import 'package:banana_deal_by_monkeycompany/verse/core/common/cache/singleton/main_cache_singleton.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_noti.dart' as CacheString;
import 'package:dio/dio.dart';

class AuthCacheSingleton {
  static final AuthCacheSingleton instance = AuthCacheSingleton._internal();
  factory AuthCacheSingleton() => instance;
  AuthCacheSingleton._internal();

  static final _prefs = MainCacheSingleton.prefs;
  static final _authBox = MainCacheSingleton.authBox;

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

  static Future<Options> getOptions() async{
    String token = await getToken();
    final Options options = Options(
        headers: {
          "Content-Type": "application/json",
          "Authorization":
          "Bearer $token",
        }
    );
    return options;
  }

  static void logout(){
    _authBox.clear();

    //ManagerMain.authBox.delete(CacheString.token);
    // MainManager.authBox.delete(CacheString.idx);
    //ManagerMain.authBox.delete(CacheString.info);
  }

  static Future<void> _futureDelay(int milliseconds) async{
    await Future.delayed(Duration(milliseconds: milliseconds));
  }

}