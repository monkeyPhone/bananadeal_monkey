abstract class CreateDealRepository {
  const CreateDealRepository();

  Stream<int> streamCreateDeal({
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

  Future<bool> checkValue({required int tkIdx, required int psIdx});

  String convertTelecom({
    required String currentAgency, required String requestAgency
  });

}