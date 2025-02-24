import 'package:common_cache/common_cache.dart';
import 'package:common_network/src/impl/part/network_helper_part.dart';
import 'package:common_network/src/models/data_error.dart';
import 'package:common_url/common_url.dart';
import 'package:dio/dio.dart';
import 'package:utils/utils.dart';

class NetworkFuncPart {
  final CommonUrl commonUrl;
  final CommonCache commonCache;
  const NetworkFuncPart({
    required this.commonUrl,
    required this.commonCache,
  });

  DataError dataError({
    required NetworkHelperPart helperPart,
    required int status,
    required String where,
    required String url,
    required String dioExceptionType,
    required String logMessage,
    required String error
  }) {
    helperPart.logger.w('$logMessage,  url: $url, location: $where', error: error);
    final DataError result = DataError(url: url, status: status, where: where, dioExceptionType: dioExceptionType);
    return result;
  }

  EnumStatus getStatus({required int status , bool? isLimit}) {
    final EnumStatus enumStatus;

    if(status == 200){
      enumStatus = switch(isLimit){
        null => EnumStatus.success,
        _ => switch(isLimit){
          true => EnumStatus.success,
          false => EnumStatus.later
        }
      };
    }

    else if(status < 500){
      if(status == 401){
        enumStatus = EnumStatus.token;
      }
      else{
        enumStatus = EnumStatus.failure;
      }
    }

    else if(status > 500 && status <= 503){
      enumStatus = EnumStatus.exception;
    }

    else if(status == 505){
      enumStatus = EnumStatus.network;
    }

    else {
      enumStatus = EnumStatus.error;
    }

    return enumStatus;
  }


  String getUrl({
    required EnumRestapi enumRestApi,
    required String endPoint,
  }) => switch(enumRestApi){
    EnumRestapi.guest => '${commonUrl.bananaOpenUrl}/$endPoint',
    EnumRestapi.user =>  '${commonUrl.bananaPrivateUrl}/$endPoint',
    EnumRestapi.kakao =>  '${commonUrl.bananaKakaoLogin}/$endPoint',
    EnumRestapi.apple =>  '${commonUrl.bananaAppleLogin}/$endPoint',
    EnumRestapi.chatApi => '${commonUrl.bananaChatApi}/$endPoint',
    EnumRestapi.chatImg => '${commonUrl.bananaChatImgApi}/$endPoint',
  };


  Options getDioOptions() {

    final String token = commonCache.authCacheProvider.getTokenSelf();

    final Options options = Options(
        headers: {
          "Content-Type": "application/json",
          "Authorization":
          "Bearer $token",
        }
    );
    return options;
  }


}