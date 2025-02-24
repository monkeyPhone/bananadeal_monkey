import 'dart:async';
import 'package:banana_deal_by_monkeycompany/package/api/route/route_api.dart';
import 'package:banana_deal_by_monkeycompany/package/api/route/src/part/route_func.dart';
import 'package:banana_deal_by_monkeycompany/package/api/route/src/part/route_rest.dart';
import 'package:banana_deal_by_monkeycompany/package/common/cache/src/provider/main_cache_provider.dart';
import 'package:banana_deal_by_monkeycompany/package/common/dio/common_dio.dart';
import 'package:banana_deal_by_monkeycompany/package/data/common/data_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/fcm/fcm_singleton.dart';

class RouteApiImpl implements RouteApi {

  const RouteApiImpl();

  final RouteFunc _func = const RouteFunc();
  final RouteRest _rest = const RouteRest();

  @override
  Future<bool> getPermission({
    required MainCacheProvider mainCache
  }) async => await _func.getPermissionData(mainCache: mainCache);

  @override
  Future<bool> splashRouting(CommonDio dio) async => await _rest.getAppVersion(dio);

  @override
  Future<DataDto> getUser(CommonDio dio) =>  _rest.getDataDto(dio: dio);

  @override
  Future<DataDto> logout({
    required CommonDio dio,
    required int mIdx,
    required bool how,
  }) async => await _rest.logout(dio: dio, mIdx: mIdx, how: how);

  @override
  Future<bool> checkModelUUID({
    required CommonDio dio,
    required MainCacheProvider mainCache,
    required String model,
    required String uuid,
  }) async => await _rest.settingModelUUID(dio: dio, mainCache: mainCache, compareModel: model, compareUUID: uuid);

  @override
  Future<int> setPosition({required MainCacheProvider mainCache,}) async => await _func.setPosition(mainCache: mainCache);

  @override
  void close() => FcmSingleton.close();

}