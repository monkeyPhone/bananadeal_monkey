import 'package:banana_deal_by_monkeycompany/package/data/address_vo.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/cache/model/func/device_func.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_string.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserInfoAction{
  final String _repo = 'UserInfoAction';

  const UserInfoAction();

  Future<bool> logout({
    required DioRepository dio,
    required SharedPreferences mainPrefs,
    required int mIdx,
    required bool how,
  }) async{

    final Map<String, dynamic> form = {
      "M_idx": mIdx,
      "how" : how,
    };

    final DataDto result = await dio.getDto(repositoryName: _repo, restApiEnum: RestApiEnum.guest, endPoint: 'member/logout', form: form);

    // final JsonData result = await _dio.getJson(url: apiRoute, dto: _dto, form: formData);


    switch(result.statusEnum){
      case StatusEnum.success:
        await  mainPrefs.clear();
        return true;
      default:
        return false;
    }
  }


  Future<DataDto> getDataDto({
    required DioRepository dio,
  }) async{
    final DataDto data = await dio.getDto(repositoryName: _repo, restApiEnum: RestApiEnum.user, endPoint: 'member/me', limit: true);
    return data;
  }



  Future<bool> settingModelUUID({
    required String compareModel,
    required String compareUUID,
    required DioRepository dio,
    required DeviceFunc deviceFunc
  }) async{

    final bool uuid = await _mixinUUID(
        dio: dio,
        compare:compareUUID);
    final bool model = await _mixinModel(compare: compareModel,dio: dio, deviceFunc: deviceFunc);

    if(uuid && model){
      return true;
    }
    else{
      return false;
    }
  }

  Future<bool> _mixinUUID({
    required String compare,
    required DioRepository dio,
  }) async{
    defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform ==  TargetPlatform.macOS
        ? await FirebaseMessaging.instance.getAPNSToken()
        : null;
    if(!kIsWeb){
      String? uuid =  await FirebaseMessaging.instance.getToken();
      if(uuid == null){
        return false;
      }
      else{
        if(uuid == compare){
          return true;
        }
        else if(uuid != compare){

          final Map<String, dynamic> form = {
            "M_uuid": uuid,
          };
          final DataDto result = await dio.getDto(repositoryName: _repo, restApiEnum: RestApiEnum.user, endPoint: 'member/uuid', form: form,);

          return switch(result.statusEnum){
            StatusEnum.success => true,
            _ => false
          };
        }
        else{
          return false;
        }
      }
    } else {
      return true;
    }

  }

  Future<bool> _mixinModel({
    required String compare,
    required DioRepository dio,
    required DeviceFunc deviceFunc,
  }) async{
    if(kIsWeb){
      return true;
    } else{
      final String model = await deviceFunc.getDeviceInfo();
      if(compare == model){
        return true;
      }
      else if(compare == ''|| model != compare){
        final Map<String, dynamic> form = {
          "M_model": model,
        };
        final DataDto result = await dio.getDto(repositoryName: _repo, restApiEnum: RestApiEnum.user, endPoint: 'member/edit/model', form: form,);


        return switch(result.statusEnum){
          StatusEnum.success => true,
          _ => false,
        };
      }
      else{
        return false;
      }
    }
  }



  Future<int> setPosition({
    required SharedPreferences mainPrefs,
  }) async{
    final stopwatch = Stopwatch()..start();
    try{
      final Position position = await Geolocator.getCurrentPosition(
          locationSettings: const LocationSettings());
      await mainPrefs.setDouble(myLat, position.latitude);
      await mainPrefs.setDouble(myLnt, position.longitude);
      stopwatch.stop();
      return stopwatch.elapsedMilliseconds;
    } catch(_){
      await mainPrefs.setDouble(myLat, 37.5760222);
      await mainPrefs.setDouble(myLnt, 126.9769000);
      stopwatch.stop();
      return stopwatch.elapsedMilliseconds;
    }
  }

}