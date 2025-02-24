import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:permission_handler/permission_handler.dart';

class DeviceFunc {
  final _DeviceFuncHelper _helper = const _DeviceFuncHelper();
  final DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();
  DeviceFunc();

  String convertIoSName(String iosModel) => _helper.convertIoSName(iosModel);

  Future<int> getSdkVersion() async{
    switch(!kIsWeb){
      case true:
        if (Platform.isIOS) {
          return 0;
        } else {
          if(Platform.isAndroid){
            final int sdkVersion = await _getAndroidInfo();
            return sdkVersion;
          } else {
            return 0;
          }
        }
      case false:
        return 0;
    }
  }

  Future<PermissionStatus> checkPermission(Permission permission) async {
    try{
      final PermissionStatus status = await permission.status;
      return status;
    }catch(_){
      return PermissionStatus.denied;
    }
  }

  bool isIos() => Platform.isIOS;

  Future<String> getPlatform() async{
    if(!kIsWeb){
      switch(Platform.isIOS){
        case true:
          return 'ios';
        case false:
          switch(Platform.isAndroid){
            case true:
              final int sdkVersion = await _getAndroidInfo();
              final String result =
              sdkVersion > 33
                  ? 'android34'
                  : sdkVersion == 33
                  ? 'androidNew'
                  : 'androidOld';
              return result;
            case false:
              return 'etc';
          }
      }
    } else{
      return 'etc';
    }
  }


  Future<int> _getAndroidInfo() async {
    AndroidDeviceInfo androidInfo = await _deviceInfo.androidInfo;
    return androidInfo.version.sdkInt;
  }

  Future<String> getDeviceInfo() async{

    if(Platform.isIOS)
    {
      IosDeviceInfo iosInfo = await _deviceInfo.iosInfo;
      return iosInfo.utsname.machine.contains('iPad') ? 'iPad' : convertIoSName(iosInfo.utsname.machine);
    } else{
      AndroidDeviceInfo androidInfo = await _deviceInfo.androidInfo;
      return  androidInfo.model;
    }

  }

  Future<bool> isHeight60() async{
    if(!kIsWeb){
      final String device = await getDeviceInfo();
      if( device == '' || Platform.isAndroid || device.contains('iPhone SE') || device == 'iPad'){
        return  false;
      } else {
        return true;
      }
    } else{
      return false;
    }

  }

}

class _DeviceFuncHelper {
  const _DeviceFuncHelper();

