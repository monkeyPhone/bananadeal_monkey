import 'package:banana_deal_by_monkeycompany/package/api/banner/banner_api.dart';
import 'package:banana_deal_by_monkeycompany/package/api/banner/model/action/banner_action.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';

class BannerApiImpl implements BannerApi {
  final BannerAction action;
  const BannerApiImpl({
    required this.action,
  });

  @override
  Future<DataDto> getBanner({
    required DioRepository dio,
  }) async => await action.getBanner(dio: dio);

}