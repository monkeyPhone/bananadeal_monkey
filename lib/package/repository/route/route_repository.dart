import 'dart:async';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';

abstract class RouteRepository {
  const RouteRepository();

  Stream<bool> getPermission();

  Stream<bool> splashRouting();
  //
  Stream<DataDto> getUser();

  Future<bool> logout(int mIdx, bool how);

  Future<bool> checkModelUUID({
    required String uuid,
    required String model
  });

  Timer cancelTimer(void Function() callback);

  void close();

  Future<int> setPosition();

}