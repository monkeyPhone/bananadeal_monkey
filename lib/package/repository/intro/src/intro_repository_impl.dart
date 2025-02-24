import 'package:banana_deal_by_monkeycompany/package/api/intro_image/intro_image_api.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/intro/intro_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';

class IntroRepositoryImpl implements IntroRepository{
  final IntroImageApi api;
  final DioRepository dio;
  const IntroRepositoryImpl({
    required this.api,
    required this.dio,
  });

  @override
  Stream<DataDto> getImageList() => Stream.fromFuture(api.getImageList(dio));
}