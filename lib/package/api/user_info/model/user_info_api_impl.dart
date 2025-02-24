import 'package:banana_deal_by_monkeycompany/package/api/user_info/model/action/user_info_action.dart';
import 'package:banana_deal_by_monkeycompany/package/api/user_info/user_info_api.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/cache/model/func/device_func.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserInfoApiImpl implements UserInfoApi{
  final UserInfoAction action;

  const UserInfoApiImpl({
    required this.action,
  });

  @override
  Future<bool> logout({
    required int mIdx,
    required bool how,
    required DioRepository dio,
    required SharedPreferences mainPrefs,
  }) async => await action.logout(dio: dio, mainPrefs: mainPrefs, mIdx: mIdx, how: how);

  @override
  Future<DataDto> getDataDto(DioRepository dio) async => await action.getDataDto(dio: dio,);

  @override
  Future<bool> settingModelUUID({
    required DioRepository dio,
    required DeviceFunc deviceFunc,
    required String compareModel,
    required String compareUUID,
  }) async => await action.settingModelUUID(compareModel: compareModel, compareUUID: compareUUID, dio: dio, deviceFunc: deviceFunc);

  @override
  Future<int> setPosition({
    required SharedPreferences mainPrefs,
  }) async => await action.setPosition(mainPrefs: mainPrefs);

}