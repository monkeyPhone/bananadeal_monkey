import 'package:common_cache/src/part/provider/auth/auth_cache_provider.dart';
import 'package:common_cache/src/part/provider/main/main_cache_provider.dart';

abstract class CommonCache {
  final AuthCacheProvider authCacheProvider;
  final MainCacheProvider mainCacheProvider;

  const CommonCache({
    required this.authCacheProvider,
    required this.mainCacheProvider,
  });


}
