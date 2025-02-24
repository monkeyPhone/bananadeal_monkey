import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';

class StoreSearchAction {
  const StoreSearchAction();

  final String _where = 'StoreSearchAction';

  Future<DataDto> getData({
    required int start, required String keyword, required DioRepository dio}) async {
    final DataDto dto = await dio.getDto(
      limit: true,
      repositoryName: _where,
      restApiEnum: RestApiEnum.user,
      endPoint: 'member/store/list/search',
      form: {
        "start": start,
        "keyword": keyword,
      },
    );
    return dto;
  }

}