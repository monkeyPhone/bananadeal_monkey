import 'package:utils/utils.dart';

class CacheAuthSgt {
  static final CacheAuthSgt instance = CacheAuthSgt._internal();
  factory CacheAuthSgt() => instance;
  CacheAuthSgt._internal();

  static late final authBox;

  static Future<bool> saveToken({required String token}) async{
    try{
      await authBox.put(userToken, token);
      return true;
    } catch(_){
      return false;
    }
  }

  static Future<bool> saveUUID({required String uuid}) async{
    try{
      await authBox.put(userUUID, uuid);
      return true;
    } catch(_){
      return false;
    }
  }

  static Future<bool> saveIdx({required int idx}) async{
    try{
      await authBox.put(userIdx, idx);
      return true;
    } catch(_){
      return false;
    }
  }

  static Future<bool> saveInfo(String info) async{
    try{
      await authBox.put(userInfo, info);
      return true;
    } catch(_){
      return false;
    }

  }

  static String getTokenSelf() => authBox.get(userToken) ?? '';

  static Future<String> getToken() async{
    await _futureDelay(50);
    return authBox.get(userToken) ?? '';
  }

  static Future<String> getUUID() async{
    await _futureDelay(50);
    return authBox.get(userUUID) ?? '';
  }

  static Future<int> getIdx() async{
    await _futureDelay(50);
    return authBox.get(userIdx) ?? 0;
  }

  static Future<String> getInfo() async{
    await _futureDelay(50);
    return authBox.get(userInfo) ?? '';
  }



  static Future<void> _futureDelay(int milliseconds) async{
    await Future.delayed(Duration(milliseconds: milliseconds));
  }

}