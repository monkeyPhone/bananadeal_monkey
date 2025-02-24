import 'package:banana_deal_by_monkeycompany/package/api/check_version/model/data/version_check_entity.dart';
import 'package:banana_deal_by_monkeycompany/package/common/cache/src/provider/main_cache_provider.dart';
import 'package:banana_deal_by_monkeycompany/package/common/dio/common_dio.dart';
import 'package:banana_deal_by_monkeycompany/package/data/common/data_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';


class RouteRest {
  const RouteRest();

  final String _where = 'RouteRest';


  Future<String> _checkAppVersion() async{
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }

  Future<bool> getAppVersion(CommonDio dio) async {
    final Map<String, dynamic> response = await dio.getJson(endPoint: 'appinfo/version', repositoryName: _where, restApiEnum: RestApiEnum.guest);
    final VersionCheckEntity result = VersionCheckEntity.fromJson(response);
    final String currentVersion = await _checkAppVersion();
    final bool nextPage;

    if(result.status == 200){
      if(result.result.first.auVersion == currentVersion){
        nextPage = true;
      } else {
        nextPage = false;
      }
    }
    else {
      nextPage = false;
    }
    return nextPage;
  }

  Future<DataDto> getDataDto({
    required CommonDio dio,
  }) async{
    final DataDto data = await dio.getDto(repositoryName: _where, restApiEnum: RestApiEnum.user, endPoint: 'member/me', limit: true);
    return data;
  }

  Future<DataDto> logout({
    required CommonDio dio,
    required int mIdx,
    required bool how,
  }) async{

    final Map<String, dynamic> form = {
      "M_idx": mIdx,
      "how" : how,
    };

    final DataDto dto = await dio.getDto(repositoryName: _where, restApiEnum: RestApiEnum.guest, endPoint: 'member/logout', form: form);

    // final JsonData result = await _dio.getJson(url: apiRoute, dto: _dto, form: formData);
    return dto;
  }


  Future<bool> settingModelUUID({
    required CommonDio dio,
    required MainCacheProvider mainCache,
    required String compareModel,
    required String compareUUID,
  }) async{

    final bool uuid = await _mixinUUID(
        dio: dio, compare:compareUUID);
    final bool model = await _mixinModel(compare: compareModel,dio: dio, mainCache: mainCache);

    if(uuid && model){
      return true;
    }
    else{
      return false;
    }
  }

  Future<bool> _mixinUUID({
    required CommonDio dio,
    required String compare,
  }) async{
    if(defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform ==  TargetPlatform.macOS){
      await FirebaseMessaging.instance.getAPNSToken();
    }
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
          final DataDto result = await dio.getDto(repositoryName: _where, restApiEnum: RestApiEnum.user, endPoint: 'member/uuid', form: form,);

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
    required CommonDio dio,
    required MainCacheProvider mainCache,
    required String compare,
  }) async{
    if(kIsWeb){
      return true;
    } else{
      final String model = await mainCache.deviceFunc.getDeviceInfo();
      if(compare == model){
        return true;
      }
      else if(compare == ''|| model != compare){
        final Map<String, dynamic> form = {
          "M_model": model,
        };
        final DataDto result = await dio.getDto(repositoryName: _where, restApiEnum: RestApiEnum.user, endPoint: 'member/edit/model', form: form,);


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


}