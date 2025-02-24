import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';

class StoreDetailReviewAction {
  const StoreDetailReviewAction();

  final String _where = 'StoreDetailReviewAction';

  Future<DataDto> getData({
    required DioRepository dio,
    required String smMid, required int mIdx, required int page, required int length}) async{
    final DataDto dto = await dio.getDto(
        repositoryName: _where,
        restApiEnum: RestApiEnum.user,
        endPoint: 'review/store/detail',
        limit: true,
        form: {
          "SM_m_id": smMid,
          "M_idx" : mIdx,
          "start" : page,
          "end" : length,
        }
    );
    return dto;
  }

}