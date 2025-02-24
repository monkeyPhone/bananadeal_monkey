import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/action/dio_api_action.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_entity.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/dio_entity.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/helper/dio_api_logger.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/url/common_url.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';

abstract class DioProvider {
  const DioProvider();

  Future<DataEntity> getEntity({
    required String url,
    required String dto,
    FormData? form,
    Options? options,
  });


  Future<bool> getInternetStatus();

  Future<void> sendErrorLog({
    required String url,
    required String dto,
    required String errorContent
  });
}




class DioProviderImpl implements DioProvider {
  final CommonUrl commonUrl;
  final DioApiAction action;
  final DioApiLogger helper;
  final Connectivity connectivity;
  DioProviderImpl({
    required this.commonUrl,
    required this.action,
    required this.helper,
    required this.connectivity,
  });

  @override
  Future<DataEntity> getEntity({
    required String url,
    required String dto,
    FormData? form,
    Options? options,
  }) async {
    final bool isConnect = await getInternetStatus();
    final DioEntity dioEntity = DioEntity(url: url, dto: dto, form: form, options: options,);
    final DataEntity data = await action.getData(isConnect: isConnect, dioEntity: dioEntity, dioLogger: helper, bananaOpenUrl: commonUrl.bananaOpenUrl);

    return data;
  }

  @override
  Future<bool> getInternetStatus() async{
    final connectivityResult = await connectivity.checkConnectivity();
    final bool isConnect =
        connectivityResult.contains(ConnectivityResult.wifi) ||
            connectivityResult.contains(ConnectivityResult.ethernet) ||
            connectivityResult.contains(ConnectivityResult.mobile);

    return isConnect;
  }

  @override
  Future<void> sendErrorLog({
    required String url,
    required String dto,
    required String errorContent
  }) async => await action.sendErrorReport(
      bananaOpenUrl: commonUrl.bananaOpenUrl,
      statusCode: 800,
      errorContent: errorContent,
      errorApiRoute: url,
      dioLogger: helper,
      errorAppRoute: errorContent
  );
}

