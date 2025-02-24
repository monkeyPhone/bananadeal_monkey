import 'package:banana_deal_by_monkeycompany/package/common/cache/src/singleton/auth_cache.dart';

abstract class AuthCacheProvider {
  Future<bool> saveTokenHive(String token);
  Future<bool> saveIdxHive(int idx);
  Future<bool> saveInfoHive(String info);

  Future<String> getToken();

  Future<String> getInfo();
  Future<int> getIdxHiveFuture();

  void logout();

}


class AuthCacheProviderImpl implements AuthCacheProvider {

  @override
  Future<bool> saveTokenHive(String token) async => await  AuthCacheSgt.saveToken(token);

  @override
  Future<bool> saveIdxHive(int idx) async => await  AuthCacheSgt.saveIdx(idx);

  @override
  Future<bool> saveInfoHive(String info) async => await AuthCacheSgt.saveInfo(info);

  @override
  Future<String> getToken() async =>  await AuthCacheSgt.getToken();

  @override
  Stream<String> getTokenHive() => Stream.fromFuture(getToken());

  @override
  Stream<int> getIdxHive() => Stream.fromFuture(AuthCacheSgt.getIdx());

  @override
  Stream<String> getInfoHive() => Stream.fromFuture(AuthCacheSgt.getInfo());

  @override
  Future<String> getInfo() async => await AuthCacheSgt.getInfo();

  @override
  Future<int> getIdxHiveFuture() async => await AuthCacheSgt.getIdx();

  @override
  void logout() => AuthCacheSgt.logout();


}