import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/method/repository/method_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/route/repository/route_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/manager/tab_manager.dart';

class VerseConfig {
  final DioRepository dio;
  final CommonCache cache;
  final CommonUrl url;
  final CommonBrowser browser;
  final CommonRouteRepository route;
  final MethodRepository method;
  final CommonFunction function;
  final TabManager tab;

  const VerseConfig({
    required this.dio,
    required this.cache,
    required this.url,
    required this.route,
    required this.browser,
    required this.method,
    required this.function,
    required this.tab
  });
}
