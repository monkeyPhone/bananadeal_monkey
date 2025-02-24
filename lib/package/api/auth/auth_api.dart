import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';

abstract class AuthApi {
  const AuthApi();

  Future<DataDto> findEmail({required String email, required DioRepository dio});
  Future<DataDto> checkEmail({required String email, required DioRepository dio});
  Future<DataDto> createPw({required String email, required String pw,  required DioRepository dio});
  Future<DataDto> resetPw({required String email, required String pw, required DioRepository dio});
}