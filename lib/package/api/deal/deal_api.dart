import 'package:banana_deal_by_monkeycompany/package/data/broad/deal_info_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';

abstract class DealApi {
  const DealApi();

  Future<DealInfoDto> initData({
    required DioRepository dio,
    required int mIdx,
  });

}