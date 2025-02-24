import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';

abstract class PromotionApi {
  const PromotionApi();

  Future<(StatusEnum, List<String> maxInst, List<String> supportType, List<String> guyhap, List<String> walfare)> initInfo({
    required CommonUrl url,
    required DioRepository dio,
    required String tkIdx,
    required String psIdx,
  });

}