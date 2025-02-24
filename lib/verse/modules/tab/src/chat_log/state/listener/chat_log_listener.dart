import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/api/chat_log/model/data/chat_log_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/chat_log/manager/chat_log_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/chat_log/state/bloc/banana_chat_log_show/banana_chat_log_show_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/chat_log/state/cubit/banana_chat_log_socket/banana_chat_log_socket_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatLogListener extends StatefulWidget {
  final List<ChatLogDto> repoList;
  const ChatLogListener({super.key,
    required this.repoList
  });

  @override
  State<ChatLogListener> createState() => _ChatLogListenerState();
}

class _ChatLogListenerState extends State<ChatLogListener> with WidgetsBindingObserver {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async{
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.resumed:

        await context.read<ChatLogManager>().reConnectChat(context: context, repoList: widget.repoList);
      case AppLifecycleState.hidden:  // <-- This is the new state.
      case AppLifecycleState.detached:
        break;
      case AppLifecycleState.inactive:
        context.read<ChatLogManager>().closePage(context, false);
        // Do something when the app is not visible...
        break;
      case AppLifecycleState.paused:
        context.read<ChatLogManager>().closePage(context, false);
        // Do something when the app is not visible...
        break;

    // case AppLifecycleState.hidden:  // <-- This is the new state.
    // case AppLifecycleState.detached:
    //   context.read<ChatLogManager>().closePage(context, false);
    //   break;
    // case AppLifecycleState.inactive:
    //   context.read<ChatLogManager>().closePage(context, false);
    //   // Do something when the app is not visible...
    //   break;
    // case AppLifecycleState.paused:
    //   context.read<ChatLogManager>().closePage(context, false);
    //   // Do something when the app is not visible...
    //   break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
        listeners: [
          BlocListener<BananaChatLogSocketCubit, BananaChatLogSocketState>(
            listener: (context, state) {
              if(state.message != ''){
                context.read<ChatLogManager>().messageUpdate(data: state.messageData, context: context, isUp: state.isUp);
                context.read<BananaChatLogSocketCubit>().changeImageUrl('');
              }
              if(state.isUp == false){
                context.read<BananaChatLogShowBloc>().add(const AddScrollChat());
              }
              // if(state.isDisconnect == true){
              //   context.read<ChatLogManager>().closePage(context, true);
              // }
              if(state.errorMessage != ''){
                context.read<VerseConfig>().browser.snackBar.showSnackBar(context: context, text: state.errorMessage);
                context.read<BananaChatLogSocketCubit>().changeError('');
              }
            },
          ),
          // BlocListener<BananaChatLogWidgetBloc, BananaChatLogWidgetState>(
          //   listener: (context, state){
          //
          //   },
          // )
        ],
        child: const SizedBox());
  }
}