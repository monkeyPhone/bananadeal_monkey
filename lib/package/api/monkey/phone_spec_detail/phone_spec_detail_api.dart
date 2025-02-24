import 'package:banana_deal_by_monkeycompany/package/data/monkey/model/phone_spec_detail_vo.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';

abstract class PhoneSpecDetailApi {

  const PhoneSpecDetailApi();

  Future<PhoneSpecDetailVO> initSpecDetail({
    required String psIdx,
    required String monkeyUrl,
    required DioRepository dioRep,
  });

}