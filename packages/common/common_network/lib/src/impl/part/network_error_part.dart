import 'package:common_network/src/impl/part/network_helper_part.dart';
import 'package:common_network/src/models/data_entity.dart';
import 'package:dio/dio.dart';

class NetworkErrorPart {
  final String bananaOpenUrl;
  const NetworkErrorPart({
    required this.bananaOpenUrl,
  });

  Future<DataEntity> dioFailure({
    required String url,
    required String where,
    required DataEntity entity,
    required NetworkHelperPart helperPart,
  }) async{
    // final DataError err = func.dataError(
    //     helper: helper,
    //     status: entity.status,
    //     where: where,
    //     url: url,
    //     dioExceptionType: entity.msg,
    //     logMessage: 'Api error failure',
    //     error: entity.msg
    // );
    // final String msg =  dataErrorToJson(err);
    if(entity.status == 500){
      await sendErrorReport(
          entity: entity,
          url: url,
          where: where,
          helperPart: helperPart,
      );
    }

    return entity;
  }

  Future<DataEntity> dioException({
    required DioException e,
    required String url,
    required String where,
    required NetworkHelperPart helperPart,
  }) async{
    // final DataError err = func.dataError(
    //     helper: helper,
    //     status: 503,
    //     where: where,
    //     url: url,
    //     dioExceptionType: '${e.type}',
    //     logMessage: 'Api error DioException',
    //     error: '$e'
    // );
    // final String msg =  dataErrorToJson(err);

    final DataEntity dataEntity = DataEntity(status: 503, msg: '', result: []);

    await sendErrorReport(
        entity: dataEntity,
        url: url,
        where: where,
        helperPart: helperPart,
    );

    return dataEntity;
  }

  DataEntity dioDisConnect(
      //     {
      //   required Func func,
      //   required Helper helper,
      //   required String url,
      //   required String where,
      // }
      ) {
    // final DataError err = func.dataError(
    //     helper: helper,
    //     status: 503,
    //     where: where,
    //     url: url,
    //     dioExceptionType: '연결된 네트워크가 없습니다.',
    //     logMessage: 'Api error No Wifi',
    //     error: '연결된 네트워크가 없습니다.'
    // );
    // final String msg =  dataErrorToJson(err);

    final failData = DataEntity(status: 505, msg: '', result: []);

    return failData;
  }


  Future<void> sendErrorReport({
    required DataEntity entity,
    required NetworkHelperPart helperPart,
    required String where,
    required String url
  }) async{

    final Dio dio = Dio(helperPart.baseOptions);
    final FormData formData = FormData.fromMap(
        {
          "LER_status": '${entity.status}',
          "LER_content": entity.msg,
          "LER_route": url,
          "LER_mrouter": where,
          "LER_eError" : ''
        }
    );
    try{
      var response = await dio.post( '$bananaOpenUrl/log/error', data: formData);
      final String message = response.statusCode == 200 ? 'success' : 'fail';
      helperPart.logger.d('Send_error_report $url, ${response.statusCode} : $message');
    } catch(_){
      helperPart.logger.d('Send_error_report fail catch e $url, 700 : it is fail send error report unknown situation');
    }finally{
      dio.close();
    }
  }


}