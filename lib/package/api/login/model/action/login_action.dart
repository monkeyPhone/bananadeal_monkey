import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/json_error.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class LoginAction {
  const LoginAction();

  final String _repository = 'LoginApi - LoginAction';

  Future<DataDto> postEmailLogin({
    required DioRepository dio,
    required String email,
    required String pw
  }) async{
    DataDto data = await dio.getDto(
        restApiEnum: RestApiEnum.guest,
        endPoint: 'login/email',
        repositoryName: _repository,
        form: {
          "M_email": email,
          "M_pw": pw,
        }
    );
    return data;
  }

  Future<DataDto> postKakaoLogin({
    required DioRepository dio,
  }) async{
    try{
      OAuthToken tokens = await UserApi.instance.loginWithKakaoAccount();
      DataDto data = await dio.getDto(
          restApiEnum: RestApiEnum.kakao,
          endPoint: 'login',
          repositoryName: _repository,
          form: {
            "access_token": tokens.accessToken,
            "refresh_token": tokens.refreshToken,
          }
      );
      return data;
    } catch(_){
      return const DataDto(
          statusEnum: StatusEnum.exception,
          error: JsonError(
              apiUrl: '',
              status: 510,
              apiLocation: '',
              dioExceptionType: '카카오 로그인 취소'
          ),
          data: [],
          tokenError: false
      );
    }
  }

  Future<DataDto> postAppleLogin({
    required DioRepository dio,
  }) async{
    try{
      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      final oauthCredential = OAuthProvider("apple.com").credential(
        idToken: appleCredential.identityToken,
        accessToken: appleCredential.authorizationCode,
      );

      var apple = await FirebaseAuth.instance.signInWithCredential(oauthCredential);

      DataDto data = await dio.getDto(
          restApiEnum: RestApiEnum.kakao,
          endPoint: 'login',
          repositoryName: _repository,
          form: {
            "apple_token": apple.user!.uid,
            "apple_email": apple.user!.email,
          }
      );
      return data;
    } catch(_){
      return const DataDto(
          statusEnum: StatusEnum.exception,
          error: JsonError(
              apiUrl: '',
              status: 510,
              apiLocation: '',
              dioExceptionType: '애플 로그인 취소'
          ),
          data: [],
          tokenError: false
      );
    }
  }

}