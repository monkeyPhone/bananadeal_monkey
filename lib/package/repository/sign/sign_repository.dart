import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';

abstract class SignRepository {
  const SignRepository();

  Stream<DataDto> streamCheckEmail({required String email});

  Future<void> futureDelay(int milliseconds);

  Stream<DataDto> streamCreatePw({required String email, required String pw});
}