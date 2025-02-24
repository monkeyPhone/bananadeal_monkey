import 'package:banana_deal_by_monkeycompany/package/api/auth/auth_api.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/sign/sign_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/function/common_function.dart';

class SignRepositoryImpl implements SignRepository {
  final AuthApi authApi;
  final DioRepository dio;
  final CommonFunction commonFunction;
  const SignRepositoryImpl({
    required this.authApi,
    required this.dio,
    required this.commonFunction,
  });

  @override
  Stream<DataDto> streamCheckEmail({required String email}) => Stream.fromFuture(authApi.checkEmail(email: email, dio: dio));

  @override
  Future<void> futureDelay(int milliseconds) async =>
      await commonFunction.futureDelay(milliseconds);

  @override
  Stream<DataDto> streamCreatePw({required String email, required String pw}) => Stream.fromFuture(authApi.createPw(email: email, pw: pw, dio: dio));
}