  String convertIoSName(String iosModel){
    switch(iosModel){

      case 'iPad14,5':
        return 'iPad Pro (12.9 6th Gen)';

      case 'iPad14,6':
        return 'iPad Pro (12.9 6th Gen)';

      case 'iPad14,3':
        return 'iPad Pro (11 4th Gen)';

      case 'iPad14,4':
        return 'iPad Pro (11 4th Gen)';

      case 'iPhone16,2':
        return 'iPhone 15 Pro Max';

      case 'iPhone16,1':
        return 'iPhone 15 Pro';

      case 'iPhone15,5':
        return 'iPhone 15 Plus';

      case 'iPhone15,4':
        return 'iPhone 15';

      case 'iPhone15,3':
        return 'iPhone 14 Pro Max';

      case 'iPhone15,2':
        return 'iPhone 14 Pro';

      case 'iPhone14,8':
        return 'iPhone 14 Plus';

      case 'iPhone14,7':
        return 'iPhone 14';

      case 'iPhone14,6':
        return 'iPhone SE (3rd generation)';

      case 'iPad13,16':
        return 'iPad Air 5';

      case 'iPad13,17':
        return 'iPad Air 5';

      case 'iPad13,16/iPad13,17':
        return 'iPad Air 5';

      case 'iPhone14,4':
        return 'iPhone 13 mini';

      case 'iPhone14,3':
        return 'iPhone 13 Pro Max';

      case 'iPhone14,2':
        return 'iPhone 13 Pro';

      case 'iPhone14,5':
        return 'iPhone 13';

      case 'iPad12,1':
        return 'iPad (9th Gen)';

      case 'iPad12,2':
        return 'iPad (9th Gen)';

      case 'iPad12,1/iPad12,2':
        return 'iPad (9th Gen)';

      case 'iPad14,1':
        return 'iPad mini 6';

      case 'iPad14,2':
        return 'iPad mini 6';

      case 'iPad14,1/iPad14,2':
        return 'iPad mini 6';

      case 'iPad13,4':
        return 'iPad Pro (11 3rd Gen)';

      case 'iPad13,5':
        return 'iPad Pro (11 3rd Gen)';

      case 'iPad13,6':
        return 'iPad Pro (11 3rd Gen)';

      case 'iPad13,7':
        return 'iPad Pro (11 3rd Gen)';

      case 'iPad13,4/iPad13,5/iPad13,6/iPad13,7':
        return 'iPad Pro (11 3rd Gen)';

      case 'iPad13,8':
        return 'iPad Pro (12.9 5th Gen)';

      case 'iPad13,9':
        return 'iPad Pro (12.9 5th Gen)';

      case 'iPad13,10':
        return 'iPad Pro (12.9 5th Gen)';

      case 'iPad13,11':
        return 'iPad Pro (12.9 5th Gen)';

      case 'iPad13,8/iPad13,9/iPad13,10/iPad13,11':
        return 'iPad Pro (12.9 5th Gen)';

      case 'iPhone13,1':
        return 'iPhone 12 Mini';

      case 'iPhone13,4':
        return 'iPhone 12 Pro Max';

      case 'iPhone13,3':
        return 'iPhone 12 Pro';

      case 'iPhone13,2':
        return 'iPhone 12';

      case 'iPhone12,8':
        return 'iPhone SE (2nd generation)';

      case 'iPad8,11':
        return 'iPad Pro (12.9 4th Gen)';

      case 'iPad8,12':
        return 'iPad Pro (12.9 4th Gen)';

      case 'iPad8,11/iPad8,12':
        return 'iPad Pro (12.9 4th Gen)';

      case 'iPad8,10':
        return 'iPad Pro (11 2nd Gen)';

      case 'iPad8,9':
        return 'iPad Pro (11 2nd Gen)';

      case 'iPad8,10/iPad8,9':
        return 'iPad Pro (11 2nd Gen)';

      case 'iPad13,1':
        return 'iPad Air 4';

      case 'iPad13,2':
        return 'iPad Air 4';

      case 'iPad13,1/iPad13,2':
        return 'iPad Air 4';

      case 'iPad11,6':
        return 'iPad (8th Gen)';

      case 'iPad11,7':
        return 'iPad (8th Gen)';

      case 'iPad11,6/iPad11,7':
        return 'iPad (8th Gen)';

      case 'iPhone12,5':
        return 'iPhone 11 Pro Max';

      case 'iPhone12,3':
        return 'iPhone 11 Pro';

      case 'iPhone12,1':
        return 'iPhone 11';

      case 'iPad11,2':
        return 'iPad mini 5';

      case 'iPad mini 5':
        return 'iPad11,1';

      case 'iPad11,1/iPad11,2':
        return 'iPad mini 5';

      case 'iPad11,3':
        return 'iPad Air 3';

      case 'iPad11,4':
        return 'iPad Air 3';

      case 'iPad11,3/iPad11,4':
        return 'iPad Air 3';

      case 'iPad7,11':
        return 'iPad (7th Gen)';

      case 'iPad7,12':
        return 'iPad (7th Gen)';

      case 'iPad7,11/iPad7,12':
        return 'iPad (7th Gen)';

      case 'iPhone11,4':
        return 'iPhone XS Max';

      case 'iPhone11,6':
        return 'iPhone XS Max';

      case 'iPhone11,4/iPhone11,6':
        return 'iPhone XS Max';

      case 'iPhone11,2':
        return 'iPhone XS';

      case 'iPhone11,8':
        return 'iPhone XR';

      case 'iPad8,5':
        return 'iPad Pro (12.9 3rd Gen)';

      case 'iPad8,6':
        return 'iPad Pro (12.9 3rd Gen)';

      case 'iPad8,7':
        return 'iPad Pro (12.9 3rd Gen)';

      case 'iPad8,8':
        return 'iPad Pro (12.9 3rd Gen)';

      case 'iPad8,5/iPad8,6/iPad8,7/iPad8,8':
        return 'iPad Pro (12.9 3rd Gen)';

      case 'iPad8,1':
        return 'iPad Pro (11)';

      case 'iPad8,2':
        return 'iPad Pro (11)';

      case 'iPad8,3':
        return 'iPad Pro (11)';

      case 'iPad8,4':
        return 'iPad Pro (11)';

      case 'iPad8,1/iPad8,2/iPad8,3/iPad8,4':
        return 'iPad Pro (11)';

      case 'iPad7,5':
        return 'iPad (6th Gen)';

      case 'iPad7,6':
        return 'iPad (6th Gen)';

      case 'iPad7,5/iPad7,6':
        return 'iPad (6th Gen)';

      case 'iPhone10,3':
        return 'iPhone X';

      case 'iPhone10,6':
        return 'iPhone X';

      case 'iPhone10,3/iPhone10,6':
        return 'iPhone X';

      case 'iPhone10,2':
        return 'iPhone 8 Plus';

      case 'iPhone10,5':
        return 'iPhone 8 Plus';

      case 'iPhone10,2/iPhone10,5':
        return 'iPhone 8 Plus';

      case 'iPhone10,1':
        return 'iPhone 8';

      case 'iPhone10,4':
        return 'iPhone 8';

      case 'iPhone10,1/iPhone10,4':
        return 'iPhone 8';

      case 'iPad7,1':
        return 'iPad Pro (12.9 2nd Gen)';

      case 'iPad7,2':
        return 'iPad Pro (12.9 2nd Gen)';

      case 'iPad7,1/iPad7,2':
        return 'iPad Pro (12.9 2nd Gen)';

      case 'iPad7,3':
        return 'iPad Pro (10.5)';

      case 'iPad7,4':
        return 'iPad Pro (10.5)';

      case 'iPad7,3/iPad7,4':
        return 'iPad Pro (10.5)';

      case 'iPad6,11':
        return 'iPad (5th Gen)';

      case 'iPad6,12':
        return 'iPad (5th Gen)';

      case 'iPad6,11/iPad6,12':
        return 'iPad (5th Gen)';

      case 'iPad6,3':
        return 'iPad Pro (9.7)';

      case 'iPad6,4':
        return 'iPad Pro (9.7)';

      case 'iPad6,3/iPad6,4':
        return 'iPad Pro (9.7)';

      default:
        return 'iPhone Unknown';
    }
  }
}
