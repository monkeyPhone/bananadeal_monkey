import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';

abstract class NoticeApi {
  const NoticeApi();

  Future<DataDto> getNoticeList({
    required DioRepository dio
  });

}