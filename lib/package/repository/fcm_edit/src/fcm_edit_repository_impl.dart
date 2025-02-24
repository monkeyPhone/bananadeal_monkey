import 'package:banana_deal_by_monkeycompany/package/api/fcm_edit/fcm_edit_api.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/fcm_edit/fcm_edit_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';

class FcmEditRepositoryImpl implements FcmEditRepository {
  final FcmEditApi api;
  final DioRepository dio;
  const FcmEditRepositoryImpl({
    required this.api,
    required this.dio,
  });

  @override
  Future<StatusEnum> fetchFcmStatus({
    required String spPush,
    required String appPush,
    required String gwanggoPush,
    required String chatPush,
    required String mpPush,
    required String mpEditDate,
    required String spEditDate
  }) async => await api.fetchFcmStatus(
      dio: dio, spPush: spPush, appPush: appPush, gwanggoPush: gwanggoPush,
      chatPush: chatPush, mpPush: mpPush,
      mpEditDate: mpEditDate, spEditDate: spEditDate
  );

}