import 'package:banana_deal_by_monkeycompany/package/api/intro_image/intro_image_api.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';

class IntroImageApiImpl implements IntroImageApi {
  const IntroImageApiImpl();

  @override
  Future<DataDto> getImageList(DioRepository dio) async=>
      await dio.getDto(
          repositoryName: 'IntroImageApiImpl',
          restApiEnum: RestApiEnum.guest,
          endPoint: 'appinfo/img');

}