import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';

abstract class FcmEditApi {
  const FcmEditApi();

  Future<StatusEnum> fetchFcmStatus({
    required DioRepository dio,
    required String spPush,
    required String appPush,
    required String gwanggoPush,
    required String chatPush,
    required String mpPush,
    required String mpEditDate,
    required String spEditDate
  });

}