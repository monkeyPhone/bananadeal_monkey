import 'dart:async';
import 'dart:io';
import 'package:banana_deal_by_monkeycompany/app/components/common_widgets.dart';
import 'package:banana_deal_by_monkeycompany/app/models/version_check_new.dart';
import 'package:banana_deal_by_monkeycompany/app/routes/api_url.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../managers/permission/permission_handler_manager.dart';
import '../../../managers/permission/views/permission_page.dart';
import '../../../repository/app_repository.dart';
import '../../../routes/const_element.dart';
import '../../main/auth/auth_controller.dart';

class SplashController extends GetxController with GetSingleTickerProviderStateMixin{

  static SplashController get to => Get.find();

  final PermissionHandlerManager _pm;
  final ApiConsole _apiConsole;
  final CommonWidgets _commonWidgets;
  final AppReopsitory _appRepository;


  SplashController({
    required AppReopsitory appRepository,
    required PermissionHandlerManager pm,
    required ApiConsole apiConsole,
    required CommonWidgets commonWidgets,

  }) : _appRepository = appRepository,
        _pm = pm,
        _apiConsole = apiConsole,
        _commonWidgets = commonWidgets;



  //하단 텍스트 변수
  RxString currentVersion = ''.obs;
  RxInt splashState = 0.obs;

  RxInt androidSdkVersion = 0.obs;

  Rx<VersionCheckNew> versionNew = VersionCheckNew(status: 0, msg: '', result: []).obs;


  //인디케이터 컨트롤러
  late AnimationController animationController;

  // final camera = await pm.checkPermission(PermissionHandlerManager.camera);
  // final photos = await pm.checkPermission(PermissionHandlerManager.photos);

  Future<bool> getPermissionState() async{
    if(GetPlatform.isIOS){
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final noti = await _pm.checkPermission(PermissionHandlerManager.noti);
      if(noti == PermissionHandlerManager.granted || prefs.getString(AppElement.permissionIos) != null){
        return true;
      }
      else{
        return false;
      }
    } else{
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      final int androidVersion = androidInfo.version.sdkInt;
      androidSdkVersion.value = androidVersion;
      if(androidVersion >= 33){
        final photos = await _pm.checkPermission(PermissionHandlerManager.photos);
        final locations = await _pm.checkPermission(PermissionHandlerManager.location);
        final camera = await _pm.checkPermission(PermissionHandlerManager.camera);
        final noti = await _pm.checkPermission(PermissionHandlerManager.noti);
        if((photos == PermissionHandlerManager.granted || photos == PermissionHandlerManager.limited) && locations == PermissionHandlerManager.granted
            && camera == PermissionHandlerManager.granted  && noti == PermissionHandlerManager.granted
        ){
          return true;
      } else{
        return false;
      }
    } else{
        final storage = await _pm.checkPermission(PermissionHandlerManager.storage);
        final locations = await _pm.checkPermission(PermissionHandlerManager.location);
        final camera = await _pm.checkPermission(PermissionHandlerManager.camera);
        final noti = await _pm.checkPermission(PermissionHandlerManager.noti);
        if(storage == PermissionHandlerManager.granted && locations == PermissionHandlerManager.granted
            && camera == PermissionHandlerManager.granted  && noti == PermissionHandlerManager.granted
        ){
          return true;
        } else{
          return false;
        }
      }
    }
}

void _animatedControllerDispose(){
  try{
    animationController.dispose();
  } catch(_){

  }
}

