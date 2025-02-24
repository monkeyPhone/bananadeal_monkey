import 'package:banana_deal_by_monkeycompany/package/common/cache/common_cache.dart';
import 'package:banana_deal_by_monkeycompany/package/common/cache/src/provider/auth_cache_provider.dart';
import 'package:banana_deal_by_monkeycompany/package/common/cache/src/provider/main_cache_provider.dart';

class CommonCacheImpl implements CommonCache{
  @override
  final AuthCacheProvider authCacheProvider;
  @override
  final MainCacheProvider mainCacheProvider;

  const CommonCacheImpl({
    required this.authCacheProvider,
    required this.mainCacheProvider,
  });


}