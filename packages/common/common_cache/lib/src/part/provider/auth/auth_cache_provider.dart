import 'package:core/core.dart';

abstract class AuthCacheProvider {
  const AuthCacheProvider();
  Future<bool> saveTokenHive({required String token});
  Future<bool> saveUUIDHive({required String uuid});
  Future<bool> saveIdxHive({required int idx});
  Future<bool> saveInfoHive({required String info});

  Future<String> getToken();
  Future<String> getUUID();
  Future<String> getInfo();
  Future<int> getIdxHiveFuture();
  String getTokenSelf();
  // Future<void> logout();

}


class AuthCacheProviderImpl implements AuthCacheProvider {
  const AuthCacheProviderImpl();
  @override
  Future<bool> saveTokenHive({required String token}) async => await  CacheAuthSgt.saveToken(token: token);

  @override
  Future<bool> saveUUIDHive({required String uuid}) async => await CacheAuthSgt.saveUUID(uuid: uuid);

  @override
  Future<bool> saveIdxHive({required int idx}) async => await  CacheAuthSgt.saveIdx(idx:idx);

  @override
  Future<bool> saveInfoHive({required String info}) async => await CacheAuthSgt.saveInfo(info);

  @override
  Future<String> getToken() async =>  await CacheAuthSgt.getToken();

  @override
  Future<String> getUUID() async => await CacheAuthSgt.getUUID();

  @override
  Future<String> getInfo() async => await CacheAuthSgt.getInfo();

  @override
  Future<int> getIdxHiveFuture() async => await CacheAuthSgt.getIdx();

  @override
  String getTokenSelf() => CacheAuthSgt.getTokenSelf();
  // @override
  // Future<void> logout() async{
  //   CacheAuthSgt.authBox.clear();
  //   await CacheMainSgt.prefs.clear();
  // }


}