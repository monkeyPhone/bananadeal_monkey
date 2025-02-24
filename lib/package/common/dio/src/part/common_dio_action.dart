import 'package:banana_deal_by_monkeycompany/package/common/dio/src/part/common_dio_helper.dart';
import 'package:banana_deal_by_monkeycompany/package/data/common/data_entity.dart';
import 'package:banana_deal_by_monkeycompany/package/data/common/dio_entity.dart';
import 'package:banana_deal_by_monkeycompany/package/data/common/json_error.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';

class CommonDioAction {
  const CommonDioAction();

  Future<DataEntity> _postApi({
    required DioEntity dioEntity,
    required CommonDioHelper helper,
    required String bananaOpenUrl,
  }) async{
    final Dio dio = Dio(helper.baseOptions);
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
          final DataEntity failureData =  await _dioFailure(dataEntity: dataEntity, helper: helper, dioEntity: dioEntity, bananaOpenUrl: bananaOpenUrl);
          return failureData;
      }

    } on DioException catch (e) {
      final DataEntity exceptionData = await _dioException(e:e, helper: helper, dioEntity: dioEntity, bananaOpenUrl: bananaOpenUrl);
      return exceptionData;
    } finally{
      dio.close();
    }

  }

  JsonError _errorReturn({
    required CommonDioHelper helper,
    required int status, required String apiLocation, required String apiUrl, required String dioExceptionType, required String logMessage, required String error}) {
    helper.logger.w('$logMessage,  url: $apiUrl, location: $apiLocation', error: error);
    final errorJ = JsonError(apiUrl: apiUrl, status: status, apiLocation: apiLocation, dioExceptionType: dioExceptionType);
    return errorJ;
  }


  Future<DataEntity> _dioFailure({
    required DataEntity dataEntity,
    required CommonDioHelper helper,
    required DioEntity dioEntity,
    required String bananaOpenUrl
  }) async{
    final JsonError err = _errorReturn(
        helper: helper,
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
          helper: helper,
          bananaOpenUrl: bananaOpenUrl
      )
      ;
    }
    final DataEntity fail = DataEntity(status: dataEntity.status, msg: jsonErrorToJson(err), result: dataEntity.result);

    return fail;
  }

  Future<DataEntity> _dioException({
    required DioException e,
    required CommonDioHelper helper,
    required DioEntity dioEntity,
    required String bananaOpenUrl
  }) async{
    final JsonError err = _errorReturn(
        status: 503,
        apiLocation: dioEntity.dto,
        apiUrl: dioEntity.url,
        dioExceptionType: e.type.toString(),
        logMessage: 'Api error DioException',
        error: e.toString(),
        helper: helper,
    );
    await sendErrorReport(
        statusCode: 503, errorContent: '$e', errorApiRoute: dioEntity.url, errorAppRoute: dioEntity.dto, helper: helper, bananaOpenUrl: bananaOpenUrl);

    final DataEntity exception = DataEntity(status: 503, msg: jsonErrorToJson(err), result: []);
    return exception;
  }

  DataEntity _disConnectData({
    required DioEntity dioEntity,
    required CommonDioHelper helper,
  }) {
    final JsonError err = _errorReturn(
        helper: helper,
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

  Future<void> sendErrorReport({
    required int statusCode,
    required String errorContent,
    required String errorApiRoute,
    required CommonDioHelper helper,
    required String errorAppRoute,
    required String bananaOpenUrl
  }) async{

    final Dio dio = Dio(helper.baseOptions);
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
      helper.logger.d('Send_error_report $errorApiRoute, ${response.statusCode} : $message');
    } catch(_){
      helper.logger.d('Send_error_report fail catch e $errorApiRoute, 700 : it is fail send error report unknown situation');
    }finally{
      dio.close();
    }
  }



  Future<DataEntity> _getData({
    required bool isConnect,
    required DioEntity dioEntity,
    required CommonDioHelper helper,
    required String bananaOpenUrl
  }) async{
    final DataEntity result = isConnect
        ? await _postApi(
      dioEntity: dioEntity,
      helper: helper,
      bananaOpenUrl: bananaOpenUrl,
    ) : _disConnectData(dioEntity: dioEntity, helper: helper);

    return result;
  }

  Future<bool> getInternetStatus({
    required Connectivity connectivity
  }) async{
    final connectivityResult = await connectivity.checkConnectivity();
    final bool isConnect =
        connectivityResult.contains(ConnectivityResult.wifi) ||
            connectivityResult.contains(ConnectivityResult.ethernet) ||
            connectivityResult.contains(ConnectivityResult.mobile);

    return isConnect;
  }


  Future<DataEntity> getEntity({
    required String url,
    required String dto,
    required CommonDioHelper helper,
    required String bananaOpenUrl,
    required Connectivity connectivity,
    FormData? form,
    Options? options,
  }) async {
    final bool isConnect = await getInternetStatus(connectivity: connectivity);
    final DioEntity dioEntity = DioEntity(url: url, dto: dto, form: form, options: options,);
    final DataEntity data = await _getData(isConnect: isConnect, dioEntity: dioEntity, helper: helper, bananaOpenUrl: bananaOpenUrl);

    return data;
  }

}