import 'package:banana_deal_by_monkeycompany/config/app_config.dart';
import 'package:url_launcher/url_launcher.dart';

class CommonUrl {
  CommonUrl();


  static final String _mode = AppConfig.baseDomain;
  static final String _port = AppConfig.basePort;

  String bananaFailUrlSqure = 'http://$_mode.bananadeal.co.kr:$_port/UPLOAD/IMAGES/APP/USER/emptyimg/notload.png';
  String bananaFailUrlRectangle = 'http://$_mode.bananadeal.co.kr:$_port/UPLOAD/IMAGES/APP/USER/emptyimg/notload2.png';

  String monkeyUrl = 'http://$_mode';
  String monkeyImageUrl = 'http://$_mode.monkeyphone.co.kr/';

  String bananaOpenUrl = 'http://$_mode.bananadeal.co.kr:$_port/app/guest';
  String bananaPrivateUrl = 'http://$_mode.bananadeal.co.kr:$_port/app/user';
  String bananaChatUrl = 'http://$_mode.bananadeal.co.kr:$_port/app/share';
  String bananaKakaoLogin = 'http://$_mode.bananadeal.co.kr:$_port/app/kakao';
  String bananaAppleLogin = 'http://$_mode.bananadeal.co.kr:$_port/app/apple';
  String bananaChat = 'http://$_mode.bananadeal.co.kr:7001/';
  String bananaChatApi = 'http://$_mode.bananadeal.co.kr:7001/app/user';
  String bananaChatImgApi = 'http://$_mode.bananadeal.co.kr:7001/app/share';
  String imageBananaUrl = 'http://$_mode.bananadeal.co.kr:$_port/';
  String shareKaKao = 'http://$_mode.bananadeal.co.kr:$_port/share';
  String shareMode = 'http://www.bananadeal.co.kr/share';

  String permissionLocation = 'http://$_mode.bananadeal.co.kr:$_port/permission/location';
  String permissionPhotos = 'http://$_mode.bananadeal.co.kr:$_port/permission/photos';
  String permissionCamera = 'http://$_mode.bananadeal.co.kr:$_port/permission/camera';
  String permissionNotification = 'http://$_mode.bananadeal.co.kr:$_port/permission/notification';


  String contentType = 'multipart/form-data';

  Future<bool> launchInBrowser({
    required String url,
  }) async{
    try{
      final Uri launchUri = Uri.parse(url);
      await launchUrl(launchUri, mode: LaunchMode.externalApplication);
      return true;
    }
    catch(_){
      return false;
    }
  }


}