import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';

class BannerAction {
  const BannerAction();

  Future<DataDto> getBanner({
    required DioRepository dio,
  }) async{
    final DataDto result = await dio.getDto(
        repositoryName: 'BannerAction',
        restApiEnum: RestApiEnum.user,
        endPoint: 'banner/list',
        limit: true
    );
    return result;
  }

}