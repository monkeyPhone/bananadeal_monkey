import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';

abstract class DioConvertApiFunc {
  const DioConvertApiFunc();

  String getUrl({
    required RestApiEnum restApiEnum,
    required String endPoint,
    required CommonUrl commonUrl
  });


  StatusEnum getStatus({required int status , bool? routeCase});


  bool isError(StatusEnum statusEnum);

}

class DioConvertApiFuncImpl implements DioConvertApiFunc {
  const DioConvertApiFuncImpl();

  @override
  String getUrl({
    required RestApiEnum restApiEnum,
    required String endPoint,
    required CommonUrl commonUrl
  }) => switch(restApiEnum){
    RestApiEnum.guest => '${commonUrl.bananaOpenUrl}/$endPoint',
    RestApiEnum.user =>  '${commonUrl.bananaPrivateUrl}/$endPoint',
    RestApiEnum.kakao =>  '${commonUrl.bananaKakaoLogin}/$endPoint',
    RestApiEnum.apple =>  '${commonUrl.bananaAppleLogin}/$endPoint',
    RestApiEnum.chatApi => '${commonUrl.bananaChatApi}/$endPoint',
    RestApiEnum.chatImg => '${commonUrl.bananaChatImgApi}/$endPoint',
  };

  @override
  StatusEnum getStatus({required int status , bool? routeCase}) {
    final StatusEnum statusEnum;

    if(status == 200){
      statusEnum = switch(routeCase){
        null => StatusEnum.success,
        _ => switch(routeCase){
          true => StatusEnum.success,
          false => StatusEnum.later
        }
      };
    }

    else if(status <= 500){
      if(status == 401){
        statusEnum = StatusEnum.token;
      }
      else{
        statusEnum = StatusEnum.failure;
      }
    }

    else if(status == 503){
      statusEnum = StatusEnum.exception;
    }

    else if(status == 505){
      statusEnum = StatusEnum.network;
    }

    else {
      statusEnum = StatusEnum.error;
    }

    return statusEnum;
  }

  @override
  bool isError(StatusEnum statusEnum){
    return statusEnum == StatusEnum.failure ||  statusEnum == StatusEnum.exception || statusEnum == StatusEnum.network || statusEnum == StatusEnum.error;
  }

}