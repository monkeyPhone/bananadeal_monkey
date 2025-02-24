import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';

abstract class LoginApi {

  Future<DataDto> postEmailLogin({required DioRepository dio, required String email, required String pw});

  Future<DataDto> postKakaoLogin(DioRepository dio);

  Future<DataDto> postAppleLogin(DioRepository dio);

}