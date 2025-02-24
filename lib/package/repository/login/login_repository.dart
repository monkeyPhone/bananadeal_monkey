import 'package:banana_deal_by_monkeycompany/verse/core/common/cache/provider/auth_cache_provider.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';

abstract class LoginRepository{
  final AuthCacheProvider provider;
  const LoginRepository({
    required this.provider,
  });

  Stream<DataDto> streamPostEmailLogin({required String email, required String pw});

  Stream<DataDto> streamPostKakaoLogin();

  Stream<DataDto> streamPostAppleLogin();

  Future<void> futureDelay(int milliseconds);

}