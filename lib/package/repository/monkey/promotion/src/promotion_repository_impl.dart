import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/api/monkey/promotion/promotion_api.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/monkey/promotion/promotion_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';

class PromotionRepositoryImpl implements PromotionRepository {
  final PromotionApi api;
  final CommonUrl url;
  final DioRepository dio;
  const PromotionRepositoryImpl({
    required this.api,
    required this.url,
    required this.dio,
  });

  @override
  Stream<(StatusEnum, List<String> maxInst, List<String> supportType, List<String> guyhap, List<String> walfare)> initInfo({
    required String tkIdx,
    required String psIdx,
  }) => Stream.fromFuture(api.initInfo(tkIdx: tkIdx, psIdx: psIdx, url: url, dio: dio));

}