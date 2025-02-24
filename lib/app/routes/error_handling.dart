import 'package:banana_deal_by_monkeycompany/app/models/auth/error/error_model.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/error/503_dialog/503_dialog.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/error/503_dialog/dialog_503_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/main/loading/loading_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/routes/api_url.dart';
import 'package:banana_deal_by_monkeycompany/config/datetime_config.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../modules/error/network_dialog/error_controller.dart';
import '../modules/error/network_dialog/error_dialog.dart';
import '../modules/main/auth/auth_controller.dart';
import 'const_element.dart';


class ErrorManager{
  static final ErrorManager instance = ErrorManager._internal();
  factory ErrorManager() => instance;
  ErrorManager._internal();

  static String switchString(String src){
    if(src.contains('Src')){
      return 'src';
    }
    else if(src == 'AppReopsitory-getAppVersion'){
      return 'splash';
    }
    else{
      return '';
    }
  }

  static bool checkTime(){
    DateTime now = DateTimeConfig().now;
    return now.hour >= 06 && now.hour < 07;
  }

  static errorCodeReturn({
    required int status,
    required String funcRoute,
    required String apiRoute,
    String? error,
    required String msg
}){
    AppElement.getLoadings;
    LoadingController.to.updateDialog(false);
    if(Get.isSnackbarOpen == false && Get.isDialogOpen == false){
      if(checkTime()){
        AuthController.to.changeServer(val: ErrorModel(status: 510, msg: msg, route: apiRoute, mRoute: funcRoute, eError: '', errorRouter: switchString(funcRoute)));
      } else{
        switch(status){
          case 400:
            error != null
                ? AuthController.commonWidgets.customSnackbarErrorMessage('${status}: 잘못된 요청입니다.')
                : null;
            break;
          case 401:
            AuthController.to.tokenEnd(true);
            break;
          case 404:
            error != null
                ? AuthController.commonWidgets.customSnackbarErrorMessage('${status}: 요청 정보가 잘못되었습니다.')
                : null;
            break;
          case 500:
            AuthController.to.changeServer(val: ErrorModel(status: status, msg: msg, route: apiRoute, mRoute: funcRoute, eError: '', errorRouter: switchString(funcRoute)));
            break;
        }
      }
    } else{

    }
  }

  // 500 Internal Server Error (내부 서버 에러)
  // 서버가 처리 방법을 모르는 상황과 마주쳤지만, 서버가 처리 방법을 알 수 없을 경우. 서버에 오류가 발생해 작업을 수행할 수 없을 때 나타나는 코드.
  //
  // 502 Bad Gateway (불량 게이트웨이)
  // 서버가 요청을 처리하는 데 필요한 응답을 얻기 위해 게이트웨이로 작업하는 동안 잘못된 응답을 받았다는 뜻.
  //
  // 503 Service Unavailable (일시적으로 이용할 수 없음)
  // 서버가 요청을 처리할 준비가 되지 않았음. 보통은 유지보수를 위해 작동을 중단했거나 과부하 상태가 된 서버로 인해 발생하는 코드.
  //
  // 504 Gateway Timeout (게이트웨이 시간 초과)
  // 게이트웨이가 연결된 서버로부터 응답을 적절한 시간 내에 받을 수 없었다는 뜻.



  static errorDioReturn({required DioException e, required String router505, required String path, required String apiUrl}) async{
    AppElement.getLoaidng;
    LoadingController.to.updateDialog(false);
    if(Get.isSnackbarOpen == false && Get.isDialogOpen == false){
      final bool connectivityResult = await ApiConsole().getInternetStatus();
      if(connectivityResult){
        try{
          if(checkTime()){
            AuthController.to.changeServer(val: ErrorModel(status: 510, msg: '${e.type}', route: apiUrl, mRoute: path, eError: e.error.toString()
                , errorRouter: router505
            ));
          } else{
            switch(e.type){
              case DioExceptionType.unknown:
                if(e.error.toString().contains('Connection reset by peer')){
                  Get.put(Dialog503Controller());
                  Dialog503.customErrorDialog(errorCode: 506,  errorRouter: router505);
                  break;
                } else{
                  Get.put(Dialog503Controller());
                  Dialog503.customErrorDialog(errorCode: 507,  errorRouter: router505);
                  break;
                }
              case DioExceptionType.connectionTimeout:
              case DioExceptionType.sendTimeout:
              case DioExceptionType.receiveTimeout:
              case DioExceptionType.cancel:
              case DioExceptionType.badResponse:
                AuthController.to.changeServer(val: ErrorModel(status: 501, msg: '${e.type}', route: apiUrl, mRoute: path, eError: e.error.toString()
                    , errorRouter: router505
                ));
                break;
              default:
                AuthController.to.changeServer(val: ErrorModel(status: 502, msg: 'DioErrorType.default', route: apiUrl, mRoute: path, eError: e.error.toString()
                    , errorRouter: router505));
                break;
            }
          }
        } catch(e){
          AuthController.to.changeServer(val: ErrorModel(status: 503, msg: 'DioErrorType.null', route: apiUrl, mRoute: path, eError: e.toString()
              , errorRouter: router505));
        }
      } else{
        Get.put(ErrorController());
        ErrorDialog.customErrorDialog(errorCode: 505,  errorRouter: router505);
      }
    }
  }
}