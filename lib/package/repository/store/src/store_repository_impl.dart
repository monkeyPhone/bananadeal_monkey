import 'package:banana_deal_by_monkeycompany/package/api/store/store_api.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/store/store_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';

class StoreRepositoryImpl implements StoreRepository {
  final StoreApi api;
  final DioRepository dio;
  const StoreRepositoryImpl({
    required this.api,
    required this.dio,
  });

  @override
  Stream<DataDto> streamData({
    required int page,
    required String order,
    required String orderBy,
  }) => Stream.fromFuture(api.fetchData(dio: dio, page: page, order: order, orderBy: orderBy));

  @override
  Future<DataDto> fetchData({
    required int page,
    required String order,
    required String orderBy,
  }) async => await api.fetchData(dio: dio, page: page, order: order, orderBy: orderBy);

  @override
  Future<bool> sendFavorite({
    required bool isFavorite,
    required int mIdx,
    required String smId,
  }) async => await api.sendFavorite(dio: dio, isFavorite: isFavorite, mIdx: mIdx, smId: smId);

}