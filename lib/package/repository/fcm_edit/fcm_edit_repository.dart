import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';

abstract class FcmEditRepository {
  const FcmEditRepository();

  Future<StatusEnum> fetchFcmStatus({
    required String spPush,
    required String appPush,
    required String gwanggoPush,
    required String chatPush,
    required String mpPush,
    required String mpEditDate,
    required String spEditDate
  });

}