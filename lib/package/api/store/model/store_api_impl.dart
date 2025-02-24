import 'package:banana_deal_by_monkeycompany/package/api/store/model/action/store_action.dart';
import 'package:banana_deal_by_monkeycompany/package/api/store/store_api.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';

class StoreApiImpl implements StoreApi {
  final StoreAction action;
  const StoreApiImpl({
    required this.action,
  });

  @override
  Future<DataDto> fetchData({
    required DioRepository dio,
    required int page,
    required String order,
    required String orderBy,
  }) async => await action.fetchData(dio: dio, page: page, order: order, orderBy: orderBy);

  @override
  Future<bool> sendFavorite({
    required DioRepository dio,
    required bool isFavorite,
    required int mIdx,
    required String smId,
  }) async => await action.sendFavorite(dio: dio, isFavorite: isFavorite, mIdx: mIdx, smId: smId);

  @override
  Future<DataDto> getStoreListLength(DioRepository dio) async => await action.getStoreListLength(dio);

}