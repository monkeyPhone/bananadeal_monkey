import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';

class StoreAction {
  const StoreAction();

  final String _where = 'StoreAction';

  Future<DataDto> fetchData({
    required DioRepository dio,
    required int page,
    required String order,
    required String orderBy,
  }) async{
    final DataDto dto = await dio.getDto(
      repositoryName: _where,
      restApiEnum: RestApiEnum.user,
      endPoint: 'member/store/list',
      form: {
        "start": page,
        "M_order": order,
        "M_asc": orderBy
      },
    );
    return dto;
  }

  Future<DataDto> getStoreListLength(DioRepository dio) async{
    final DataDto dto = await dio.getDto(
        limit: true,
        repositoryName: _where, restApiEnum: RestApiEnum.user, endPoint: 'member/store/list/cnt');
    return dto;
  }

  Future<bool> sendFavorite({
    required DioRepository dio,
    required bool isFavorite,
    required int mIdx,
    required String smId,
  }) async{
    final  DataDto dto =  isFavorite
        ? await _deleteFavorite(dio: dio, mIdx: mIdx, smId: smId)
        : await _sendFavorite(dio: dio, mIdx: mIdx, smId: smId);
    final bool result = dto.statusEnum == StatusEnum.success;

    return result;
  }


  Future<DataDto> _sendFavorite({
    required DioRepository dio,
    required int mIdx,
    required String smId
  }) async{
    final DataDto dto = await dio.getDto(
      repositoryName: _where,
      restApiEnum: RestApiEnum.user,
      endPoint: 'favorites/create',
      form: {
        "F_m_idx": mIdx,
        "F_sm_m_id": smId,
      },
    );
    return dto;
  }

  Future<DataDto> _deleteFavorite({
    required DioRepository dio,
    required int mIdx,
    required String smId
  }) async{
    final DataDto dto = await dio.getDto(
      repositoryName: _where,
      restApiEnum: RestApiEnum.user,
      endPoint: 'favorites/delete',
      form: {
        "F_m_idx": mIdx,
        "F_sm_m_id": smId,
      },
    );
    return dto;
  }

}