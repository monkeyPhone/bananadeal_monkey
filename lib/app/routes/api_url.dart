import 'package:banana_deal_by_monkeycompany/config/app_config.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../models/version_check.dart';
import '../modules/error/network_dialog/error_controller.dart';
import '../modules/error/network_dialog/error_dialog.dart';
import '../modules/main/auth/auth_controller.dart';

class ApiConsole {

  static final String _mode = AppConfig.baseDomain;
  static final String _port = AppConfig.basePort;

  static String bananaFailUrlSqure = 'http://$_mode.bananadeal.co.kr:$_port/UPLOAD/IMAGES/APP/USER/emptyimg/notload.png';
  static String bananaFailUrlRectangle = 'http://$_mode.bananadeal.co.kr:$_port/UPLOAD/IMAGES/APP/USER/emptyimg/notload2.png';

  static String monkeyUrl = 'http://$_mode';
  static String monkeyImageUrl = '$monkeyUrl.monkeyphone.co.kr/';

  static String bananaOpenUrl = 'http://$_mode.bananadeal.co.kr:$_port/app/guest';
  static String bananaPrivateUrl = 'http://$_mode.bananadeal.co.kr:$_port/app/user';
  static String bananaChatUrl = 'http://$_mode.bananadeal.co.kr:$_port/app/share';
  static String chatServerImage = 'http://$_mode.bananadeal.co.kr:${_mode == "release" ? '7002' : '7001'}/app/share';
  static String bananaKakaoLogin = 'http://$_mode.bananadeal.co.kr:$_port/app/kakao';
  static String bananaAppleLogin = 'http://$_mode.bananadeal.co.kr:$_port/app/apple';
  static String imageBananaUrl = 'http://$_mode.bananadeal.co.kr:$_port/';
  static String imageChatBananaUrl = 'http://$_mode.bananadeal.co.kr:${_mode == "release" ? '7002' : '7001'}/';
  static String chatServer = 'http://$_mode.bananadeal.co.kr:${_mode == "release" ? '7002' : '7001'}/';
  static String chatServer2 = 'http://$_mode.bananadeal.co.kr:${_mode == "release" ? '7002' : '7001'}/app/user';
  static String shareKaKao = 'http://$_mode.bananadeal.co.kr:$_port/share';

  static String shareMode = 'http://www.bananadeal.co.kr/share';

  static String permissionLocation = 'http://$_mode.bananadeal.co.kr:$_port/permission/location';
  static String permissionPhotos = 'http://$_mode.bananadeal.co.kr:$_port/permission/photos';
  static String permissionCamera = 'http://$_mode.bananadeal.co.kr:$_port/permission/camera';
  static String permissionNotification = 'http://$_mode.bananadeal.co.kr:$_port/permission/notification';

  static String contentType = 'multipart/form-data';

  Options? options = AuthController.to.token == '' ? null : Options(
      headers: {
        "Content-Type": "application/json",
        "Authorization":
        "Bearer ${AuthController.to.token}",
      }
  );

  Future<bool> getInternetStatus() async{
    final connectivityResult = await (Connectivity().checkConnectivity());
    if(connectivityResult.contains(ConnectivityResult.wifi) || connectivityResult.contains(ConnectivityResult.mobile)
        || connectivityResult.contains(ConnectivityResult.ethernet)){
      return true;
    } else{
      return false;
    }
  }

  Future<void> falseConnect(Future func) async{
    if(await ApiConsole().getInternetStatus()){
      await func;
    } else{
      Get.put(ErrorController());
      ErrorDialog.customErrorDialog(errorCode: 505,  errorRouter: 'main');
    }

  }

  Future<VersionCheck> serverChecker() async {
    final _dio = Dio();
    final String apiRoute = '$bananaOpenUrl/appinfo/version';
    try {
      var response =
      await _dio.post(
        apiRoute,
      );
      var data = response.data;
      VersionCheck api = VersionCheck.fromJson(data);
      if (api.status == 200){
        return api;
      }
      else {
        return VersionCheck(status: 503, msg: '', result: []);
      }
    } on DioException catch (_) {
      return VersionCheck(status: 503, msg: '', result: []);
    }

  }

}