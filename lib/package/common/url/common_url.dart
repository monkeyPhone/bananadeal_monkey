import 'package:banana_deal_by_monkeycompany/config/app_config.dart';

abstract class CommonUrl {
  const CommonUrl();

  String get mode;
  String get port;
  String get chatPort;

  String get bananaFailUrlSqure;
  String get bananaFailUrlRectangle;

  String get monkeyUrl;
  String get monkeyImageUrl;

  String get bananaOpenUrl;
  String get bananaPrivateUrl;
  String get bananaChatUrl;
  String get bananaKakaoLogin;
  String get bananaAppleLogin;
  String get bananaChat;
  String get bananaChatApi;
  String get bananaChatImgApi;

  String get imageBananaUrl;
  String get shareKaKao;
  String get shareMode;
  String get permissionLocation;
  String get permissionPhotos;
  String get permissionCamera;
  String get permissionNotification;
  String get contentType;

}