  Future<void> getAppVersion() async{
    if(!await getPermissionState()){
      Get.to(
              () => PermissionPage(
                androidSdkversion: androidSdkVersion.value,
              ),
      );
    }else{
      final VersionCheckNew version = await _appRepository.getAppVersion(
        Platform.isIOS ? 'IOS' : 'ANDROID'
      );
      if (version.status == 200) {
        PackageInfo packageInfo = await PackageInfo.fromPlatform();
        currentVersion.value = packageInfo.version;
        versionNew.value = version;
        int? bdVersion = int.tryParse(packageInfo.version.replaceAll('.', ''));
        int? serverVersion = int.tryParse(version.result.first.auVersion.replaceAll('.', ''));
        bool isS = (bdVersion != null && serverVersion != null);
        bool isSuc = ( bdVersion! < serverVersion!);
        if (kDebugMode) {
          print(isSuc);
        }
        update();
        final String url = version.result.first.auUrl;
        if(isS){
          if (isSuc){
            if(version.result.first.auIsUpdate == 'Y'){
              openDialogOneButton(context: Get.context!, url: url);
            }
            else{
              loading(url);
            }
          }
          else {
            Timer(const Duration(seconds: 3),
                    () {
                  _animatedControllerDispose();
                  AuthController.to.tokken.value = AuthController.to.token;
                }
            );
          }
        }
        else {
          _failCase(version);
        }

      }
      else{
        _failCase(version);
      }
    }
  }


  void _failCase(VersionCheckNew version){
    versionNew.value = version;
    update();
    _animatedControllerDispose();
    splashState.value = 30;
    update();
  }


  Future<void> nextPage() async{
    final bool result = await _apiConsole.getInternetStatus();
    if(result) {
      await getAppVersion();
    }
  }


//팝업창 함수
  void loading(String url) {
    Timer(const Duration(seconds: 3),
            (){
              openDialogTwoButton(
                  context: Get.context!,
                  url: url);
        }
    );
  }

  Future<void> launchInBrowser(String url) async {
    try{
      final Uri launchUri = Uri.parse(url);
      if(await launchUrl(launchUri, mode: LaunchMode.externalApplication)){
        // animationController.dispose();
        // AuthController.to.tokken.value = AuthController.to.token;
      } else{
        await getAppVersion();
        _commonWidgets.customSnackbar(AppElement.pageMoveFail);
      }
    }catch(_){
      await getAppVersion();
      _commonWidgets.customSnackbar(AppElement.pageMoveFail);
    }
  }


  void openDialogOneButton({
    required BuildContext context,
    required String url
  }) {
    _commonWidgets.customDialog(
        routerContext: context,
        mainText: '새로운 버전이 있어요.\n필수 업데이트 패치입니다.',
        confirmText: '업데이트',
        conFirmOnTap: () async{
          if(Get.isSnackbarOpen){
            Get.back();
          } else{
            await launchInBrowser(url);
          }
        },
        isOne: true
    );


  }

  Future<void> launchMarket(String url) async{
    try{
      final uri = Uri.parse(url);
      if(await launchUrl(uri)){

      }
      else{
        _commonWidgets.customSnackbar('잘못된 url입니다.');
      }

    } catch(_){
      _commonWidgets.customSnackbar('만료된 url입니다.');
    }
  }

  void openDialogTwoButton({
    required BuildContext context,
    required String url
  }) {
    _commonWidgets.customDialog(
      routerContext: context,
      barrierDismissible: false,
      mainText:  '새로운 버전이 있어요.\n지금 업데이트 하시겠어요?',
      cancleText: '다음에',
      cancleOnTap: (){
        if(Get.isSnackbarOpen){
          Get.back();
        } else{
          Get.back();
          _animatedControllerDispose();
          AuthController.to.tokken.value = AuthController.to.token;
        }
      },
      confirmText: '업데이트',
      conFirmOnTap: () async{
        if(Get.isSnackbarOpen){
          Get.back();
        } else{
          await launchInBrowser(url);
        }
      },
    );
  }

  Future<void> onInitFunction() async{
    await getAppVersion();
  }



  //인디케이터 반복 함수
  @override
  void onInit() async{
    animationController =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    animationController.repeat();
    await onInitFunction();
    super.onInit();
  }

  @override
  void onReady() {
    //loading();
    super.onReady();
    debounce(splashState, (_) async{
      if(splashState.value == 30){
        await nextPage();
      }
    });


  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animatedControllerDispose();
    super.dispose();
  }

}