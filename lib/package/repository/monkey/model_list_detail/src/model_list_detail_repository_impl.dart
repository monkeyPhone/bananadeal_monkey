import 'package:banana_deal_by_monkeycompany/package/api/monkey/phone_spec_detail/phone_spec_detail_api.dart';
import 'package:banana_deal_by_monkeycompany/package/data/monkey/model/phone_spec_detail_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/monkey/model_list_detail/model_list_detail_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';

class ModelListDetailRepositoryImpl implements ModelListDetailRepository {
  final PhoneSpecDetailApi phoneSpecDetailApi;
  final String monkeyUrl;
  final DioRepository dio;

  const ModelListDetailRepositoryImpl({
    required this.phoneSpecDetailApi,
    required this.monkeyUrl,
    required this.dio,
  });

  @override
  Stream<PhoneSpecDetailVO> streamSpecDetail({
    required String psIdx,
  }) => Stream.fromFuture(phoneSpecDetailApi.initSpecDetail(psIdx: psIdx, monkeyUrl: monkeyUrl, dioRep: dio));
}