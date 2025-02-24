import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';

class AuthAction {
  const AuthAction();

  Future<DataDto> findEmail({
    required DioRepository dio,
    required String email,
  }) async{

    String apiUrl = 'check/email/findpw';

    DataDto data = await dio.getDto(
        restApiEnum: RestApiEnum.guest,
        endPoint: apiUrl,
        repositoryName: 'AuthOtpRepository',
        form: {
          "M_email": email,
        }
    );

    return data;

  }

  Future<DataDto> checkEmail({
    required DioRepository dio,
    required String email,
  }) async{

    String apiUrl = 'check/email';

    DataDto data = await dio.getDto(
        restApiEnum: RestApiEnum.guest,
        endPoint: apiUrl,
        repositoryName: 'AuthOtpRepository',
        form: {
          "M_email": email,
        }
    );

    return data;

  }


  Future<DataDto> createPw({
    required DioRepository dio,
    required String email,
    required String pw,
  }) async{

    String apiUrl = 'join';

    DataDto data = await dio.getDto(
        restApiEnum: RestApiEnum.guest,
        endPoint: apiUrl,
        repositoryName: 'AuthOtpRepository',
        form: {
          "M_email": email,
          "M_pw": pw
        }
    );

    return data;

  }

  Future<DataDto> resetPw({
    required DioRepository dio,
    required String email,
    required String pw,
  }) async{

    String apiUrl = 'pw/edit';

    DataDto data = await dio.getDto(
        restApiEnum: RestApiEnum.guest,
        endPoint: apiUrl,
        repositoryName: 'AuthOtpRepository',
        form: {
          "M_email": email,
          "M_pw": pw
        }
    );

    return data;

  }

}