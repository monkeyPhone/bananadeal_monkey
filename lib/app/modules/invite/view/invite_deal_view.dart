import 'package:banana_deal_by_monkeycompany/app/modules/invite/controller/invite_deal_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/invite/view/invite/invite_deal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'complete_deal_view.dart';


class InviteDealView extends StatelessWidget {
  final bool isClose;
  const InviteDealView({
    required this.isClose,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InviteDealController>(
        builder: (controller) =>
            PopScope(
              canPop: false,
              onPopInvokedWithResult: (bool didPop, Object? result) async{
                if(didPop) {
                  return;
                }
                switch(controller.completed.value){
                  case true:
                    await controller.clickCompleted();
                  case false:
                    isClose
                        ? await controller.clickCompleted()
                        :
                    controller.commonWidgets.customDialog(
                      routerContext: context,
                      barrierDismissible: false,
                      mainText: '견적을 받아볼 매장을 선택하지 않았습니다.',
                      mainText2: '정말 아무도 초대하지 않고 딜을 등록할까요?',
                      caption: ('※ 아무도 초대하지 않고 딜을 등록하는 경우',
                      '잊지 말고, 메인 화면에서 매장을 추가하세요.'),
                      cancleText: '아니오', confirmText: '네',
                      conFirmOnTap: () {
                        controller.completed.value = true;
                        Get.back();
                      },
                    );
                }
              },
              child: Stack(
                children: [
                  controller.completed.value
                      ? CompleteDealView()
                      : InviteDeal(
                    isClose: isClose,
                    isNow: controller.initStateNow.value,
                  ),
                ],
              ),
            )

    );
  }
}