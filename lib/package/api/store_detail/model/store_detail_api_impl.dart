import 'package:banana_deal_by_monkeycompany/package/api/store_detail/model/action/store_detail_action.dart';
import 'package:banana_deal_by_monkeycompany/package/api/store_detail/store_detail_api.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';

class StoreDetailApiImpl implements StoreDetailApi {
  final StoreDetailAction action;
  const StoreDetailApiImpl({
    required this.action
  });

  @override
  Future<DataDto> getStoreDetailDto({
    required DioRepository dio,
    required String smId,
    required int mIdx,
  }) async => await action.getStoreDetailDto(dio: dio, smId: smId, mIdx: mIdx);

}