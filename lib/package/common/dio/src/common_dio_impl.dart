import 'package:banana_deal_by_monkeycompany/package/common/cache/common_cache.dart';
import 'package:banana_deal_by_monkeycompany/package/common/dio/common_dio.dart';
import 'package:banana_deal_by_monkeycompany/package/common/dio/src/part/common_dio_action.dart';
import 'package:banana_deal_by_monkeycompany/package/common/dio/src/part/common_dio_func.dart';
import 'package:banana_deal_by_monkeycompany/package/common/dio/src/part/common_dio_helper.dart';
import 'package:banana_deal_by_monkeycompany/package/common/url/common_url.dart';
import 'package:banana_deal_by_monkeycompany/package/data/common/data_dto.dart';
import 'package:banana_deal_by_monkeycompany/package/data/common/data_entity.dart';
import 'package:banana_deal_by_monkeycompany/package/data/common/json_error.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';

class CommonDioImpl implements CommonDio {
  final CommonUrl _commonUrl;
  final CommonCache _commonCache;
  CommonDioImpl({
    required CommonUrl commonUrl,
    required CommonCache commonCache,
  }) : _commonUrl = commonUrl,
       _commonCache = commonCache;

  final CommonDioAction _action = const CommonDioAction();
  final CommonDioFunc _func = const CommonDioFunc();
  final CommonDioHelper _helper = CommonDioHelper();
  final Connectivity _connectivity = Connectivity();

  Future<Options> _getDioOptions() async{
    String token = await _commonCache.authCacheProvider.getToken();
    final Options options = Options(
        headers: {
          "Content-Type": "application/json",
          "Authorization":
          "Bearer $token",
        }
    );
    return options;
  }

  @override
  Future<DataDto> getDto({
    required String repositoryName,
    required RestApiEnum restApiEnum,
    required String endPoint,
    Map<String, dynamic>? form,
    bool? limit,
    bool? customLimit,
    bool? isMsg,
  }) async{

    final Options? options = switch(restApiEnum){
      RestApiEnum.user =>  await _getDioOptions(),
      _ => null,
    };

    final String url = _func.getUrl(restApiEnum: restApiEnum, endPoint: endPoint, commonUrl: _commonUrl);
    
    final DataEntity entity = await _action.getEntity(
        url: url,
        dto: repositoryName,
        form: form == null ? null : FormData.fromMap(form),
        options: options, helper: _helper, bananaOpenUrl: _commonUrl.bananaOpenUrl, connectivity: _connectivity
    );

    final StatusEnum statusEnum =
    _func.getStatus(
        status: entity.status,
        routeCase: limit == true
            ? entity.result.isNotEmpty
            : limit == false
            ? customLimit
            :  null
    );

    final List<dynamic> data = switch(statusEnum){
      StatusEnum.success =>
      switch(isMsg){
        null => entity.result,
        _ => [entity.msg]
      },
      _=> []
    };

    final JsonError? error = _func.isError(statusEnum)
        ? jsonErrorFromJson(entity.msg)
        : null;

    final DataDto result = DataDto(
        statusEnum: statusEnum,
        data: data,
        error: error
    );

    return result;
  }


  @override
  Future<Map<String, dynamic>> getJson({
    required String repositoryName,
    required RestApiEnum restApiEnum,
    required String endPoint,
    Map<String, dynamic>? form,
    bool? limit,
    bool? customLimit,
    bool? isMsg,
  }) async{

    final Options? options = switch(restApiEnum){
      RestApiEnum.user =>  await _getDioOptions(),
      _ => null,
    };

    final String url = _func.getUrl(restApiEnum: restApiEnum, endPoint: endPoint, commonUrl: _commonUrl);



    final DataEntity data = await _action.getEntity(
        url: url,
        dto: repositoryName,
        form: form == null ? null : FormData.fromMap(form),
        options: options, helper: _helper, bananaOpenUrl: _commonUrl.bananaOpenUrl, connectivity: _connectivity, 
    );

    final Map<String, dynamic> result = data.toJson();

    return result;
  }


  @override
  Future<void> sendErrorLog({
    required String url,
    required String dto,
    required String errorContent
  }) async => await _action.sendErrorReport(
      bananaOpenUrl: _commonUrl.bananaOpenUrl,
      statusCode: 800,
      errorContent: errorContent,
      errorApiRoute: url,
      helper: _helper,
      errorAppRoute: errorContent
  );
  

  @override
  Future<bool> getInternetStatus() async => await _action.getInternetStatus(connectivity: _connectivity);

}