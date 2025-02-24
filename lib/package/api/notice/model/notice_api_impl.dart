import 'package:banana_deal_by_monkeycompany/package/api/notice/model/action/notice_action.dart';
import 'package:banana_deal_by_monkeycompany/package/api/notice/notice_api.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';

class NoticeApiImpl extends NoticeApi {
  final NoticeAction action;
  const NoticeApiImpl({
    required this.action,
  });

  @override
  Future<DataDto> getNoticeList({
    required DioRepository dio
  }) => action.getNoticeList(dio: dio);

}