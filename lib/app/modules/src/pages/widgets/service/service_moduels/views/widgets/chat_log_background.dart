import 'dart:io';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/service/service_moduels/controllers/chat_log_controller.dart';
import 'package:flutter/material.dart';

class ChatLogBackground extends StatefulWidget{
  const ChatLogBackground({Key? key}) : super(key: key);

  @override
  State<ChatLogBackground> createState() => _ChatLogBackgroundState();

}

class _ChatLogBackgroundState extends State<ChatLogBackground> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async{
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.resumed:
        await ChatLogController.to.socketResume();
        ChatLogController.to.updateErrorLoading(false, false);
        break;
      case AppLifecycleState.hidden:  // <-- This is the new state.
      case AppLifecycleState.detached:
        break;
      case AppLifecycleState.inactive:
        ChatLogController.to.leaveChatEmit();
        ChatLogController.to.updateErrorLoading(true, true);
        // Do something when the app is not visible...
        break;
      case AppLifecycleState.paused:
        ChatLogController.to.leaveChatEmit();
        ChatLogController.to.updateErrorLoading(true, true);
      // Do something when the app is not visible...
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}

