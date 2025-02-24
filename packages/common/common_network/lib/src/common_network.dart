

import 'package:common_network/src/models/data_dto.dart';
import 'package:common_network/src/models/data_entity.dart';
import 'package:utils/utils.dart';

abstract class CommonNetwork {
  const CommonNetwork();

  Future<DataDto> getDto({
    required String where,
    required EnumRestapi enumRestApi,
    required String endPoint,
    Map<String, dynamic>? form,
    bool? limit,
    bool? customLimit,
  });


  Future<Map<String, dynamic>> getJson({
    required String where,
    required String url,
  });

  Future<DataEntity> getEntity({
    required String where,
    required EnumRestapi enumRestApi,
    required String endPoint,
    Map<String, dynamic>? form,
  });

  Future<void> sendErrorLog({
    required String url,
    required String where,
    required DataEntity entity
  });

  Future<bool> getInternetStatus();

}