import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';

class NoticeAction{
  const NoticeAction();

  final String _where = 'NoticeAction';

  Future<DataDto> getNoticeList({
    required DioRepository dio
  }) async{
    final DataDto dto = await dio.getDto(
        repositoryName: _where,
        restApiEnum: RestApiEnum.user,
        endPoint: 'notice',
        limit: true
    );

    return dto;
  }

}