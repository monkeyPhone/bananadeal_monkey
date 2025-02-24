import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';

abstract class InfoEditRepository {
  const InfoEditRepository();

  Future<StatusEnum> fetchThumbnail({
    required String eMail,
    required String originImage,
    required String imageUrl,
  });

  Stream<StatusEnum> memberOut({
    required int currentIndex,
    required String answer,
  });


  Future<DataDto> checkDuplication(String name);

  Future<StatusEnum> updateUser({required Map<String, dynamic> dataMap,});

  Future<DataDto> sendPw({
    required String email, required String pw, bool? isSign,
  });

  String passwordValidateDouble({
    required String password1,
    required String password2,
  });

  String passwordValidate({
    required String password,
  });

}