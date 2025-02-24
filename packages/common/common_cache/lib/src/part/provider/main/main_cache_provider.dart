import 'package:core/core.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class MainCacheProvider {
  const MainCacheProvider();
   SharedPreferences get prefs;
   String get platForm;
   bool get isIos;
   int get sdkVersion;
   bool get isHeight60;
}


class MainCacheProviderImpl implements MainCacheProvider {
  @override
  final SharedPreferences prefs =  CacheMainSgt.prefs;
  @override
  final bool isHeight60 = CacheMainSgt.dm.isHeight60;
  @override
  final bool isIos = CacheMainSgt.dm.isIos;
  @override
  final String platForm = CacheMainSgt.dm.platForm;
  @override
  final int sdkVersion =  CacheMainSgt.dm.sdkVersion;

  MainCacheProviderImpl();
}