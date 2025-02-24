import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';

abstract class StoreApi {
  const StoreApi();

  Future<DataDto> fetchData({
    required DioRepository dio,
    required int page,
    required String order,
    required String orderBy,
  });


  Future<bool> sendFavorite({
    required DioRepository dio,
    required bool isFavorite,
    required int mIdx,
    required String smId,
  });


  Future<DataDto> getStoreListLength(DioRepository dio);

}