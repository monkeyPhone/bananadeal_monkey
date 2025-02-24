import 'package:banana_deal_by_monkeycompany/package/api/store/store_api.dart';
import 'package:banana_deal_by_monkeycompany/package/api/store_search/store_search_api.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/store_search/store_search_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';

class StoreSearchRepositoryImpl implements StoreSearchRepository {
  final StoreSearchApi api;
  final StoreApi storeApi;
  final DioRepository dio;
  const StoreSearchRepositoryImpl({
    required this.api,
    required this.dio,
    required this.storeApi
  });

  @override
  Stream<DataDto> fetchData({
    required int start,
    required String keyword,
  }) => Stream.fromFuture(api.getData(start: start, keyword: keyword, dio: dio));

  @override
  Future<DataDto> originData({
    required int start,
    required String keyword,
  }) async => await api.getData(start: start, keyword: keyword, dio: dio);

  @override
  Future<bool> sendFavorite({
    required bool isFavorite,
    required int mIdx,
    required String smId,
  }) async => await storeApi.sendFavorite(dio: dio, isFavorite: isFavorite, mIdx: mIdx, smId: smId);

}