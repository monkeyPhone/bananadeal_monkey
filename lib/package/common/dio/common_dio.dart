import 'package:banana_deal_by_monkeycompany/package/data/common/data_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';

abstract class CommonDio {
  const CommonDio();

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