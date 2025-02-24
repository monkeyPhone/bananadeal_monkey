import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get.dart';
import '../components/future_loading_overlay.dart';
import '../css/size.dart';
import '../modules/src/src_components/controllers/managers/ios_manager.dart';

class DeviceManager{


  static final DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();

  static Future<String> getDeviceInfo() async{

    if(Platform.isIOS)
    {
      IosDeviceInfo iosInfo = await _deviceInfo.iosInfo;
      return iosInfo.utsname.machine.contains('iPad') ? 'iPad' : IosManager.convertIoSName(iosInfo.utsname.machine);
    } else{
      return  '';
    }

  }

  Future<int> getAndroidInfo() async {
    AndroidDeviceInfo androidInfo = await _deviceInfo.androidInfo;
    return androidInfo.version.sdkInt;
  }

  static Future<double> getDeviceHeight() async{
    try{
      final String device = await getDeviceInfo();
      if( device == '' || Platform.isAndroid || device.contains('iPhone SE') || device == 'iPad'){
        return  WidgetSize(Get.context!).height60px+WidgetSize(Get.context!).sizedBox16;
      } else {
        return  WidgetSize(Get.context!).height60px;
      }
    } catch(_){
      return  WidgetSize(Get.context!).height60px;
    }
  }



  static String emojiConvert(String input){
    RegExp emojiRegex = RegExp(
        r'[\uD800-\uDFFF\u2600-\u26FF\u2700-\u27BF]');
    String result = input.replaceAll(emojiRegex, '');
    return result;
  }

  static Future<bool> _waitForClients() async {
    await Future.delayed(Duration(milliseconds: 500));
    return true;
  }

  static Future<void> overLayClients() async{
    await showFutureLoadingOverlay(
        context: Get.context!,
        expanded: true,
        future: _waitForClients()
    );
  }



}