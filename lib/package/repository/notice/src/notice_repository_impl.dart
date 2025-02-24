import 'package:banana_deal_by_monkeycompany/package/api/notice/notice_api.dart';
import 'package:banana_deal_by_monkeycompany/package/data/notice_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/notice/notice_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';

class NoticeRepositoryImpl implements NoticeRepository{
  final NoticeApi api;
  final DioRepository dio;
  const NoticeRepositoryImpl({
    required this.api,
    required this.dio,
  });

  @override
  Stream<(StatusEnum, List<NoticeVO>)> streamNoticeList() => Stream.fromFuture(noticeList());

  Future<(StatusEnum, List<NoticeVO>)> noticeList() async{
    final DataDto dto = await api.getNoticeList(dio: dio);
    final StatusEnum status = dto.statusEnum;
    final List<NoticeVO> list = switch(status){
      StatusEnum.success => convertNoticeVO(dto.data),
      _ => []
    };
    final (StatusEnum, List<NoticeVO>) result = (status, list);
    return result;
  }

}