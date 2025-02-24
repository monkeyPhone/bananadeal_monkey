import 'package:banana_deal_by_monkeycompany/package/api/login/login_api.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/login/login_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/cache/provider/auth_cache_provider.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/function/common_function.dart';

class LoginRepositoryImpl implements LoginRepository{
  @override
  final AuthCacheProvider provider;
  final LoginApi api;
  final CommonFunction commonFunction;
  final DioRepository dio;
  const LoginRepositoryImpl({
    required this.provider,
    required this.api,
    required this.commonFunction,
    required this.dio,
  });

  @override
  Stream<DataDto> streamPostEmailLogin({required String email, required String pw}) => 
    Stream.fromFuture(api.postEmailLogin(email: email, pw: pw, dio: dio));

  @override
  Stream<DataDto> streamPostKakaoLogin() =>
    Stream.fromFuture(api.postKakaoLogin(dio));

  @override
  Stream<DataDto> streamPostAppleLogin() =>
    Stream.fromFuture(api.postAppleLogin(dio));

  @override
  Future<void> futureDelay(int milliseconds) async =>
    await commonFunction.futureDelay(milliseconds);


}