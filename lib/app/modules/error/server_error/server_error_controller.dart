import 'package:banana_deal_by_monkeycompany/app/components/common_widgets.dart';
import 'package:banana_deal_by_monkeycompany/app/managers/device_manager.dart';
import 'package:banana_deal_by_monkeycompany/app/managers/register_manager.dart';
import 'package:banana_deal_by_monkeycompany/app/models/auth/error/error_model.dart';
import 'package:banana_deal_by_monkeycompany/app/models/auth_basic_api.dart';
import 'package:banana_deal_by_monkeycompany/app/repository/app_repository.dart';
import 'package:get/get.dart';
import '../../../css/size.dart';
import '../../main/auth/auth_controller.dart';

class ServerErrorController extends GetxController{
  Rx<ErrorModel> error = ErrorModel(status: 0, msg: '', route: '', mRoute: '', eError: '', errorRouter: '').obs;
  RxDouble deviceHeght = WidgetSize(Get.context!).height60px.obs;

  RxInt serverChecker = 0.obs;

  final AppReopsitory _appRepository = const RegisterManager().getAppRepository();



  Future<void> checkInternetStatus() async {
      if(Get.isSnackbarOpen){
        Get.back();
      }
      else{
        serverChecker.value = await _appRepository.serverCheck();
        await Future.delayed(const Duration(milliseconds: 200));
        if(serverChecker.value == 200){
          Get.back();
        }
        else{
          CommonWidgets().customSnackbar('아직 서버와 연결이 확인되지 않았습니다.');
        }
      }


  }

  Future<AuthBagicApi> sendReport({required int status, required String msg, required String route, required String mRoute, required String eError}) async{
    AuthBagicApi _report = await _appRepository.sendErrorReport(
        lerStatus: status,
        lerContent: msg,
        lerRoute: route,
        lerMroute: mRoute,
        lerEerror: eError
    );
    if(_report.status == 200){
      if(status == 501 || status == 502 || status == 503){
        Get.back();
      }
    }
    return _report;
  }


  @override
  void onInit() async{
    // TODO: implement onInit
    deviceHeght.value = await DeviceManager.getDeviceHeight();
    update();
    if(AuthController.to.restoreServer().status != 0){
      error.value = AuthController.to.restoreServer();
      update();
      await sendReport(
          status: AuthController.to.restoreServer().status,
          msg: AuthController.to.restoreServer().msg,
          route: AuthController.to.restoreServer().route,
          mRoute: AuthController.to.restoreServer().mRoute,
          eError: AuthController.to.restoreServer().eError
      );
      if(AuthController.to.restoreServer().status != 510 && AuthController.to.restoreServer().status != 504){
        await checkInternetStatus();
      }
    } else{

      AuthController.commonWidgets.customSnackbar('잘못된 접근이에요.');
    }
    super.onInit();

  }


  @override
  void dispose() async{
    // TODO: implement dispose
    super.dispose();
    error.value.errorRouter == 'splash' ? AuthController.to.statusCheck() : null;
    error.value.errorRouter == 'src' ? await AuthController.to.logout('sever_error_controller') : null;
    AuthController.to.deleteServer();
  }

}