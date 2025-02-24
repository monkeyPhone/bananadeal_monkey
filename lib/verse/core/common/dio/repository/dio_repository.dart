import 'package:banana_deal_by_monkeycompany/verse/core/common/cache/provider/auth_cache_provider.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_entity.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/json_error.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/provider/dio_provider.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio_convert/provider/dio_convert_provider.dart';

import 'package:banana_deal_by_monkeycompany/verse/core/common/url/common_url.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:dio/dio.dart';

abstract class DioRepository {
  final DioConvertProvider convert;
  const DioRepository({
    required this.convert
  });

  Future<DataDto> getDto({
    required String repositoryName,
    required RestApiEnum restApiEnum,
    required String endPoint,
    Map<String, dynamic>? form,
    bool? limit,
    bool? customLimit,
    bool? isMsg,
  });


  Future<Map<String, dynamic>> getJson({
    required String repositoryName,
    required RestApiEnum restApiEnum,
    required String endPoint,
    Map<String, dynamic>? form,
    bool? limit,
    bool? customLimit,
    bool? isMsg,
  });

  Future<void> sendErrorLog({
    required String url,
    required String dto,
    required String errorContent
  });

  Future<bool> getInternetStatus();

}

class DioRepositoryImpl implements DioRepository {
  final DioProvider dioProvider;
  final AuthCacheProvider authCacheProvider;
  @override
  final DioConvertProvider convert;
  final CommonUrl commonUrl;
  const DioRepositoryImpl({
    required this.dioProvider,
    required this.convert,
    required this.authCacheProvider,
    required this.commonUrl,
  });

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
      RestApiEnum.user =>  await authCacheProvider.getOptions(),
      _ => null,
    };

    final String url = convert.func.getUrl(restApiEnum: restApiEnum, endPoint: endPoint, commonUrl: commonUrl);



    final DataEntity entity = await dioProvider.getEntity(
        url: url,
        dto: repositoryName,
        form: form == null ? null : FormData.fromMap(form),
        options: options
    );

    final StatusEnum statusEnum =
    convert.func.getStatus(
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

    final JsonError? error = convert.func.isError(statusEnum)
        ? jsonErrorFromJson(entity.msg)
        : null;

    final DataDto result = DataDto(
        statusEnum: statusEnum,
        tokenError: statusEnum == StatusEnum.token,
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
      RestApiEnum.user =>  await authCacheProvider.getOptions(),
      _ => null,
    };

    final String url = convert.func.getUrl(restApiEnum: restApiEnum, endPoint: endPoint, commonUrl: commonUrl);



    final DataEntity data = await dioProvider.getEntity(
        url: url,
        dto: repositoryName,
        form: form == null ? null : FormData.fromMap(form),
        options: options
    );

    final Map<String, dynamic> result = data.toJson();

    return result;
  }


  @override
  Future<void> sendErrorLog({
    required String url,
    required String dto,
    required String errorContent
  }) async => await dioProvider.sendErrorLog(url: url, dto: dto, errorContent: errorContent);

  @override
  Future<bool> getInternetStatus() async => await dioProvider.getInternetStatus();

}

