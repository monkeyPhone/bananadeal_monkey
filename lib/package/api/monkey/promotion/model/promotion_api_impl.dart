import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/api/monkey/promotion/model/action/promotion_action.dart';
import 'package:banana_deal_by_monkeycompany/package/api/monkey/promotion/promotion_api.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';

class PromotionApiImpl implements PromotionApi {
  final PromotionAction action;

  const PromotionApiImpl({
    required this.action,
  });

  @override
  Future<(StatusEnum, List<String> maxInst, List<String> supportType, List<String> guyhap, List<String> walfare)> initInfo({
    required CommonUrl url,
    required DioRepository dio,
    required String tkIdx,
    required String psIdx,
  }) => action.initInfo(tkIdx: tkIdx, psIdx: psIdx, url: url, dioRep: dio);

}
