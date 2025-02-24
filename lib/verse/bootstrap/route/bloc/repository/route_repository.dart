import 'dart:async';
import 'package:banana_deal_by_monkeycompany/package/data/common/data_dto.dart';

abstract class RouteRepository {
  const RouteRepository();

  Future<bool> getPermission();

  Future<bool> splashRouting();
  //
  Future<DataDto> getUser();

  Future<DataDto> logout(int mIdx, bool how);

  Future<bool> checkModelUUID({
    required String uuid,
    required String model
  });


  void close();

  Future<int> setPosition();

  Future<String> getToken();

  Future<int> getIdxHiveFuture();

  void cacheLogout();

  Stream<String> getInfoHive();

  Future<bool> saveIdxHive(int idx);
  Future<bool> saveInfoHive(String info);

}