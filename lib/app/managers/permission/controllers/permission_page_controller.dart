import 'package:app_settings/app_settings.dart';
import 'package:banana_deal_by_monkeycompany/app/managers/device_manager.dart';
import 'package:banana_deal_by_monkeycompany/config/datetime_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../components/common_dialog/common_widgets_2.dart';
import '../../../css/size.dart';
import '../../../modules/splash/controllers/splash_controller.dart';
import '../../../routes/const/const_info.dart';
import '../../../routes/const_element.dart';

class PermissionPageController extends GetxController{
  static PermissionPageController get to => Get.find();
  final CommonWidgets2 _commonWidgets2;
  PermissionPageController({
    required CommonWidgets2 commonWidgets2
  }) : _commonWidgets2 = commonWidgets2;

  RxBool click = false.obs;

  RxDouble deviceHeight = WidgetSize(Get.context!).height60px.obs;

  Rx<PermissionStatus> photos = PermissionStatus.denied.obs;
  Rx<PermissionStatus> locations = PermissionStatus.denied.obs;
  Rx<PermissionStatus> camera = PermissionStatus.denied.obs;
  Rx<PermissionStatus> noti = PermissionStatus.denied.obs;
  Rx<PermissionStatus> storage = PermissionStatus.denied.obs;
  RxBool requestClear = false.obs;
  RxInt backPage = 0.obs;

  Future<PermissionStatus> requestP(Permission permission) async{
    final PermissionStatus _result = await permission.request();
    switch (_result) {
      case PermissionStatus.granted:
        return await checkPermission(permission);
      case PermissionStatus.limited:
      case PermissionStatus.restricted:
      case PermissionStatus.denied:
        return await checkPermission(permission);
      case PermissionStatus.permanentlyDenied:
        // AppSettings.openAppSettings(type: AppSettingsType.settings);
        return await checkPermission(permission);
      default:
        return await checkPermission(permission);

    }

  }

  // void clickButton(){
  //   click.value = true;
  // }

  bool _iosPermission(){
    return  noti.value == PermissionStatus.denied
            || noti.value == PermissionStatus.permanentlyDenied;
  }

  List<String> makeList(int sdkVersion){
    List<String> logic =
        sdkVersion == 0
    ?  [noti.value == PermissionStatus.permanentlyDenied ||  noti.value == PermissionStatus.denied ? InfoString.permissionNoti : '',
          locations.value == PermissionStatus.permanentlyDenied || locations.value == PermissionStatus.denied ? InfoString.permissionLocation : '',
        ]
            : sdkVersion >= 33
          ?
        [noti.value == PermissionStatus.permanentlyDenied ? InfoString.permissionNoti : '',
          locations.value == PermissionStatus.permanentlyDenied ? InfoString.permissionLocation : '',
          photos.value == PermissionStatus.permanentlyDenied ? InfoString.permissionPhoto : '',
          camera.value == PermissionStatus.permanentlyDenied ? InfoString.permissionCamera : ''
        ]
          : [noti.value == PermissionStatus.permanentlyDenied ? InfoString.permissionNoti : '',
          locations.value == PermissionStatus.permanentlyDenied ? InfoString.permissionLocation : '',
          storage.value == PermissionStatus.permanentlyDenied ? InfoString.permissionPhoto : '',
          camera.value == PermissionStatus.permanentlyDenied ? InfoString.permissionCamera : ''
        ];
    return logic;
  }

  bool _androidNewPermission() {
    return photos.value == PermissionStatus.permanentlyDenied || locations.value == PermissionStatus.permanentlyDenied
        || camera.value == PermissionStatus.permanentlyDenied || noti.value == PermissionStatus.permanentlyDenied;
  }

  bool _androidOldPermission() {
    return storage.value == PermissionStatus.permanentlyDenied || locations.value == PermissionStatus.permanentlyDenied
        || camera.value == PermissionStatus.permanentlyDenied || noti.value == PermissionStatus.permanentlyDenied;
  }

  String convertPlatForm(int version) {
    if(version == 0) {
      return 'ios';
    }
    else{
      if(version >= 33){
        return 'new';
      }
      else {
        return 'old';
      }
    }
  }



