import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';

abstract class UserEditApi {
  const UserEditApi();

  Future<StatusEnum> updateUser({
    required Map<String, dynamic> dataMap,
    required DioRepository dio,
  });

  Future<StatusEnum> fetchThumbnail({
    required String eMail,
    required String originImage,
    required String imageUrl,
    required DioRepository dio,
  });

  Future<StatusEnum> memberOut({
    required int currentIndex,
    required String answer,
    required DioRepository dio,
  });

}