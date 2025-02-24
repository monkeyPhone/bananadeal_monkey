import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';

abstract class CreateDealApi {
  const CreateDealApi();

  Future<bool> checkValue({required int tkIdx, required int psIdx, required DioRepository dio, required CommonUrl url});

  Future<int> createDeal({
    required DioRepository dio,
    required int userIdx,
    required String joinType,
    required String currentAgency,
    required String requestAgency,
    required String joinerPhone,
    required String joinerPhoneModel,
    required String joinerPhoneIdx,
    required String joinerRatePlan,
    required String joinerRatePlanIdx,
    required String ageType,
    required int maxInstallment,
    required String guyHap,
    required String welfare,
    required String sup,
    required String etc,
  });

}