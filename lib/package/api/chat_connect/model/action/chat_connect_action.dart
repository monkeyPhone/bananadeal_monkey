import 'package:banana_deal_by_monkeycompany/config/model_config.dart';
import 'package:banana_deal_by_monkeycompany/package/api/chat_log/model/data/chat_log_dto.dart';
import 'package:banana_deal_by_monkeycompany/package/api/chat_log/model/data/chat_log_entity.dart';
import 'package:banana_deal_by_monkeycompany/package/api/chat_room/chat_room_api.dart';
import 'package:banana_deal_by_monkeycompany/package/data/chat_room_vo.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatConnectAction {
  const ChatConnectAction();

  final String _where = 'ChatConnectApi_ChatConnectAction';

  //채팅방 아닌곳에서 연결할 때 쓰는 라우트
  Future<(bool?, ChatRoomVO)> _getRoom({
    required int mIdx,
    required String smId,
    required DioRepository dio,
  }) async{
    final DataDto data = await dio.getDto(
        repositoryName: _where,
        restApiEnum: RestApiEnum.user,
        endPoint: 'room/list/byidx',
        form: {
          "CR_m_idx": mIdx,
          "CR_sm_m_id": smId,
        }
    );
    if(data.statusEnum == StatusEnum.success){
      if(data.data.isNotEmpty){
        final List<ChatRoomVO> vo = convertChatRoomVO(data.data);
        final (bool, ChatRoomVO) result = (true, vo.first);
        return result;
      }
      else{
        return (false, ModelConfig.chatRoomVO);
      }
    }
    else{
      return (null, ModelConfig.chatRoomVO);
    }
  }

  Future<(bool, ChatRoomVO)> getChatRoomByIdx({
    required int mIdx,
    required String smId,
    required DioRepository dio,
  }) async{
    final (bool?, ChatRoomVO) info = await _getRoom(
        mIdx: mIdx,
        smId: smId,
        dio: dio
    );
    if(info.$1 == null){
      return (false, ModelConfig.chatRoomVO);
    }
    else{
      if(info.$1!){
        return (true, info.$2);
      }
      else{
        final bool create = await createRoom(mIdx: mIdx, smId: smId, userMessage: '', dio: dio);
        if(create){
          final (bool?, ChatRoomVO) info2 = await _getRoom(
              mIdx: mIdx,
              smId: smId,
              dio: dio
          );
          if(info2.$1 == true){
            return (true, info2.$2);
          }
          else{
            return (false, ModelConfig.chatRoomVO);
          }
        }
        else{
          return (false, ModelConfig.chatRoomVO);
        }
      }
    }

  }

  Future<bool> createRoom({
    required int mIdx,
    required String smId,
    required String userMessage,
    required DioRepository dio,
  }) async{
    final DataDto dto = await dio.getDto(
      repositoryName: _where,
      restApiEnum: RestApiEnum.user,
      endPoint: 'room/create',
      form: {
        "CR_m_idx": mIdx,
        "CR_sm_m_id": smId,
        "User_message": userMessage,
      },
    );
    final bool result = dto.statusEnum == StatusEnum.success || dto.statusEnum == StatusEnum.failure;
    return result;
  }

  Future<bool> logTry({
    required ChatRoomVO room,
    required SharedPreferences mainPrefs,
    required ChatRoomApi roomApi,
    required DioRepository dio,
  }) async {
    final String? chatLog = mainPrefs.getString('${room.crIdx}');
    try {
      bool result = await  _callCase(
          chatLog: chatLog,
          room: room,
          mainPrefs: mainPrefs,
          roomApi: roomApi,
          dio: dio
      );
      return result;
    } catch (e) {
      await mainPrefs.remove('${room.crIdx}');
      return false;
    }
  }

  Future<bool> _callCase({
    required String? chatLog,
    required ChatRoomVO room,
    required SharedPreferences mainPrefs,
    required ChatRoomApi roomApi,
    required DioRepository dio,
  }) async{
    ChatLogEntity entity = switch(chatLog){
      null => ChatLogEntity(data: []),
      _ => chatLogEntityFromJson(
          chatLog
      )
    };


    DataDto data = await roomApi.getChatLog(
        roomIdx: '${room.crIdx}',
        limit: '${entity.data.length}',
        dio: dio
    );

    if(data.statusEnum == StatusEnum.success){
      entity.data.addAll(convertChatLogDto(data.data));
      bool result = await _setChat(
          roomIdx: '${room.crIdx}',
          chatLog: chatLogEntityToJson(entity),
          mainPrefs: mainPrefs
      );
      return result;
    } else{
      bool resultF = await _setChat(
          roomIdx: '${room.crIdx}',
          chatLog: chatLogEntityToJson(entity),
          mainPrefs: mainPrefs
      );
      return resultF;
    }
  }


  Future<bool> _setChat({
    required String roomIdx,
    required String chatLog,
    required SharedPreferences mainPrefs,
  }) async{
    try{
      await mainPrefs.setString(roomIdx, chatLog);
      return true;
    } catch(_){
      return false;
    }
  }

}