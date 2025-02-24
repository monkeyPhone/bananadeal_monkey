import 'package:banana_deal_by_monkeycompany/package/api/user_reg/model/action/user_reg_action.dart';
import 'package:banana_deal_by_monkeycompany/package/api/user_reg/user_reg_api.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/cache/provider/auth_cache_provider.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';

class UserRegApiImpl extends UserRegApi {
  final UserRegAction action;


  const UserRegApiImpl({
    required this.action,
  });

  @override
  Future<DataDto> checkNick({
    required String nick,
    required DioRepository dio,
  }) async => await action.checkNick(dio: dio, nick: nick);

  @override
  Future<DataDto> updateInfo({
    required DioRepository dio,
    required AuthCacheProvider provider,
    required String thumb,
    required String nick,
    required String dong,
    required String road,
    required (double, double) nat,
  }) => action.updateInfo(thumb: thumb, nick: nick, dong: dong, road: road, nat: nat, dio: dio, provider: provider);

}