import 'package:banana_deal_by_monkeycompany/package/api/auth/auth_api.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/reset/reset_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/function/common_function.dart';

class ResetRepositoryImpl implements ResetRepository {
  final AuthApi authApi;
  final DioRepository dio;
  final CommonFunction commonFunction;
  const ResetRepositoryImpl({
    required this.authApi,
    required this.dio,
    required this.commonFunction,
  });

  @override
  Stream<DataDto> streamFindEmail({required String email}) => Stream.fromFuture(authApi.findEmail(email: email, dio: dio));

  @override
  Future<void> futureDelay(int milliseconds) async =>
      await commonFunction.futureDelay(milliseconds);

  @override
  Stream<DataDto> streamResetPw({required String email, required String pw}) => Stream.fromFuture(authApi.resetPw(email: email, pw: pw, dio: dio));
}