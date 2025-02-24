import 'package:banana_deal_by_monkeycompany/package/data/notice_vo.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';

abstract class NoticeRepository {
  const NoticeRepository();

  Stream<(StatusEnum, List<NoticeVO>)> streamNoticeList();

}