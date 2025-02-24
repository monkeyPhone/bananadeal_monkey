import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/api/create_deal/create_deal_api.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/create_deal/create_deal_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';

class CreateDealRepositoryImpl implements CreateDealRepository {
  final CreateDealApi api;
  final CommonFunction commonFunction;
  final DioRepository dio;
  final CommonUrl url;
  const CreateDealRepositoryImpl({
    required this.api,
    required this.commonFunction,
    required this.dio,
    required this.url,
  });

  @override
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
  }) => Stream.fromFuture(
    api.createDeal(
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

    )
  );

  @override
  Future<bool> checkValue({required int tkIdx, required int psIdx}) 
  async => await api.checkValue(tkIdx: tkIdx, psIdx: psIdx, dio: dio, url: url, );

  @override
  String convertTelecom({
    required String currentAgency, required String requestAgency
  }) => commonFunction.convertTelecom(currentAgency: currentAgency, requestAgency: requestAgency);

}