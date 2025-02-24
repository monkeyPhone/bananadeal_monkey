import 'package:banana_deal_by_monkeycompany/package/api/store_detail_review/store_detail_review_api.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/store_detail_review/store_detail_review_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';

class StoreDetailReviewRepositoryImpl implements StoreDetailReviewRepository {
  final StoreDetailReviewApi api;
  final DioRepository dio;
  const StoreDetailReviewRepositoryImpl({
    required this.api,
    required this.dio,
  });

  @override
  Future<DataDto> getData({required String smMid, required int mIdx, required int page, required int length}) async => await
  api.fetchData(dio: dio, smMid: smMid, mIdx: mIdx, page: page, length: length);

}