import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';

abstract class StoreSearchApi {
  const StoreSearchApi();

  Future<DataDto> getData({
    required int start, required String keyword, required DioRepository dio});

}