import 'package:banana_deal_by_monkeycompany/package/api/route/route_api.dart';
import 'package:banana_deal_by_monkeycompany/package/common/cache/common_cache.dart';
import 'package:banana_deal_by_monkeycompany/package/common/dio/common_dio.dart';
import 'package:banana_deal_by_monkeycompany/package/data/common/data_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/bootstrap/route/bloc/repository/route_repository.dart';

class RouteRepositoryImpl implements RouteRepository {
  final RouteApi api;
  final CommonCache commonCache;
  final CommonDio dio;

  const RouteRepositoryImpl({
    required this.api,
    required this.commonCache,
    required this.dio,
  });

  @override
  Future<bool> getPermission() async => await api.getPermission(mainCache: commonCache.mainCacheProvider);

  @override
  Future<bool> splashRouting() async => await api.splashRouting(dio) ;

  @override
  Future<DataDto> getUser() async => await api.getUser(dio);

  @override
  Future<DataDto> logout(int mIdx, bool how) async => await api.logout(mIdx: mIdx, how: how, dio: dio,);

  @override
  Future<bool> checkModelUUID({
    required String uuid,
    required String model
  }) async => await api.checkModelUUID(
      dio: dio, mainCache: commonCache.mainCacheProvider,
      model: model, uuid: uuid);


  @override
  Future<int> setPosition() async => await api.setPosition(mainCache: commonCache.mainCacheProvider);

  @override
  void close() => api.close();

  @override
  Future<String> getToken() async => await commonCache.authCacheProvider.getToken();
  
  @override
  Future<int> getIdxHiveFuture() async => await commonCache.authCacheProvider.getIdxHiveFuture(); 
  
  @override
  void cacheLogout() => commonCache.authCacheProvider.logout();

  @override
  Future<bool> saveIdxHive(int idx) async => await commonCache.authCacheProvider.saveIdxHive(idx);
  
  @override
  Stream<String> getInfoHive() => Stream.fromFuture(commonCache.authCacheProvider.getInfo());

  @override
  Future<bool> saveInfoHive(String info) async => await commonCache.authCacheProvider.saveInfoHive(info);
}