import 'package:banana_deal_by_monkeycompany/package/api/store_search/model/store_search_action.dart';
import 'package:banana_deal_by_monkeycompany/package/api/store_search/store_search_api.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';

class StoreSearchApiImpl implements StoreSearchApi {
  final StoreSearchAction action;
  const StoreSearchApiImpl({
    required this.action,
  });

  @override
  Future<DataDto> getData({
    required int start, required String keyword, required DioRepository dio}) => action.getData(start: start, keyword: keyword, dio: dio);

}