import 'package:banana_deal_by_monkeycompany/config/model_config.dart';
import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/api/chat_log/model/data/chat_log_dto.dart';
import 'package:banana_deal_by_monkeycompany/package/data/chat_room_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/chat_log/chat_log_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_string.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/chat/manager/chat_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/route/state/cubit/banana_route/banana_route_cubit.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/chat_log/state/bloc/banana_chat_log_repo/banana_chat_log_repo_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/chat_log/state/bloc/banana_chat_log_show/banana_chat_log_show_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/chat_log/state/cubit/banana_chat_log_socket/banana_chat_log_socket_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatLogManager {
  final BuildContext routerContext;
  final ChatRoomVO room;
  final bool isUsed;
  final bool isChat;
  final SharedPreferences mainPrefs;
  final ChatLogRepository chatLogRepository;

  const ChatLogManager({
    required this.routerContext,
    required this.room,
    required this.isUsed,
    required this.isChat,
    required this.mainPrefs,
    required this.chatLogRepository,
  });

  Future<bool> reConnectChat({
    required BuildContext context,
    required  List<ChatLogDto> repoList
  }) async{
    await Future.delayed(const Duration(milliseconds: 200));
    DataDto data = await chatLogRepository.getChatLog(
        limit: '${repoList.length}'
    );
    switch(data.statusEnum){
      case StatusEnum.success:
        List<ChatLogDto> repo = repoList;
        List<ChatLogDto> addList = convertChatLogDto(data.data);
        repo.addAll(addList);
        if(context.mounted){
          context.read<BananaChatLogRepoBloc>().add(GetChatLog(data: repo));
          context.read<BananaChatLogShowBloc>().add(AddManyChat(data: addList));
          context.read<BananaChatLogSocketCubit>().socketConnect();
          sendImagePath(context);
        }
        return true;
      case StatusEnum.later:
        if(context.mounted){
          context.read<BananaChatLogSocketCubit>().socketConnect();
          sendImagePath(context);
        }

        return true;
      default:
        if(context.mounted){
          context.read<VerseConfig>().browser.snackBar.showSnackBar(
              context: context,
              text: '채팅방 재연결에 실패했습니다. 다시 연결해주세요.'
          );
          closePage(context, true);
        }
        return false;
    }
  }


  void sendImagePath(BuildContext context){
    String? imagePath = mainPrefs.getString('${room.crIdx} saveCacheImage');
    if(imagePath != null){
      context.read<BananaChatLogSocketCubit>().sendMessage(
          messageText: imagePath,
      );
      mainPrefs.remove('${room.crIdx} saveCacheImage');
    }
  }

  void closePage(BuildContext context, bool isOut) async{
    context.read<BananaChatLogRepoBloc>().add(const SaveChatLog());
    context.read<BananaChatLogSocketCubit>().leaveChat();
    if(isOut == false){
      context.read<BananaChatLogShowBloc>().add(const ConvertY());
    }
    if(isOut == true){
      context.read<VerseConfig>().route.closePage(context);
      isChat ? routerContext.read<ChatManager>().reloadRoom(routerContext) : null;
      await mainPrefs.remove(chatImageList);
    }
  }


  void messageUpdate({
    required ChatLogDto data,
    required BuildContext context,
    required bool isUp
  }){
    context.read<BananaChatLogRepoBloc>().add(AddChatLog(data: data));
    context.read<BananaChatLogShowBloc>().add(AddMoreChat(data: data, isUp: isUp));
    context.read<BananaChatLogSocketCubit>().messageSet(message: '', messageData: ModelConfig.chatLogDto);
  }


  Future<String> sendImage({
    required String imagePath,
    required BuildContext context
  }) async {
    String result = await chatLogRepository.sendImage(imagePath: imagePath);
    try{
      if(context.mounted){
        if(context.read<BananaChatLogSocketCubit>().socket.connected){
          mainPrefs.remove('${room.crIdx} saveCacheImage');
          context.read<BananaChatLogSocketCubit>().sendMessage(
            messageText: result,
          );
          return result;
        }
        else{
          if(context.mounted){
            await _result(context: context, result: result);
          }
          return result;
        }
      } else {
        return '';
      }
    }catch(_){
      if(context.mounted){
        await _result(context: context, result: result);
      }
      return result;
    }
  }

  Future<void> _result({
    required BuildContext context,
    required String result,
  }) async{
    if(context.mounted && result != ''){
      await mainPrefs.setString('${room.crIdx} saveCacheImage', result);
    } else{
      if(context.mounted){
        context.read<VerseConfig>().browser.snackBar.showSnackBar(context: context, text: '이미지 저장 실패');
      }
      else{

      }
    }
  }


  List<ChatLogDto> getShowLog({
    required List<ChatLogDto> data,
  }){
    if(data.isNotEmpty){
      int startIndex = data.length > 100 ? data.length - 100 : 0;
      List<ChatLogDto> result = data.sublist(startIndex);
      return result;
    }
    else{
      return <ChatLogDto>[];
    }

  }

  void gotoUploadView(BuildContext context) =>
      context.read<VerseConfig>().tab.gotoUploadView(
          context: context, caseUpload: UploadEnum.chat,
          callBack: (String thumbNail){
            sendImage(imagePath: thumbNail, context: context);
          }
      );

  void gotoStoreDetailView(BuildContext context) =>
      context.read<VerseConfig>().tab.gotoStoreDetailView(
          context: context,
          smId: room.smMId,
          storeName: room.smStoreName,
          mIdx: context.read<BananaRouteCubit>().state.userVO.mIdx,
          favoriteStore: context.read<ChatLogManager>().room.favoriteStore,
          isStore: false,
          isSearch: false
      );


  void clipBoard(){}

  Future<List<String>> getImageList(BuildContext context) async=>
      await chatLogRepository.getImageList();

  void exitChat({
    required BuildContext context,
  }) => context.read<VerseConfig>().browser.dialog.customDialog(routerContext: context,
      mainText: '상담을 종료하시겠습니까?',
      captionText: '채팅 상담을 종료하면, 이전 대화 내용은 삭제되며 복구할 수 없습니다.',
      confirmText: '나가기',
      conFirmOnTap: () async{
        final bool result = await chatLogRepository.exitChat();
        if(context.mounted){
          if(result) {
            context.read<BananaChatLogSocketCubit>().sendExit();
            if(isChat){

            }
            context.read<VerseConfig>().route.closeDialog(context);
            closePage(context, true);
            await mainPrefs.remove('${room.crIdx}');

          }
          else{
            context.read<VerseConfig>().browser.snackBar.showSnackBar(context: context, text: '잠시 후 다시 시도해주세요.');
          }
        }
      },
      cancelText: '취소',
      cancelOnTap: (){
        context.read<VerseConfig>().route.closeDialog(context);
      });

}