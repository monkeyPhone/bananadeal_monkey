import 'package:banana_deal_by_monkeycompany/package/api/deal/deal_api.dart';
import 'package:banana_deal_by_monkeycompany/package/api/deal/model/action/deal_action.dart';
import 'package:banana_deal_by_monkeycompany/package/data/broad/deal_info_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';

class DealApiImpl implements DealApi {
  final DealAction action;
  const DealApiImpl({
    required this.action,
  });

  @override
  Future<DealInfoDto> initData({
    required DioRepository dio,
    required int mIdx,
  }) async => await action.initData(dio: dio, mIdx: mIdx);

}