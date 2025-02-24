import 'package:url_launcher/url_launcher.dart';

class UrlLaunchAction {
  const UrlLaunchAction();

  Future<bool> launchUrls({
    required String url,
  }) async {
    try{
      final Uri launchUri = Uri.parse(url);
      final bool result = await launchUrl(launchUri, mode: LaunchMode.externalApplication);
      return result;
    }
    catch(_){
      return false;
    }
  }

}