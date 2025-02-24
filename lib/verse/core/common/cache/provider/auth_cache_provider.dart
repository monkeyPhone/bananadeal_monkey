import 'package:banana_deal_by_monkeycompany/verse/core/common/cache/singleton/auth_cache_singleton.dart';
import 'package:dio/dio.dart';

abstract class AuthCacheProvider {
  Future<bool> saveTokenHive(String token);
  Future<bool> saveIdxHive(int idx);
  Future<bool> saveInfoHive(String info);

  Stream<String> getTokenHive();
  Stream<int> getIdxHive();
  Stream<String> getInfoHive();

  Future<int> getIdxHiveFuture();

  Future<Options> getOptions();

  Future<String> getTokenHiveFuture();

  void logout();

}


class AuthCacheProviderImpl extends AuthCacheProvider {

  @override
  Future<bool> saveTokenHive(String token) => AuthCacheSingleton.saveToken(token);

  @override
  Future<bool> saveIdxHive(int idx) => AuthCacheSingleton.saveIdx(idx);

  @override
  Future<bool> saveInfoHive(String info) => AuthCacheSingleton.saveInfo(info);

  @override
  Stream<String> getTokenHive() => Stream.fromFuture(AuthCacheSingleton.getToken());

  @override
  Stream<int> getIdxHive() => Stream.fromFuture(AuthCacheSingleton.getIdx());

  @override
  Stream<String> getInfoHive() => Stream.fromFuture(AuthCacheSingleton.getInfo());

  @override
  void logout() => AuthCacheSingleton.logout();

  @override
  Future<int> getIdxHiveFuture() async => await AuthCacheSingleton.getIdx();

  @override
  Future<Options> getOptions() async => await AuthCacheSingleton.getOptions();

  @override
  Future<String> getTokenHiveFuture() async => await AuthCacheSingleton.getToken();

  Future<String> getInfoHiveFuture() async => await AuthCacheSingleton.getInfo();

}