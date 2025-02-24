import 'dart:async';
import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/api/check_version/check_version_api.dart';
import 'package:banana_deal_by_monkeycompany/package/api/permission/permission_api.dart';
import 'package:banana_deal_by_monkeycompany/package/api/user_info/user_info_api.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/route/route_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/cache/model/data/device_entity.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/cache/model/func/device_func.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/fcm/fcm_singleton.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RouteRepositoryImpl implements RouteRepository {
  final CommonFunction commonFunction;
  final PermissionApi permissionApi;
  final CheckVersionApi checkVersionApi;
  final UserInfoApi userInfoApi;
  final DioRepository dio;
  final SharedPreferences mainPrefs;
  final DeviceFunc deviceFunc;
  final DeviceEntity deviceEntity;

  const RouteRepositoryImpl({
    required this.commonFunction,
    required this.permissionApi,
    required this.checkVersionApi,
    required this.userInfoApi,
    required this.dio,
    required this.mainPrefs,
    required this.deviceFunc,
    required this.deviceEntity,
  });

  @override
  Stream<bool> getPermission() => Stream.fromFuture(permissionApi.getPermissionDataRoute(deviceFunc: deviceFunc, deviceEntity: deviceEntity, mainPrefs: mainPrefs));

  @override
  Stream<bool> splashRouting() => Stream.fromFuture(checkVersionApi.getAppVersionRouting(dio));

  @override
  Stream<DataDto> getUser() =>  Stream.fromFuture(userInfoApi.getDataDto(dio));

  @override
  Future<bool> logout(int mIdx, bool how) async => await userInfoApi.logout(mIdx: mIdx, how: how, dio: dio, mainPrefs: mainPrefs);

  @override
  Future<bool> checkModelUUID({
    required String uuid,
    required String model
  }) async => await userInfoApi.settingModelUUID(
      dio: dio, deviceFunc: deviceFunc,
      compareModel: model, compareUUID: uuid);

  @override
  Timer cancelTimer(void Function() callback) => commonFunction.cancelTimer(callback);

  @override
  Future<int> setPosition() async => await userInfoApi.setPosition(mainPrefs: mainPrefs);

  @override
  void close() => FcmSingleton.close();


}