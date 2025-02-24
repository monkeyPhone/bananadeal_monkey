import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_button.dart';
import 'package:banana_deal_by_monkeycompany/app/models/nav/deal/deal_estimate.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/store/pages/store_detail/controllers/store_detail_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/service/service_model/chat_user_room_list.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/src_components/controllers/src_estimate_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/src_components/controllers/src_info_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../css/size.dart';
import '../../../../../../../../css/style.dart';
import '../../../../../../src_components/bottom_nav_bar/controllers/bd_bot_nav_chat_controller.dart';
import '../declaration_dialog_only/declaration_only_dialog_helper.dart';

class DeclarationDialogHelper {

  Future modalOnTapSelect({
    required String nickName,
    required String text,
    required String type,
    required String userIdx,
    required String smId,
    required String ruIdx,
    required BuildContext routrerContext,
    }) async{
    final DealEstimate est = await SrcEstimateController.to.srcEstimateRepository.getDealEstimateByIdx(smMid: smId);
    final List<RoomList> roomList = await BdBotNavChatController.to.getRoomList(SrcInfoController.to.infoM.value.mIdx);
    if(est.status == 200){
      final List<DealEstimateList> estList = est.result;
      return showModalBottomSheet(
          isDismissible: true,
          context: routrerContext,
          isScrollControlled: true,
          builder: (context) {
            return Container(
              color: Style.white,
              child: SafeArea(
                child: Container(
                  child: GetX<StoreDetailController>(
                    builder: (StoreDetailController controller) {

                      return controller.dialogOpen.value
                          ?
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(
                            2,
                                (index) =>
                                RippleDecorationButton(
                                    onTap: () async{
                                      if(index == 0){
                                        if(!await controller.checkDeclaration(
                                            type: type, userIdx: userIdx, smId: smId, ruIdx: ruIdx
                                        )){
                                          controller.commonWidgets.customSnackbar('이전 신고내용이 처리중입니다.');
                                        } else{
                                          Navigator.pop(context);
                                          DeclarationOnlyDialogHelper().openDeclarationDialog(
                                            isOnly: false,
                                            type: type, ruIdx: ruIdx, nickName: nickName, text: text, userIdx: userIdx, smId: smId, );
                                        }
                                      }
                                      else{
                                        Navigator.pop(context);
                                        if (userIdx != '') {
                                          controller.commonWidgets.customBlockDialog(
                                              routerContext: routrerContext,
                                              barrierDismissible: false,
                                              smID: '',
                                              routeCase: 0,
                                              conFirmOnTap: () async {
                                                if(Get.isSnackbarOpen){
                                                  Get.back();
                                                } else{
                                                  await controller.blockCreate(
                                                      peIdx: userIdx, smMid: smId, name: nickName);
                                                }
                                              }, nickName: nickName);
                                        } else {
                                          if ( roomList
                                              .where((element) => element.smMId == smId).where((element) => element.crStatus == 'NORMAL')
                                              .isNotEmpty) {
                                            if( estList.isNotEmpty
                                                && estList
                                                    .where((p0) => p0.deSmMId == smId && p0.dStatus =='ACCEPT' ).isNotEmpty
                                            ) {
                                              controller.commonWidgets.customBlockDialog(
                                                  routerContext: routrerContext,
                                                  barrierDismissible: false,
                                                  smID: smId,
                                                  routeCase: 1,
                                                  conFirmOnTap: () async {
                                                    if(Get.isSnackbarOpen){
                                                      Get.back();
                                                    } else{
                                                      await  controller.blockCreateExitChat(
                                                          peIdx: userIdx, smMid: smId, name: nickName);
                                                    }
                                                  }, nickName: nickName
                                              );
                                            } else{
                                              controller.commonWidgets.customBlockDialog(
                                                  routerContext: routrerContext,
                                                  smID: smId,
                                                  routeCase: 3,
                                                  barrierDismissible: false,
                                                  conFirmOnTap: () async {
                                                    if(Get.isSnackbarOpen){
                                                      Get.back();
                                                    } else{
                                                      await  controller.blockCreateExitChat(
                                                          peIdx: userIdx, smMid: smId, name: nickName);
                                                    }
                                                  }, nickName: nickName
                                              );
                                            }

                                          } else{
                                            if(estList.isNotEmpty)
                                            {
                                              estList
                                                  .where((p0) => p0.deSmMId == smId && p0.dStatus =='ACCEPT' ).isNotEmpty ?
                                              controller.commonWidgets.customBlockDialog(
                                                  routerContext: routrerContext,
                                                  smID: smId,
                                                  routeCase: 2,
                                                  barrierDismissible: false,
                                                  conFirmOnTap: () async {
                                                    await controller.blockCreate(
                                                        peIdx: userIdx, smMid: smId, name: nickName
                                                    );
                                                  }, nickName: nickName)
                                                  :  controller.commonWidgets.customBlockDialog(
                                                  routerContext: routrerContext,
                                                  smID: smId,
                                                  routeCase: 0,
                                                  barrierDismissible: false,
                                                  conFirmOnTap: () async {
                                                    if(Get.isSnackbarOpen){
                                                      Get.back();
                                                    } else{
                                                      await controller.blockCreate(
                                                          peIdx: userIdx, smMid: smId, name: nickName);
                                                    }
                                                  }, nickName: nickName);


                                            } else{
                                              controller.commonWidgets.customBlockDialog(
                                                  routerContext: routrerContext,
                                                  smID: smId,
                                                  routeCase: 0,
                                                  barrierDismissible: false,
                                                  conFirmOnTap: () async {
                                                    if(Get.isSnackbarOpen){
                                                      Get.back();
                                                    } else{
                                                      await controller.blockCreate(
                                                          peIdx: userIdx, smMid: smId, name: nickName);
                                                    }
                                                  }, nickName: nickName);
                                            }

                                          }

                                        }
                                      }
                                    },
                                    border: Border(
                                        bottom: BorderSide(
                                            width: WidgetSize(context).sizedBox1,
                                            color: Style.greyDDDDDD)
                                    ),
                                    height: WidgetSize(context).height60px,
                                    widget: Center(
                                        child: Text(
                                          index == 0 ? '신고하기' : '차단하기',
                                          style: TextStyle(
                                              color: Style.blackWrite,
                                              fontWeight: FontWeight.w400,
                                              fontSize: WidgetSize(context).sizedBox14),
                                        )
                                    )
                                )
                        ),
                      )
                          : SizedBox();
                    },
                  ),
                ),
              ),
            );
          });
    }
  }


}