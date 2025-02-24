import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/api/chat_log/model/action/chat_log_action.dart';
import 'package:banana_deal_by_monkeycompany/package/api/chat_log/model/chat_log_api_impl.dart';
import 'package:banana_deal_by_monkeycompany/package/api/chat_log/model/data/chat_log_dto.dart';
import 'package:banana_deal_by_monkeycompany/package/api/chat_room/model/action/chat_room_action.dart';
import 'package:banana_deal_by_monkeycompany/package/api/chat_room/model/chat_room_api_impl.dart';
import 'package:banana_deal_by_monkeycompany/package/data/chat_room_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/chat_log/src/chat_log_repository_impl.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/route/src/route_repository_impl.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/cache/singleton/main_cache_singleton.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/method/api/model/data/canvas_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/route/state/cubit/banana_route/banana_route_cubit.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/chat_log/manager/chat_log_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/chat_log/state/bloc/banana_chat_log_repo/banana_chat_log_repo_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/chat_log/state/bloc/banana_chat_log_show/banana_chat_log_show_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/chat_log/state/bloc/banana_chat_log_widget/banana_chat_log_widget_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/chat_log/state/cubit/banana_chat_log_socket/banana_chat_log_socket_cubit.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/chat_log/state/listener/chat_log_listener.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/chat_log/view/widgets/keyboard/chat_log_keyboard_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/chat_log/view/widgets/list/chat_log_list_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/bd_ripple_button_basic.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/special/bd_ripple_icon_on_button.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/canvas/bd_canvas.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/loading/spin/bd_loading_spin.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ChatLogView extends StatelessWidget {
  final bool isChat;
  final ChatRoomVO room;
  final bool isUsed;
  final BuildContext routerContext;
  final List<ChatLogDto> dto;

  const ChatLogView({super.key,
    required this.isChat,
    required this.room,
    required this.isUsed,
    required this.routerContext,
    required this.dto
  });

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider<ChatLogApiImpl>(
              create: (BuildContext context) =>
                  const ChatLogApiImpl(
                      action: ChatLogAction(),
                  )
          ),

          RepositoryProvider<ChatLogRepositoryImpl>(
              create: (BuildContext context) =>
              ChatLogRepositoryImpl(
                api: context.read<ChatLogApiImpl>(),
                roomApi: context.read<ChatRoomApiImpl>(),
                mainPrefs: context.read<VerseConfig>().cache.mainCache.prefs,
                roomIdx: '${room.crIdx}',
                dio: context.read<VerseConfig>().dio,
                url: context.read<VerseConfig>().url,
              )
          ),

          RepositoryProvider<ChatLogManager>(
              create: (BuildContext context) =>
                  ChatLogManager(
                      routerContext: routerContext,
                      isUsed: isUsed,
                      room: room,
                      isChat: isChat,
                    mainPrefs: MainCacheSingleton.prefs,
                    chatLogRepository: context.read<ChatLogRepositoryImpl>()
                  )
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider<BananaChatLogRepoBloc>(
              create: (BuildContext context) =>
              BananaChatLogRepoBloc(
                  repository: context.read<ChatLogRepositoryImpl>())..add(
                  GetChatLog(data: dto
                  )),
            ),
            BlocProvider<BananaChatLogShowBloc>(
                create: (BuildContext context) =>
                BananaChatLogShowBloc()..add(
                    GetChatPageNation(showList: context.read<ChatLogManager>().getShowLog(
                        data: dto)
                    )
                )
            ),
            BlocProvider<BananaChatLogWidgetBloc>(
                create: (BuildContext context) =>
                    BananaChatLogWidgetBloc()
            ),
            BlocProvider<BananaChatLogSocketCubit>(
                create: (BuildContext context) =>
                    BananaChatLogSocketCubit(
                        user: context.read<BananaRouteCubit>().state.userVO,
                        room: room,
                        chatUrl: context.read<VerseConfig>().url.bananaChat,
                        isUsed: isUsed
                    )
            )
          ],
          child: const _Canvas(),
        )
    );
  }
}


class _Canvas extends StatelessWidget {
  const _Canvas();

  @override
  Widget build(BuildContext context) {
    return BdCanvas(
      isForm: true,
      listener: const _Listener(),
      canvasEnum: CanvasEnum.chatLog,
      appbar: (context.read<ChatLogManager>().room.smStoreName, null, null, const _Actions()),
      body: const _Body(),
      navNullAble: true,
    );
  }
}

class _Listener extends StatelessWidget {
  const _Listener();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<BananaChatLogRepoBloc, BananaChatLogRepoState, List<ChatLogDto>>(
        selector: (state) => state.repoList,
        builder: (context, repoList) =>
            ChatLogListener(repoList: repoList,)
    );
  }
}


class _Actions extends StatelessWidget {
  const _Actions();

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return  BdRippleIconOnButton(
        size: size,
        onTap: () {
          context.read<ChatLogManager>().exitChat(context: context);
        },
        icon: Icons.exit_to_app
    );
  }
}


