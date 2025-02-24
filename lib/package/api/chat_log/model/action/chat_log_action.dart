import 'dart:io';
import 'package:banana_deal_by_monkeycompany/config/datetime_config.dart';
import 'package:banana_deal_by_monkeycompany/package/api/chat_log/model/data/chat_image_dto.dart';
import 'package:banana_deal_by_monkeycompany/package/api/chat_log/model/data/chat_image_entity.dart';
import 'package:banana_deal_by_monkeycompany/package/api/chat_log/model/data/chat_log_dto.dart';
import 'package:banana_deal_by_monkeycompany/package/api/chat_log/model/data/chat_log_entity.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/url/common_url.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_string.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatLogAction{
  const ChatLogAction();

  final String _where = 'ChatLogApi_ChatLogAction';

  Future<void> setImage({
    required SharedPreferences mainPrefs,
    required List<ChatLogDtoRow> loadChats,
  })  async{
    List<ChatLogDto> data = loadChats.where((ent) => ent.cMessage.contains('UPLOAD/IMAGES/')).map((entity) => entity.toHigh()).toList();
    final ChatLogEntity result = ChatLogEntity(data: data);
    String cache = chatLogEntityToJson(result);
    await mainPrefs.setString(chatImageList, cache);
  }

  Future<(bool, List<ChatLogDto>)> setCache({
    required SharedPreferences mainPrefs,
    required String roomIdx,
    required List<ChatLogDtoRow> loadChats,
  }) async{
    try{
      for( var i=0; i< loadChats.length; i++ ){
        if(loadChats[i].cIsRead == 'N'){
          loadChats[i].cIsRead = 'Y';
        }
      }
      List<ChatLogDto> data = loadChats.map((entity) => entity.toHigh()).toList();
      final ChatLogEntity result = ChatLogEntity(data: data);
      String cache = chatLogEntityToJson(result);
      await mainPrefs.setString(roomIdx, cache);

      return (true, data);
    } catch(_){
      return (false, <ChatLogDto>[]);
    }

  }

  Future<String> sendImage({
    required DioRepository dio,
    required String imagePath,
    required String roomIdx,
  }) async{
    var file = File(imagePath);
    MultipartFile multi = MultipartFile.fromFileSync(file.path,);
    Map<String, dynamic> json = await dio.getJson(repositoryName: _where,  restApiEnum: RestApiEnum.chatImg,
        endPoint: 'chat/image',
        isMsg: true,
        form:  {
          "C_room_idx": roomIdx,
          "C_message": multi,
          "C_regdate": DateFormat("yyyyMMdd").format(DateTimeConfig().now)
        });
    final ChatImageEntity entity = ChatImageEntity.fromJson(json);
    final String result = entity.result.isNotEmpty ? chatImageDtoToJson(entity.result.first) : '';
    return result;
  }

  Future<List<String>> getImageList({
    required DioRepository dio,
    required CommonUrl url,
    required String roomIdx
  }) async{
    DataDto data = await dio.getDto(repositoryName: _where, restApiEnum: RestApiEnum.chatApi, endPoint: 'chat/imglist',
        form:  {
          "CR_idx" : roomIdx
        }
    );
    if(data.statusEnum == StatusEnum.success){
      List<ChatLogDto> dto = convertChatLogDto(data.data);
      List<ChatImageDto> vo = dto.map((e) => chatImageDtoFromJson(e.cMessage)).toList();
      List<String> result = vo.map((e) => '${url.bananaChat}${e.imageUrl}').toList();
      return result;
    }
    else{
      return [];
    }
  }

  Future<bool> exitChat({
    required DioRepository dio,
    required String roomIdx
  }) async{
    final DataDto data = await dio.getDto(
        repositoryName: _where,
        restApiEnum: RestApiEnum.user,
        endPoint: 'room/leave',
        form: {
          "CR_idx" : roomIdx
        }
    );

    final bool result = data.statusEnum == StatusEnum.success;
    return result;
  }

}