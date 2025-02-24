import 'package:common_cache/src/common_cache.dart';
import 'package:common_cache/src/part/provider/auth/auth_cache_provider.dart';
import 'package:common_cache/src/part/provider/main/main_cache_provider.dart';

class CommonCacheImpl implements CommonCache{
  @override
  final AuthCacheProvider authCacheProvider = AuthCacheProviderImpl();
  @override
  final MainCacheProvider mainCacheProvider = MainCacheProviderImpl();

  CommonCacheImpl();


}