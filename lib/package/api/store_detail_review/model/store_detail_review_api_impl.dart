import 'package:banana_deal_by_monkeycompany/package/api/store_detail_review/model/action/store_detail_review_action.dart';
import 'package:banana_deal_by_monkeycompany/package/api/store_detail_review/store_detail_review_api.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';

class StoreDetailReviewApiImpl implements StoreDetailReviewApi{
  final StoreDetailReviewAction action;
  const StoreDetailReviewApiImpl({
    required this.action,
  });

  @override
  Future<DataDto> fetchData({
    required DioRepository dio,
    required String smMid, required int mIdx, required int page, required int length}) async => await action.getData(smMid: smMid, mIdx: mIdx, page: page, length: length, dio: dio);

}