import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/api/chat_connect/model/action/chat_connect_action.dart';
import 'package:banana_deal_by_monkeycompany/package/api/chat_connect/model/chat_connect_api_impl.dart';
import 'package:banana_deal_by_monkeycompany/package/api/chat_room/model/action/chat_room_action.dart';
import 'package:banana_deal_by_monkeycompany/package/api/chat_room/model/chat_room_api_impl.dart';
import 'package:banana_deal_by_monkeycompany/package/data/chat_room_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/chat/src/chat_repository_impl.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/tab_chat/src/tab_chat_repository_impl.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/method/api/model/data/canvas_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/chat/manager/chat_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/chat/state/bloc/banana_chat_room/banana_chat_room_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/chat/state/listener/chat_listener.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/chat/view/widgets/list/chat_list_tile_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/route/state/cubit/banana_route/banana_route_cubit.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/canvas/bd_canvas.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/error/bd_refresh_button.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/loading/bd_loading_cont.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/loading/indicator/bd_refresh_indicator.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/loading/spin/bd_loading_spin.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/ui/bd_ui_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider<ChatRepositoryImpl>(
              create: (BuildContext context) =>
                  ChatRepositoryImpl(
                      api: context.read<ChatRoomApiImpl>(),
                      dio: context.read<VerseConfig>().dio,
                      mIdx: context.read<BananaRouteCubit>().state.userVO.mIdx
                  ),
          ),
          RepositoryProvider<ChatManager>(
              create: (BuildContext context) =>
                  const ChatManager()
          ),
        ],
        child: MultiBlocProvider(
            providers: [
              BlocProvider<BananaChatRoomBloc>(
                  create: (BuildContext context) =>
                  BananaChatRoomBloc(
                      repository: context.read<ChatRepositoryImpl>()
                  )..add(
                      const ReloadRoom()
                  )
              ),
            ],
            child: const _Canvas()
        )
    );
  }
}


class _Canvas extends StatelessWidget {
  const _Canvas();

  @override
  Widget build(BuildContext context) {
    return const BdCanvas(
      isPage: true,
      listener: ChatListener(),
      canvasEnum: CanvasEnum.homeCom,
      appbar: ('채팅', null, null, null),
      navNullAble: true,
      body: _BodySrc(),
    );
  }
}


class _BodySrc extends StatelessWidget {
  const _BodySrc();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<BananaChatRoomBloc, BananaChatRoomState, StatusEnum>(
        selector: (state) => state.status,
        builder: (context, status) => switch(status){
          StatusEnum.success => const _Success(),
          StatusEnum.loading => const _Success(),
          StatusEnum.later => const _Later(),
          _ => BdRefreshButton(onTap: (){
            context.read<ChatManager>().reloadRoom(context);
          })
        }
    );
  }
}

class _Success extends StatelessWidget {
  const _Success();

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        _List(),
        _Positioned()
      ],
    );
  }
}


class _List extends StatelessWidget {
  const _List();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<BananaChatRoomBloc, BananaChatRoomState, List<ChatRoomVO>>(
        selector: (state) => state.roomList,
        builder: (context, room) =>
            BdRefreshIndicator(
              onRefresh: () async{
                context.read<ChatManager>().reloadRoom(context);
              },
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics().applyTo(const ClampingScrollPhysics()),
                itemCount: room.length,
                itemBuilder: (BuildContext context, int index) =>
                    ChatListTileView(
                      key: ValueKey('${room[index].crIdx}_$index'),
                      room: room[index],
                    ),
              ),
            )
    );
  }
}

class _Positioned extends StatelessWidget {
  const _Positioned();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<BananaChatRoomBloc, BananaChatRoomState, StatusEnum>(
        selector: (state) => state.status,
        builder: (context, status) => switch(status){
          StatusEnum.loading => const BdLoadingCont(),
          _ => const SizedBox()
        }
    );
  }
}



class _Later extends StatelessWidget {
  const _Later();

  @override
  Widget build(BuildContext context) {
    return const BdUiDefault(
        text: '상담 중인 채팅방이 없습니다.');
  }
}