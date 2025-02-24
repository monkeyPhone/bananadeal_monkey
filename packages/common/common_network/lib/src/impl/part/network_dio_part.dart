import 'package:common_network/src/impl/part/network_connect_part.dart';
import 'package:common_network/src/impl/part/network_error_part.dart';
import 'package:common_network/src/impl/part/network_helper_part.dart';
import 'package:common_network/src/models/data_entity.dart';
import 'package:dio/dio.dart';

class NetworkDioPart {
  final String bananaOpenUrl;
  const NetworkDioPart({
    required this.bananaOpenUrl,
  });

  Future<DataEntity> _postApi({
    required String url,
    required String where,
    FormData? form,
    Options? options,
    required NetworkHelperPart helperPart,
    required NetworkErrorPart errorPart,
  }) async{

    final Dio dio = Dio(helperPart.baseOptions);

    try {
      final Response response =
      switch(form){
        null =>
        switch(options){
          null => await dio.post(url),
          _ => await dio.post(url, options: options)
        },
        _ =>
        switch(options){
          null => await dio.post(url, data: form),
          _ => await dio.post(url, data: form, options: options)
        }
      };

      var data = response.data;

      final DataEntity dataEntity = DataEntity.fromJson(data);

      switch(dataEntity.status){
        case 200:
          return dataEntity;
        default:
          final DataEntity failureData =  await errorPart.dioFailure(
              entity: dataEntity,
              helperPart: helperPart,
              url: url,
              where: where,
          );
          return failureData;
      }

    } on DioException catch (e) {
      final DataEntity exceptionData = await errorPart.dioException(
          e:e,
          helperPart: helperPart,
          url: url, where: where,
      );
      return exceptionData;
    } finally{
      dio.close();
    }

  }

  Future<DataEntity> _getData({
    required NetworkConnectPart connectPart,
    required String url,
    required String where,
    required NetworkHelperPart helperPart,
    required NetworkErrorPart errorPart,
  }) async{
    final bool isConnect = await connectPart.getInternetStatus();
    final DataEntity result = isConnect
        ? await _postApi(
      helperPart: helperPart,
      url: url,
      where: where,
      errorPart: errorPart,
    )
        : errorPart.dioDisConnect();
    return result;
  }

  Future<DataEntity> getEntity({
    required String url,
    required String where,
    required NetworkHelperPart helperPart,
    required NetworkConnectPart connectPart,
    required NetworkErrorPart errorPart,
    FormData? form,
    Options? options,
  }) async {
    final DataEntity data = await _getData(
      connectPart: connectPart,
      helperPart: helperPart,
      url: url,
      where: where,
      errorPart: errorPart,
    );
    return data;
  }

}