
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_entity.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/dio_entity.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/json_error.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/helper/dio_api_logger.dart';
import 'package:dio/dio.dart';

abstract class DioApiAction {
  const DioApiAction();

  Future<DataEntity> getData({
    required bool isConnect,
    required DioEntity dioEntity,
    required DioApiLogger dioLogger,
    required String bananaOpenUrl
  });


  Future<void> sendErrorReport({
    required int statusCode,
    required String errorContent,
    required String errorApiRoute,
    required DioApiLogger dioLogger,
    required String errorAppRoute,
    required String bananaOpenUrl
  });

}



class DioApiActionImpl implements DioApiAction{
  const DioApiActionImpl();

  @override
  Future<DataEntity> getData({
    required bool isConnect,
    required DioEntity dioEntity,
    required DioApiLogger dioLogger,
    required String bananaOpenUrl
  }) async{
    final DataEntity result = isConnect
        ? await _postApi(
        dioEntity: dioEntity,
        dioLogger: dioLogger,
        bananaOpenUrl: bananaOpenUrl,
    ) : _disConnectData(dioEntity: dioEntity, dioLogger: dioLogger);

    return result;
  }

  DataEntity _disConnectData({
    required DioEntity dioEntity,
    required DioApiLogger dioLogger,
  }) {
    final JsonError err = _DioApiError(dioLogger: dioLogger).errorReturn(
        status: 505,
        apiLocation: dioEntity.dto,
        apiUrl: dioEntity.url,
        dioExceptionType: '연결된 네트워크가 없습니다.',
        logMessage: 'Api error No Wifi',
        error: '연결된 네트워크가 없습니다.'
    );

    final failData = DataEntity(status: 505, msg: jsonErrorToJson(err), result: []);

    return failData;
  }

  Future<DataEntity> _postApi({
    required DioEntity dioEntity,
    required DioApiLogger dioLogger,
    required String bananaOpenUrl
  }) async{
    final BaseOptions baseOptions = BaseOptions(
      connectTimeout: const Duration(seconds: 15),
      sendTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 30),
    );
    final Dio dio = Dio(baseOptions);
    try {
      final Response response =
      switch(dioEntity.form){
        null =>
        switch(dioEntity.options){
          null => await dio.post(dioEntity.url),
          _ => await dio.post(dioEntity.url, options: dioEntity.options)
        },
        _ =>
        switch(dioEntity.options){
          null => await dio.post(dioEntity.url, data: dioEntity.form),
          _ => await dio.post(dioEntity.url, data: dioEntity.form, options: dioEntity.options)
        }
      };

      var data = response.data;

      final DataEntity dataEntity = DataEntity.fromJson(data);

      switch(dataEntity.status){
        case 200:
          return dataEntity;
        default:
          final DataEntity failureData =  await _dioFailure(dataEntity: dataEntity, dioLogger: dioLogger, dioEntity: dioEntity, bananaOpenUrl: bananaOpenUrl);
          return failureData;
      }

    } on DioException catch (e) {
      final DataEntity exceptionData = _dioException(e:e, dioLogger: dioLogger, dioEntity: dioEntity, bananaOpenUrl: bananaOpenUrl);
      return exceptionData;
    } finally{
      dio.close();
    }

  }


  Future<DataEntity> _dioFailure({
    required DataEntity dataEntity,
    required DioApiLogger dioLogger,
    required DioEntity dioEntity,
    required String bananaOpenUrl
  }) async{
    final JsonError err = _DioApiError(dioLogger: dioLogger).errorReturn(
        status: dataEntity.status,
        apiLocation: dioEntity.dto,
        apiUrl: dioEntity.url,
        dioExceptionType: dataEntity.msg,
        logMessage: 'Api error failure',
        error: dataEntity.msg
    );
    if(dataEntity.status == 500){
      await sendErrorReport(
          statusCode: dataEntity.status,
          errorContent: dataEntity.msg,
          errorApiRoute: dioEntity.url,
          errorAppRoute: dioEntity.dto,
          dioLogger: dioLogger,
          bananaOpenUrl: bananaOpenUrl
      )
      ;
    }
    final DataEntity fail = DataEntity(status: dataEntity.status, msg: jsonErrorToJson(err), result: dataEntity.result);

    return fail;
  }


  DataEntity _dioException({
    required DioException e,
    required DioApiLogger dioLogger,
    required DioEntity dioEntity,
    required String bananaOpenUrl
  }){
    final JsonError err = _DioApiError(dioLogger: dioLogger).errorReturn(
        status: 503,
        apiLocation: dioEntity.dto,
        apiUrl: dioEntity.url,
        dioExceptionType: e.type.toString(),
        logMessage: 'Api error DioException',
        error: e.toString()
    );
    sendErrorReport(statusCode: 503, errorContent: '$e', errorApiRoute: dioEntity.url, errorAppRoute: dioEntity.dto, dioLogger: dioLogger, bananaOpenUrl: bananaOpenUrl);

    final DataEntity exception = DataEntity(status: 503, msg: jsonErrorToJson(err), result: []);
    return exception;
  }

  @override
  Future<void> sendErrorReport({
    required int statusCode,
    required String errorContent,
    required String errorApiRoute,
    required DioApiLogger dioLogger,
    required String errorAppRoute,
    required String bananaOpenUrl
  }) async{
    final BaseOptions baseOptions = BaseOptions(
      connectTimeout: const Duration(seconds: 15),
      sendTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 30),
    );
    final Dio dio = Dio(baseOptions);
    final FormData formData = FormData.fromMap(
        {
          "LER_status": '$statusCode',
          "LER_content": errorContent,
          "LER_route": errorApiRoute,
          "LER_mrouter": errorAppRoute,
          "LER_eError" : 'TEST_APP'
        }
    );
    try{
      var response = await dio.post( '$bananaOpenUrl/log/error', data: formData);
      final String message = response.statusCode == 200 ? 'success' : 'fail';
      dioLogger.logger.d('Send_error_report $errorApiRoute, ${response.statusCode} : $message');
    } catch(_){
      dioLogger.logger.d('Send_error_report fail catch e $errorApiRoute, 700 : it is fail send error report unknown situation');
    }finally{
      dio.close();
    }
  }

}


class _DioApiError {
  final DioApiLogger _dioLogger;
  const _DioApiError({
    required DioApiLogger dioLogger
  }) : _dioLogger = dioLogger;

  JsonError errorReturn({required int status, required String apiLocation, required String apiUrl, required String dioExceptionType, required String logMessage, required String error}) {
    _dioLogger.logger.w('$logMessage,  url: $apiUrl, location: $apiLocation', error: error);
    final errorJ = JsonError(apiUrl: apiUrl, status: status, apiLocation: apiLocation, dioExceptionType: dioExceptionType);
    return errorJ;
  }

}