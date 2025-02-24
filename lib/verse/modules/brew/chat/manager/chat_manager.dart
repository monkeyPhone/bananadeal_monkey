import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/data/chat_room_vo.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/chat/state/bloc/banana_chat_room/banana_chat_room_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/route/state/cubit/banana_route/banana_route_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatManager {
  const ChatManager();


  Future<void> gotoChatLogView({
    required BuildContext context,
    required ChatRoomVO room,
  }) async{
    context.read<BananaChatRoomBloc>().add(const LoadingGotoRoom(StatusEnum.loading));
    if(room.crIdx == 0){
      _chatDefault(context:context, where: 'gotoChat');
    }
    else{
      await context.read<VerseConfig>().tab.gotoChatLogView(
          context: context,
          isChat: true,
        mIdx: context.read<BananaRouteCubit>().state.userVO.mIdx,
        smId: room.smMId, prefs: context.read<VerseConfig>().cache.mainCache.prefs,
      );
    }
  }

  void reloadRoom(BuildContext context){
    context.read<BananaChatRoomBloc>().add(const ReloadRoom());
  }


  void _chatDefault({
    required BuildContext context,
    required String where,
  }) {
    context.read<VerseConfig>().browser.snackBar.showSnackBar(
        context: context, text: '채팅방의 정보를 불러올 수 없습니다. 잠시 후, 다시 시도해주세요.'
    );
    // log('$where fail');
  }


}