  Future<void> requestAll({required int sdkVersion}) async{
    final String platformNow = convertPlatForm(sdkVersion);
    switch(platformNow){
      case 'ios':
        await [
          Permission.notification,
          Permission.location,
          Permission.photos,
          Permission.camera,
        ].request();
        if(_iosPermission()){
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString(AppElement.permissionIos, 'false');
        }
      case 'new':
        await [
          Permission.photos,
          Permission.location,
          Permission.camera,
          Permission.notification,
        ].request();
        // if(sdkVersion == 34){
        //
        //   await [
        //     Permission.photos,
        //     Permission.location,
        //     Permission.camera,
        //     Permission.notification,
        //   ].request();
        // }
        // else {
        //   await [
        //     Permission.photos,
        //     Permission.location,
        //     Permission.camera,
        //     Permission.notification,
        //   ].request();
        // }
        switch(_androidNewPermission()){
          case true:
            openAppSettingsDeal(
              permission: makeList(sdkVersion),
              sdkVersion: sdkVersion,
            );
          case false:
            null;
            //안드로이드 34관련 퍼미션 문제있어서 해결한 방법 현재는 디폴트되서 주석처리
            // if(sdkVersion == 34){
            //   photos.value = await checkPermission(Permission.photos);
            //   photos.value != PermissionStatus.granted && photos.value != PermissionStatus.permanentlyDenied
            //       ?
            //       CommonWidgets().alertPermission34(
            //       routerContext: Get.context!,
            //       refuse: () async{
            //         Get.back();
            //         CommonWidgets().customAlertDialogSpecial(routerContext: Get.context!);
            //         await [Permission.photos,].request();
            //         Get.back();
            //         await refreshed(androidSdk: sdkVersion, out: false);
            //       }) : null;
            // }
            if(noti.value == PermissionStatus.denied && locations.value == PermissionStatus.granted){
              await requestAll(sdkVersion: sdkVersion);
            }
        }
      case 'old':
        await [
          Permission.storage,
          Permission.location,
          Permission.camera,
          Permission.notification,
        ].request();
        if(_androidOldPermission()){
          openAppSettingsDeal(permission: makeList(sdkVersion),
            sdkVersion: sdkVersion,);
        }
    }
    await refreshed(androidSdk: sdkVersion, out: false);
  }


  Future<PermissionStatus> checkPermission(Permission permission) async{
    PermissionStatus status = await permission.status;
    return status;
  }

  Future<void> refreshed({required int androidSdk, required bool out}) async {
    final String platformNow = convertPlatForm(androidSdk);
    switch(platformNow){
      case 'ios':
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        if (prefs.getString(AppElement.permissionIos) != null) {
            openSystem();
        }
      case 'new':
        photos.value = await checkPermission(Permission.photos);
        locations.value = await checkPermission(Permission.location);
        camera.value = await checkPermission(Permission.camera);
        noti.value = await checkPermission(Permission.notification);
        update();
        if ((photos.value == PermissionStatus.granted || photos.value == PermissionStatus.limited) &&
            locations.value == PermissionStatus.granted
            && camera.value == PermissionStatus.granted &&
            noti.value == PermissionStatus.granted && !out) {
            openSystem();
        }
      case 'old':
        storage.value = await checkPermission(Permission.storage);
        locations.value = await checkPermission(Permission.location);
        camera.value = await checkPermission(Permission.camera);
        noti.value = await checkPermission(Permission.notification);
        update();
        if (storage.value == PermissionStatus.granted &&
            locations.value == PermissionStatus.granted
            && camera.value == PermissionStatus.granted &&
            noti.value == PermissionStatus.granted && !out) {
            openSystem();
        }
    }
  }

  void openAppSettingsDeal({
    required List<String> permission,
    required int sdkVersion
  }){
    _commonWidgets2.permissionSettingsDialog(
        routerContext: Get.context!,
        title: '필수권한 허용 안내',
        content: '아래와 같은 이유로 권한 허용이 필요합니다.',
        permission: permission,
        sdkVersion: sdkVersion,
        confirm: (){
          Get.back();
          AppSettings.openAppSettings(type: AppSettingsType.settings);
        },
        refuse: (){
          Get.back();
        }
    );
  }


  String formatDate() {
    String allTime = DateFormat("yyyy년 MM월 dd일").format(DateTimeConfig().now);
    return allTime;
  }

  void openSystem() {
    requestClear.value = true;
    update();
  }


  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
    deviceHeight.value = await DeviceManager.getDeviceHeight();
  }


  @override
    void onReady() {
      // TODO: implement onReady
      super.onReady();

      debounce(backPage, (_) async {
        if (backPage.value == 30) {
          await SplashController.to.getAppVersion();
          backPage.value = 0;
          update();
        }
      });

      debounce(requestClear, (_) {
        if (requestClear.value) {
          Get.back();
          PermissionPageController.to.backPage.value = 30;
          update();
        }
      });
    }




}


//very important