import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';

abstract class StoreSearchRepository {
  const StoreSearchRepository();

  Stream<DataDto> fetchData({
    required int start,
    required String keyword,
  });

  Future<DataDto> originData({
    required int start,
    required String keyword,
  });

  Future<bool> sendFavorite({
    required bool isFavorite,
    required int mIdx,
    required String smId,
  });

}