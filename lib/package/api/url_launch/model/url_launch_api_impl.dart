import 'package:banana_deal_by_monkeycompany/package/api/url_launch/model/action/url_launch_action.dart';
import 'package:banana_deal_by_monkeycompany/package/api/url_launch/url_launch_api.dart';

class UrlLaunchApiImpl implements UrlLaunchApi {
  final UrlLaunchAction action;
  const UrlLaunchApiImpl({
    required this.action,
  });

  @override
  Future<bool> launchUrls({
    required String url,
  }) async => await action.launchUrls(url: url);

}