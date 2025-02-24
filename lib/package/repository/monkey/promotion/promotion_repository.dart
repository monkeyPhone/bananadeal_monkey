import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';

abstract class PromotionRepository {
  const PromotionRepository();

  Stream<(StatusEnum, List<String> maxInst, List<String> supportType, List<String> guyhap, List<String> walfare)> initInfo({
    required String tkIdx,
    required String psIdx,
  });

}