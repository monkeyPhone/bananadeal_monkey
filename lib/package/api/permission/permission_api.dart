import 'package:banana_deal_by_monkeycompany/package/api/permission/model/data/permission_entity.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/cache/model/data/device_entity.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/cache/model/func/device_func.dart';
import 'package:shared_preferences/shared_preferences.dart';


abstract class PermissionApi {
  const PermissionApi();

  Future<bool> getPermissionDataRoute({
    required DeviceFunc deviceFunc,
    required DeviceEntity deviceEntity,
    required SharedPreferences mainPrefs,
  });

  Future<(bool, PermissionEntity)> getPermissionData({
    required DeviceFunc deviceFunc,
    required DeviceEntity deviceEntity,
    required SharedPreferences mainPrefs,
  });

  Future<bool> requestAll({
    required DeviceFunc deviceFunc,
    required DeviceEntity deviceEntity,
    required SharedPreferences mainPrefs,
  });

  Future<(bool, PermissionEntity)> requestP({
    required DeviceFunc deviceFunc,
    required DeviceEntity deviceEntity,
    required SharedPreferences mainPrefs,
  });

}