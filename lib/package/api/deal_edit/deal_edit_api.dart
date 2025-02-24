import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';

abstract class DealEditApi {
  const DealEditApi();

  Future<StatusEnum> sendDeleteList({
    required String diIdxBundle,
    required DioRepository dio,
  });

}