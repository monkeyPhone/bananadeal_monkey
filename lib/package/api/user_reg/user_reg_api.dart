import 'package:banana_deal_by_monkeycompany/verse/core/common/cache/provider/auth_cache_provider.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';

abstract class UserRegApi {
  const UserRegApi();

  Future<DataDto> checkNick({
    required String nick,
    required DioRepository dio,
  });

  Future<DataDto> updateInfo({
    required DioRepository dio,
    required AuthCacheProvider provider,
    required String thumb,
    required String nick,
    required String dong,
    required String road,
    required (double, double) nat,
  });

}