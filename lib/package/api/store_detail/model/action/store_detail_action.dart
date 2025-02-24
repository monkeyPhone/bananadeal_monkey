import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';

class StoreDetailAction {
  const StoreDetailAction();

  final _where = 'StoreDetailAction';

  Future<DataDto> getStoreDetailDto({
    required DioRepository dio,
    required String smId,
    required int mIdx,
  }) async{
    final DataDto dto = await dio.getDto(
        repositoryName: _where,
        restApiEnum: RestApiEnum.user,
        endPoint: 'member/store/detail',
        form: {
          "SM_m_id": smId,
          "M_idx": mIdx,
        },
        limit: true
    );
    return  dto;
  }

}