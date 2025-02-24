import 'package:banana_deal_by_monkeycompany/package/api/monkey/phone_spec_detail/model/action/phone_spec_detail_action.dart';
import 'package:banana_deal_by_monkeycompany/package/api/monkey/phone_spec_detail/model/func/phone_spec_detail_func.dart';
import 'package:banana_deal_by_monkeycompany/package/api/monkey/phone_spec_detail/phone_spec_detail_api.dart';
import 'package:banana_deal_by_monkeycompany/package/data/monkey/model/phone_spec_detail_vo.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';

class PhoneSpecDetailApiImpl implements PhoneSpecDetailApi {
  final PhoneSpecDetailAction action;
  final PhoneSpecDetailFunc func;
  const PhoneSpecDetailApiImpl({
    required this.action,
    required this.func
  });

  @override
  Future<PhoneSpecDetailVO> initSpecDetail({
    required String psIdx,
    required String monkeyUrl,
    required DioRepository dioRep,
  }) => action.initSpecDetail(psIdx: psIdx, monkeyUrl: monkeyUrl, func: func, dioRep: dioRep);

}