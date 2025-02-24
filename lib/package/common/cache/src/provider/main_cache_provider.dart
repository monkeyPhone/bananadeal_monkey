import 'package:banana_deal_by_monkeycompany/package/common/cache/src/singleton/part/device_func.dart';
import 'package:banana_deal_by_monkeycompany/package/data/common/device_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class MainCacheProvider {
  const MainCacheProvider();

  bool get isHeight60;
  bool get isIos;
  DeviceFunc get deviceFunc;
  SharedPreferences get prefs;
  DeviceEntity get deviceEntity;
}


class MainCacheProviderImpl implements MainCacheProvider {
  @override
  final bool isHeight60;
  @override
  final bool isIos;
  @override
  final DeviceFunc deviceFunc;
  @override
  final SharedPreferences prefs;
  @override
  final DeviceEntity deviceEntity;

   const MainCacheProviderImpl({
    required this.isHeight60,
    required this.isIos,
    required this.deviceFunc,
    required this.prefs,
    required this.deviceEntity,
  });
}