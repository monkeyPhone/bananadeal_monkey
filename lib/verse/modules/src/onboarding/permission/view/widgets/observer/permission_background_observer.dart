import 'package:banana_deal_by_monkeycompany/verse/modules/src/onboarding/permission/manager/permission_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PermissionBackgroundObserver extends StatefulWidget {
  const PermissionBackgroundObserver({super.key});

  @override
  State<PermissionBackgroundObserver> createState() => _PermissionBackgroundObserverState();
}

class _PermissionBackgroundObserverState extends State<PermissionBackgroundObserver> with WidgetsBindingObserver {
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
    if(state == AppLifecycleState.resumed){
      context.read<PermissionManager>().lifecycleResume(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}
