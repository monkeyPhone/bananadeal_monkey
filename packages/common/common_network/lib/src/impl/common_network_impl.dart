import 'dart:convert';
import 'package:common_cache/common_cache.dart';
import 'package:common_network/src/common_network.dart';
import 'package:common_network/src/impl/part/network_connect_part.dart';
import 'package:common_network/src/impl/part/network_dio_part.dart';
import 'package:common_network/src/impl/part/network_error_part.dart';
import 'package:common_network/src/impl/part/network_func_part.dart';
import 'package:common_network/src/impl/part/network_helper_part.dart';
import 'package:common_network/src/models/data_dto.dart';
import 'package:common_network/src/models/data_entity.dart';
import 'package:common_url/common_url.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:utils/utils.dart';

class CommonNetworkImpl implements CommonNetwork {
  final CommonUrl commonUrl;
  final CommonCache commonCache;
  final NetworkConnectPart _connectPart;
  final NetworkDioPart _dioPart;
  final NetworkErrorPart _errorPart;
  final NetworkFuncPart _funcPart;
  final NetworkHelperPart _helperPart;

  CommonNetworkImpl({
    required this.commonUrl,
    required this.commonCache,
  }) : _connectPart = NetworkConnectPart(connectivity: Connectivity()),
       _dioPart = NetworkDioPart(bananaOpenUrl: commonUrl.bananaOpenUrl),
       _errorPart = NetworkErrorPart(bananaOpenUrl: commonUrl.bananaOpenUrl),
       _funcPart = NetworkFuncPart(commonUrl: commonUrl, commonCache: commonCache),
       _helperPart = NetworkHelperPart();


  @override
  Future<DataDto> getDto({
    required String where,
    required EnumRestapi enumRestApi,
    required String endPoint,
    Map<String, dynamic>? form,
    bool? limit,
    bool? customLimit,
  }) async{

    final Options? options = switch(enumRestApi){
      EnumRestapi.user =>  _funcPart.getDioOptions(),
      _ => null,
    };

    final String url = _funcPart.getUrl(enumRestApi: enumRestApi, endPoint: endPoint,);

    final DataEntity entity = await _dioPart.getEntity(
        where: where,
        url: url,
        form: form == null ? null : FormData.fromMap(form),
        options: options,
        helperPart: _helperPart,
        connectPart: _connectPart,
        errorPart: _errorPart,
    );

    final EnumStatus enumStatus =
    _funcPart.getStatus(
        status: entity.status,
        isLimit: limit == true
            ? entity.result.isNotEmpty
            : limit == false
                ? customLimit
                :  null
    );


    final DataDto result = DataDto(
        status: enumStatus,
        data: entity.result,
    );

    return result;
  }

  @override
  Future<DataEntity> getEntity({
    required String where,
    required EnumRestapi enumRestApi,
    required String endPoint,
    Map<String, dynamic>? form,
  }) async{

    final Options? options = switch(enumRestApi){
      EnumRestapi.user =>  _funcPart.getDioOptions(),
      _ => null,
    };

    final String url = _funcPart.getUrl(enumRestApi: enumRestApi, endPoint: endPoint,);

    final DataEntity entity = await _dioPart.getEntity(
      where: where,
      url: url,
      form: form == null ? null : FormData.fromMap(form),
      options: options,
      helperPart: _helperPart,
      connectPart: _connectPart,
      errorPart: _errorPart,
    );


    return entity;
  }


  @override
  Future<Map<String, dynamic>> getJson({
    required String where,
    required String url,
  }) async{
    final Dio dio = Dio(_helperPart.baseOptions);
    var response = await dio.get(url);
    Map<String, dynamic> data = jsonDecode(response.data);
    return data;
  }


  @override
  Future<void> sendErrorLog({
    required String url,
    required String where,
    required DataEntity entity
  }) async => await _errorPart.sendErrorReport(
      helperPart: _helperPart,
      entity: entity, where: where, url: url
  );


  @override
  Future<bool> getInternetStatus() async => await _connectPart.getInternetStatus();

}