import 'package:banana_deal_by_monkeycompany/package/api/socket/socket_rest_api/socket_rest_api.dart';
import 'package:banana_deal_by_monkeycompany/package/data/invite_store_vo.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';

class SocketRestApiImpl implements SocketRestApi {
  const SocketRestApiImpl();

  final String _where = 'SocketRestApiImpl';

  @override
  Future<List<InviteStoreVO>> sendInvite({
    required DioRepository dio,
    required String mName,
    required bool isAll,
    required int diIdx,
    required String smMidList,
  }) async{
    List<InviteStoreVO> result =
    isAll
        ? await _inviteStoreAll(diIdx: diIdx, dio: dio, mName: mName)
        : await _inviteStore(diIdx: diIdx, smMidList: smMidList, dio: dio, mName: mName);
    return result;
  }


  Future<List<InviteStoreVO>> _inviteStore({
    required DioRepository dio,
    required int diIdx,
    required String smMidList,
    required String mName,
  }) async{
    final DataDto data = await dio.getDto(
        repositoryName: _where,
        restApiEnum: RestApiEnum.user,
        endPoint: 'deal/invite',
        form: {
          "D_di_idx": diIdx,
          "D_sm_m_id": smMidList,
          "M_name": mName
        }
    );
    final List<InviteStoreVO> result = convertInviteStoreVO(data.data);
    return result;
  }


  Future<List<InviteStoreVO>> _inviteStoreAll({
    required DioRepository dio,
    required String mName,
    required int diIdx,
  }) async{
    final DataDto data = await dio.getDto(
        repositoryName: _where,
        restApiEnum: RestApiEnum.user,
        endPoint: 'deal/invite/all',
        form: {
          "D_di_idx": diIdx,
          "M_name": mName
        }
    );
    final List<InviteStoreVO> result = convertInviteStoreVO(data.data);
    return result;
  }


}