class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            const _SocketConnect(),
            Expanded(
                child: Container(
                  color: greyEAEAEA,
                  child: const Stack(
                    children: [
                      _ChatLog(),
                      _StackArea()
                    ],
                  ),
                )
            ),
            const ChatLogKeyboardView()
          ],
        ),
        const _LoadingArea()
      ],
    );
  }
}

class _SocketConnect extends StatefulWidget {
  const _SocketConnect();

  @override
  State<_SocketConnect> createState() => _SocketConnectState();
}

class _SocketConnectState extends State<_SocketConnect> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<BananaChatLogWidgetBloc>().scrollController = ScrollController();
    try{
      if(context.read<BananaChatLogSocketCubit>().socket.connected){

      }
    }catch(_){
      context.read<BananaChatLogSocketCubit>().socketConnect();
    }

  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    context.read<BananaChatLogWidgetBloc>().scrollController.addListener(() {
      if(context.read<BananaChatLogWidgetBloc>().scrollController.position.pixels <= 1000){
        context.read<BananaChatLogSocketCubit>().changeEdge(false);
      } else{
        context.read<BananaChatLogSocketCubit>().changeEdge(true);
      }
      // if(chatScrollController.position.pixels != 0.0)
      // {
      //   scrollEdge.value = false;
      // }
      // if(chatScrollController.position.pixels == 0.0){
      //   scrollEdge.value = true;
      // }
      if(context.read<BananaChatLogWidgetBloc>().scrollController.position.pixels == context.read<BananaChatLogWidgetBloc>().scrollController.position.maxScrollExtent){
        context.read<BananaChatLogShowBloc>().add(LoadMoreChat(data: context.read<BananaChatLogRepoBloc>().state.repoList));
      }
      // if(chatScrollController.position.pixels <= 500 && saveLog.isNotEmpty){
      //   ChatController.to.addShowLogOuter(saveLog);
      //   saveLog.clear();
      //   update();
      // }
    });
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}

class _ChatLog extends StatelessWidget {
  const _ChatLog();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<BananaChatLogShowBloc, BananaChatLogShowState, List<ChatLogDto>>(
        selector: (state) => state.showList,
        builder: (context, show) =>
            Scrollbar(
              controller: context.read<BananaChatLogWidgetBloc>().scrollController,
              thumbVisibility: true,
              child: ListView.builder(
                  controller: context.read<BananaChatLogWidgetBloc>().scrollController,
                  padding: EdgeInsets.symmetric(
                      horizontal: context.read<VerseConfig>().size.sized16grid
                  ),
                  itemCount: show.length,
                  shrinkWrap: true,
                  reverse: true,
                  physics: const ClampingScrollPhysics(),
                  dragStartBehavior: DragStartBehavior.start,
                  itemBuilder: (BuildContext context, int index) =>
                      ChatLogListView(
                        key: ValueKey('${show[index].cRegdate}_$index'),
                        index: index,
                        show: show,
                      )
              ),
            )
    );
  }
}



class _LoadingArea extends StatelessWidget {
  const _LoadingArea();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<BananaChatLogSocketCubit, BananaChatLogSocketState, bool>(
        selector: (state) => state.isDisconnect,
        builder: (context, isDisconnect) =>
        isDisconnect ? const Positioned.fill(child: BdLoadingSpin())
            : const SizedBox()
    );
  }
}


class _StackArea extends StatelessWidget {
  const _StackArea();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<BananaChatLogSocketCubit, BananaChatLogSocketState, bool>(
        selector: (state) => state.isUp,
        builder: (context, isUp) =>
        isUp ? const _StackString()
            : const SizedBox()
    );
  }
}

class _StackString extends StatelessWidget {
  const _StackString();

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return BlocSelector<BananaChatLogShowBloc, BananaChatLogShowState, List<ChatLogDto>>(
        selector: (state) => state.lazyList,
        builder: (context, saveList) =>
        saveList.isNotEmpty
            ? saveList.last.cMessage != ''
            ? Positioned(
            left: size.sized16grid,
            bottom: size.sized16grid,
            right: size.sized16grid,
            child: BdRippleButtonBasic(
                onTap: (){
                  context.read<BananaChatLogWidgetBloc>().scrollController.jumpTo(0.0);
                },
                borderRadius: BorderRadius.circular(999),
                color: Colors.black38,
                padding: EdgeInsets.symmetric(
                    vertical: size.sized12grid,
                    horizontal: size.sized16grid
                ),
                child: SizedBox(
                  width: size.widthCommon,
                  child: Text(
                    context.read<VerseConfig>().function.chatConvertTypeString(chat: saveList.last.cMessage),
                    style: TextStyle(
                        fontSize: size.sub,
                        color: white,
                        fontWeight: FontWeight.w600
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                  ),
                )
            )

        )
            : const SizedBox()
            : const SizedBox()
    );
  }
}