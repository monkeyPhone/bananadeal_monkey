import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/components/alert_page/alert_icon_detail.dart';
import 'package:flutter/material.dart';
import '../../../../src_components/controllers/src_noti_controller.dart';
import 'dart:async';


class AlertIcon extends StatefulWidget{
  const AlertIcon({Key? key,
  }) : super(key: key
  );

  @override
  State<AlertIcon> createState() => _AlertIconState();

}

class _AlertIconState extends State<AlertIcon> with WidgetsBindingObserver {
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

  // @override
  // void didHaveMemoryPressure() {
  //   super.didHaveMemoryPressure();
  //   log('currentState: low memory');
  // }


  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async{
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed){
      /*
      TODO:// 같은 함수이지만 두 번 호출하는 이유는 한 번만 호출 했을 때 상태 변경이 안됨. 딱 이렇게 작성 했을 때만 적용이됨, GetX 버그인지 shared preferrence 버그인지 확인해봐야 됨.
      */
      await SrcNotiController.to.receiveNotiBack1();
      Timer(const Duration(seconds: 1), () async{
        await SrcNotiController.to.receiveNotiBack2();

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertIconDetail();
  }
}





