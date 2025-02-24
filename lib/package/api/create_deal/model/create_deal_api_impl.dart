import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/api/create_deal/create_deal_api.dart';
import 'package:banana_deal_by_monkeycompany/package/api/create_deal/model/action/create_deal_action.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';

class CreateDealApiImpl implements CreateDealApi{
  final CreateDealAction action;

  const CreateDealApiImpl({
    required this.action,
  });

  @override
  Future<bool> checkValue({required int tkIdx, required int psIdx, required DioRepository dio, required CommonUrl url}) async =>
      await action.checkValue(
          tkIdx: tkIdx,
          psIdx: psIdx,
          url: url,
          dioRep: dio
      );

  @override
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
  }) async => await action.createDeal(
      dio: dio,
      userIdx: userIdx,
      joinType: joinType,
      currentAgency: currentAgency,
      requestAgency: requestAgency,
      joinerPhone: joinerPhone,
      joinerPhoneModel: joinerPhoneModel,
      joinerPhoneIdx: joinerPhoneIdx,
      joinerRatePlan: joinerRatePlan,
      joinerRatePlanIdx: joinerRatePlanIdx,
      ageType: ageType,
      maxInstallment: maxInstallment,
      guyHap: guyHap,
      welfare: welfare,
      sup: sup,
      etc: etc,
  );

}