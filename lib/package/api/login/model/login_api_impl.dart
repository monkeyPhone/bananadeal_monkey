import 'package:banana_deal_by_monkeycompany/package/api/login/login_api.dart';
import 'package:banana_deal_by_monkeycompany/package/api/login/model/action/login_action.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';

class LoginApiImpl implements LoginApi {
  final LoginAction action;

  const LoginApiImpl({
    required this.action,
  });

  @override
  Future<DataDto> postEmailLogin({required DioRepository dio, required String email, required String pw}) async =>
      await action.postEmailLogin(dio: dio, email: email, pw: pw);

  @override
  Future<DataDto> postKakaoLogin(DioRepository dio) async =>
      await action.postKakaoLogin(dio: dio);

  @override
  Future<DataDto> postAppleLogin(DioRepository dio) async =>
      await action.postAppleLogin(dio: dio);

}