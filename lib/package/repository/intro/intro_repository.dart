import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';

abstract class IntroRepository {
  const IntroRepository();

  Stream<DataDto> getImageList();

}