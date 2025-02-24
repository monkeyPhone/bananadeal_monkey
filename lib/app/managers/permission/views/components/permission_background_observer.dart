import 'package:banana_deal_by_monkeycompany/app/managers/permission/controllers/permission_page_controller.dart';
import 'package:flutter/material.dart';
import 'dart:async';


class PermissionBackgroundObserver extends StatefulWidget{
  final int androidSdkVersion;
  const PermissionBackgroundObserver({
    required this.androidSdkVersion,
    Key? key}) : super(key: key);

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
    if (state == AppLifecycleState.resumed){
      /*
      TODO:// 같은 함수이지만 두 번 호출하는 이유는 한 번만 호출 했을 때 상태 변경이 안됨. 딱 이렇게 작성 했을 때만 적용이됨, GetX 버그인지 shared preferrence 버그인지 확인해봐야 됨.
      */
      await PermissionPageController.to.refreshed(androidSdk: widget.androidSdkVersion, out: true);
      Timer(const Duration(seconds: 1), () async{
        await PermissionPageController.to.refreshed(androidSdk: widget.androidSdkVersion, out: true);
      });
    } else {

    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox();
  }
}





