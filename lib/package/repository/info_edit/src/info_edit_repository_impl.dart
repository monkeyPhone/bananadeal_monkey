import 'package:banana_deal_by_monkeycompany/package/api/auth/auth_api.dart';
import 'package:banana_deal_by_monkeycompany/package/api/user_edit/user_edit_api.dart';
import 'package:banana_deal_by_monkeycompany/package/api/user_reg/user_reg_api.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/info_edit/info_edit_repository.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/info_edit/src/helper/info_edit_validate.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';

class InfoEditRepositoryImpl implements InfoEditRepository {
  final DioRepository dio;
  final UserEditApi userEditApi;
  final UserRegApi userRegApi;
  final AuthApi authApi;
  final InfoEditValidate validate;
  const InfoEditRepositoryImpl({
    required this.dio,
    required this.userEditApi,
    required this.userRegApi,
    required this.authApi,
    required this.validate
  });

  @override
  Future<StatusEnum> fetchThumbnail({
    required String eMail,
    required String originImage,
    required String imageUrl,
  }) async => await userEditApi.fetchThumbnail(eMail: eMail, originImage: originImage, imageUrl: imageUrl, dio: dio);

  @override
  Stream<StatusEnum> memberOut({
    required int currentIndex,
    required String answer,
  }) => Stream.fromFuture(userEditApi.memberOut(currentIndex: currentIndex, answer: answer, dio: dio));


  @override
  Future<DataDto> checkDuplication(String name) async => await userRegApi.checkNick(nick: name, dio: dio);

  @override
  Future<StatusEnum> updateUser({required Map<String, dynamic> dataMap,}) async => await userEditApi.updateUser(dataMap: dataMap, dio: dio);

  @override
  Future<DataDto> sendPw({
    required String email, required String pw, bool? isSign,
  }) async => await authApi.resetPw(email: email, pw: pw, dio: dio);


  @override
  String passwordValidateDouble({
    required String password1,
    required String password2,
  }) => validate.passwordValidateDouble(password1: password1, password2: password2);

  @override
  String passwordValidate({
    required String password,
  }) => validate.passwordValidate(password: password);


}