import 'package:banana_deal_by_monkeycompany/package/common/cache/src/provider/auth_cache_provider.dart';
import 'package:banana_deal_by_monkeycompany/package/common/cache/src/provider/main_cache_provider.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/fcm/fcm_singleton.dart';

abstract class CommonCache {
  final AuthCacheProvider authCacheProvider;
  final MainCacheProvider mainCacheProvider;

  const CommonCache({
    required this.authCacheProvider,
    required this.mainCacheProvider,
  });


}
