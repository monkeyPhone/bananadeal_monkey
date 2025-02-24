import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';

abstract class ResetRepository {
  const ResetRepository();

  Stream<DataDto> streamFindEmail({required String email});

  Future<void> futureDelay(int milliseconds);

  Stream<DataDto> streamResetPw({required String email, required String pw});
}