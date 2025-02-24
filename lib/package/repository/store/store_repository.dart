import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';

abstract class StoreRepository {
  const StoreRepository();

  Stream<DataDto> streamData({
    required int page,
    required String order,
    required String orderBy,
  });

  Future<DataDto> fetchData({
    required int page,
    required String order,
    required String orderBy,
  });

  Future<bool> sendFavorite({
    required bool isFavorite,
    required int mIdx,
    required String smId,
  });

}