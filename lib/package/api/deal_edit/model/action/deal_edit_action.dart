import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';

class DealEditAction {
  const DealEditAction();

  final String _where = 'DealMixAction';

  Future<StatusEnum> sendDeleteList({
    required String diIdxBundle,
    required DioRepository dio,
  }) async{
    final DataDto data = await dio.getDto(
        repositoryName: _where,
        restApiEnum: RestApiEnum.user,
        endPoint: 'deal/show/edit',
        form: {
          "DI_idx": diIdxBundle,
        }
    );
    return data.statusEnum;
  }

}