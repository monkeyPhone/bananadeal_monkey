import 'package:banana_deal_by_monkeycompany/package/api/deal_list/deal_list_api.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';

class DealListApiImpl implements DealListApi  {
  const DealListApiImpl();

  final String _where = 'DealListAction';

  @override
  Future<DataDto> getDealList({
    required DioRepository dio,
    required int mIdx,
    required int page,
  }) async{

    final DataDto myDeal = await dio.getDto(
        restApiEnum: RestApiEnum.user,
        endPoint: 'deal/list/page',
        repositoryName: _where,
        limit: true,
        form: {
          "DI_reg_user_idx": "$mIdx",
          "limit" : 20,
          "page" : page
        }
    );
    return myDeal;
  }

}