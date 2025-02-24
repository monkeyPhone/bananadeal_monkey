import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';

class ChatRoomAction {
  const ChatRoomAction();

  final String _where = 'ChatRoomApi_ChatRoomAction';

  Future<DataDto> getChatRoom({
    required DioRepository dio,
    required int mIdx
  }) async{

    final DataDto dto = await dio.getDto(
        repositoryName: _where,
        restApiEnum: RestApiEnum.user,
        limit: true,
        endPoint: 'room/list',
        form:  {
          "CR_m_idx": mIdx,
        }
    );

    return dto;
  }

  Future<DataDto> getChatRoomByIdxCreate({
    required DioRepository dio,
    required int mIdx,
    required String smMid,
    required String userMessage,
  }) async{

    final DataDto dto = await dio.getDto(
        repositoryName: _where,
        restApiEnum: RestApiEnum.user,
        limit: true,
        endPoint: 'room/list/byidx/smid/only',
        form:  {
          "M_idx": mIdx,
          "SM_m_id": smMid,
          "User_message": userMessage
        }
    );

    return dto;
  }

  Future<DataDto> getChatRoomByIdx({
    required DioRepository dio,
    required int mIdx,
    required String smMid,
  }) async{

    final DataDto dto = await dio.getDto(
        repositoryName: _where,
        restApiEnum: RestApiEnum.user,
        limit: true,
        endPoint: 'room/list/byidx/smid/only',
        form:  {
          "M_idx": mIdx,
          "SM_m_id": smMid,
        }
    );

    return dto;
  }



  Future<DataDto> getChatLog({
    required DioRepository dio,
    required String roomIdx,
    required String limit
  }) async {
    final DataDto dto = await dio.getDto(
        repositoryName: _where,
        restApiEnum: RestApiEnum.chatApi,
        endPoint: 'chat/list',
        limit: true,
        form:  {
          "CR_idx": roomIdx,
          "C_limit": limit,
        }
    );

    return dto;
  }

}