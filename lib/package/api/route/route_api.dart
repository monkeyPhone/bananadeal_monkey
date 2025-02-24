import 'dart:async';

import 'package:banana_deal_by_monkeycompany/package/common/cache/src/provider/main_cache_provider.dart';
import 'package:banana_deal_by_monkeycompany/package/common/dio/common_dio.dart';
import 'package:banana_deal_by_monkeycompany/package/data/common/data_dto.dart';

abstract class RouteApi {
  const RouteApi();

  Future<bool> getPermission({
    required MainCacheProvider mainCache
  });

  Future<bool> splashRouting(CommonDio dio);
  //
  Future<DataDto> getUser(CommonDio dio);

  Future<DataDto> logout({
    required CommonDio dio,
    required int mIdx,
    required bool how,
  });

  Future<bool> checkModelUUID({
    required CommonDio dio,
    required MainCacheProvider mainCache,
    required String model,
    required String uuid,
  });


  void close();

  Future<int> setPosition({required MainCacheProvider mainCache,});

}