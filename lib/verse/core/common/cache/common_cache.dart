import 'package:banana_deal_by_monkeycompany/verse/core/common/cache/model/data/device_entity.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/cache/model/func/device_func.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/cache/provider/auth_cache_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


class CommonCache {
  final AuthCacheProvider authCacheProvider;
  final MainCache mainCache;

  const CommonCache({
    required this.authCacheProvider,
    required this.mainCache,
  });


}

class MainCache {
  final bool isHeight60;
  final bool isIos;
  final DeviceFunc deviceFunc;
  final SharedPreferences prefs;
  final DeviceEntity deviceEntity;

  const MainCache({
    required this.isHeight60,
    required this.isIos,
    required this.deviceFunc,
    required this.prefs,
    required this.deviceEntity
  });
}