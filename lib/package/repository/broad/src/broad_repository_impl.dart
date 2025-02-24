import 'package:banana_deal_by_monkeycompany/package/api/deal/deal_api.dart';
import 'package:banana_deal_by_monkeycompany/package/api/user_edit/user_edit_api.dart';
import 'package:banana_deal_by_monkeycompany/package/data/broad/deal_info_dto.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/broad/broad_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';

class BroadRepositoryImpl implements BroadRepository {
  final DealApi dealApi;
  final UserEditApi userEditApi;
  final DioRepository dio;
  final int mIdx;
  const BroadRepositoryImpl({
    required this.dealApi,
    required this.userEditApi,
    required this.dio,
    required this.mIdx,
  });

  @override
  Stream<DealInfoDto> streamInitData() => Stream.fromFuture(dealApi.initData(dio: dio, mIdx: mIdx));

  @override
  Future<StatusEnum> updateUser({
    required Map<String, dynamic> dataMap,
  }) async => await userEditApi.updateUser(dataMap: dataMap, dio: dio);



}