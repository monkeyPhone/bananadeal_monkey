import 'package:banana_deal_by_monkeycompany/package/api/auth/auth_api.dart';
import 'package:banana_deal_by_monkeycompany/package/api/auth/model/action/auth_action.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';

class AuthApiImpl implements AuthApi {
  final AuthAction action;

  const AuthApiImpl({
    required this.action,
  });

  @override
  Future<DataDto> checkEmail({required String email,required DioRepository dio}) async=>
    await action.checkEmail(dio: dio, email: email);

  @override
  Future<DataDto> findEmail({required String email,required DioRepository dio}) async=>
      await action.findEmail(dio: dio, email: email);

  @override
  Future<DataDto> createPw({required String email, required String pw, required DioRepository dio}) async =>
    await action.createPw(dio: dio, email: email, pw: pw, );

  @override
  Future<DataDto> resetPw({required String email, required String pw, required DioRepository dio}) async =>
      await action.resetPw(dio: dio, email: email, pw: pw, );

}