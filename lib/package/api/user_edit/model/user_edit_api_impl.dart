import 'package:banana_deal_by_monkeycompany/package/api/user_edit/model/action/user_edit_action.dart';
import 'package:banana_deal_by_monkeycompany/package/api/user_edit/user_edit_api.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';

class UserEditApiImpl implements UserEditApi {
  final UserEditAction action;
  const UserEditApiImpl({
    required this.action
  });

  @override
  Future<StatusEnum> updateUser({
    required Map<String, dynamic> dataMap,
    required DioRepository dio,
  }) async => await action.updateUser(dataMap: dataMap, dio: dio);

  @override
  Future<StatusEnum> fetchThumbnail({
    required String eMail,
    required String originImage,
    required String imageUrl,
    required DioRepository dio,
  }) async => await action.fetchThumbnail(eMail: eMail, originImage: originImage, imageUrl: imageUrl, dio: dio);

  @override
  Future<StatusEnum> memberOut({
    required int currentIndex,
    required String answer,
    required DioRepository dio,
  }) async => await action.memberOut(currentIndex: currentIndex, answer: answer, dio: dio);

}