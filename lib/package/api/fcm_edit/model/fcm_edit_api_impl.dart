import 'package:banana_deal_by_monkeycompany/package/api/fcm_edit/fcm_edit_api.dart';
import 'package:banana_deal_by_monkeycompany/package/api/fcm_edit/model/action/fcm_edit_action.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';

class FcmEditApiImpl implements FcmEditApi {
  final FcmEditAction action;
  const FcmEditApiImpl({
    required this.action,
  });

  @override
  Future<StatusEnum> fetchFcmStatus({
    required DioRepository dio,
    required String spPush,
    required String appPush,
    required String gwanggoPush,
    required String chatPush,
    required String mpPush,
    required String mpEditDate,
    required String spEditDate
  }) async => await action.fetchFcmStatus(
      dio: dio,
      spPush: spPush,
      appPush: appPush,
      gwanggoPush: gwanggoPush,
      chatPush: chatPush,
      mpPush: mpPush,
      mpEditDate: mpEditDate,
      spEditDate: spEditDate
  );

}