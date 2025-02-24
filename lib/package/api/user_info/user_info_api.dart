import 'package:banana_deal_by_monkeycompany/verse/core/common/cache/model/func/device_func.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class UserInfoApi {
  const UserInfoApi();

  Future<bool> logout({
    required int mIdx,
    required bool how,
    required DioRepository dio,
    required SharedPreferences mainPrefs,
  });


  Future<DataDto> getDataDto(DioRepository dio);

  Future<bool> settingModelUUID({
    required String compareModel,
    required String compareUUID,
    required DioRepository dio,
    required DeviceFunc deviceFunc,
  });

  Future<int> setPosition({
    required SharedPreferences mainPrefs,
  });


}