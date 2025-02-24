import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';

abstract class StoreDetailReviewApi{
  const StoreDetailReviewApi();

  Future<DataDto> fetchData({
    required DioRepository dio,
    required String smMid, required int mIdx, required int page, required int length});

}