import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';

abstract class StoreDetailReviewRepository {
  const StoreDetailReviewRepository();

  Future<DataDto> getData({required String smMid, required int mIdx, required int page, required int length});

}