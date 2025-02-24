import 'package:banana_deal_by_monkeycompany/package/common/url/common_url.dart';

class CommonUrlImpl implements CommonUrl {
  @override
  final String mode;
  @override
  final String port;
  @override
  final String chatPort;
  @override
  final String bananaFailUrlSqure;
  @override
  final String bananaFailUrlRectangle;
  @override
  final String monkeyUrl;
  @override
  final String monkeyImageUrl;
  @override
  final String bananaOpenUrl;
  @override
  final String bananaPrivateUrl;
  @override
  final String bananaChatUrl;
  @override
  final String bananaKakaoLogin;
  @override
  final String bananaAppleLogin;
  @override
  final String bananaChat;
  @override
  final String bananaChatApi;
  @override
  final String bananaChatImgApi;
  @override
  final String imageBananaUrl;
  @override
  final String shareKaKao;
  @override
  final String shareMode;
  @override
  final String permissionLocation;
  @override
  final String permissionPhotos;
  @override
  final String permissionCamera;
  @override
  final String permissionNotification;
  @override
  final String contentType;


  const CommonUrlImpl({
    required this.mode,
    required this.port,
    required this.chatPort,
  }) :
        bananaFailUrlSqure = 'http://$mode.bananadeal.co.kr:$port/UPLOAD/IMAGES/APP/USER/emptyimg/notload.png',
        bananaFailUrlRectangle = 'http://$mode.bananadeal.co.kr:$port/UPLOAD/IMAGES/APP/USER/emptyimg/notload2.png',
        monkeyUrl = 'http://$mode',
        monkeyImageUrl = 'http://$mode.monkeyphone.co.kr/',
        bananaOpenUrl = 'http://$mode.bananadeal.co.kr:$port/app/guest',
        bananaPrivateUrl = 'http://$mode.bananadeal.co.kr:$port/app/user',
        bananaChatUrl = 'http://$mode.bananadeal.co.kr:$port/app/share',
        bananaKakaoLogin = 'http://$mode.bananadeal.co.kr:$port/app/kakao',
        bananaAppleLogin = 'http://$mode.bananadeal.co.kr:$port/app/apple',
        bananaChat = 'http://$mode.bananadeal.co.kr:$chatPort/',
        bananaChatApi = 'http://$mode.bananadeal.co.kr:$chatPort/app/user',
        bananaChatImgApi = 'http://$mode.bananadeal.co.kr:$chatPort/app/share',
        imageBananaUrl = 'http://$mode.bananadeal.co.kr:$port/',
        shareKaKao = 'http://$mode.bananadeal.co.kr:$port/share',
        shareMode = 'http://www.bananadeal.co.kr/share',
        permissionLocation = 'http://$mode.bananadeal.co.kr:$port/permission/location',
        permissionPhotos = 'http://$mode.bananadeal.co.kr:$port/permission/photos',
        permissionCamera = 'http://$mode.bananadeal.co.kr:$port/permission/camera',
        permissionNotification = 'http://$mode.bananadeal.co.kr:$port/permission/notification',
        contentType = 'multipart/form-data';

}