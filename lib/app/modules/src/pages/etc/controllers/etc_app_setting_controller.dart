import 'package:banana_deal_by_monkeycompany/config/datetime_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../../components/common_dialog/common_widgets_2.dart';
import '../../../../../components/common_widgets.dart';
import '../../../../../components/future_loading_overlay.dart';
import '../../../../../models/auth_basic_api.dart';
import '../../../../../repository/etc/etc_etc_repository.dart';
import '../../../../../repository/src/src_info_repository.dart';
import '../../../src_components/controllers/src_info_controller.dart';

class EtcAppSettingController extends GetxController {

  final EtcEtcRepository _etcEtcRepository;
  final SrcInfoRepository _srcInfoRepository;
  final CommonWidgets _commonWidgets;
  final CommonWidgets2 _commonWidgets2;

  EtcAppSettingController({
    required EtcEtcRepository etcEtcRepository,
    required SrcInfoRepository srcInfoRepository,
    required CommonWidgets commonWidgets,
    required CommonWidgets2 commonWidgets2
  }) :  _etcEtcRepository = etcEtcRepository,
        _srcInfoRepository = srcInfoRepository,
       _commonWidgets = commonWidgets,
        _commonWidgets2 = commonWidgets2;

  final String spTitle = "'바나나딜'에서 알림을 보내고자 합니다.";
  final String spContent = '해당 기기로 중요 공지, 딜, 채팅 등 서비스 이용에 필요한 안내 사항을 보내드립니다.\n※ 미동의 시 필요한 정보를 받을 수 없습니다.\n\n앱 푸시에 수신 동의하시겠습니까?';
  final String mpTitle = "'바나나딜'에서 광고성 정보 \n알림을 보내고자 합니다.";
  final String mpContent = '해당 기기로 이벤트, 할인 혜택 등 안내 드립니다.\n※ 미동의 시 필요한 정보를 받을 수 없습니다.\n\n앱 푸시에 수신 동의하시겠습니까?';

  RxBool banner = false.obs;
  RxBool dealPush = false.obs;
  RxBool addPush = false.obs;
  RxBool chatPush = false.obs;
  RxBool mpPush = false.obs;
  RxString mpDate = ''.obs;
  RxBool spPush = false.obs;

  RxInt check = 0.obs;

  void openDialog({
    required BuildContext context,
    required String mainText,
    required String confirmText,
    required GestureTapCallback conFirmOnTap
  }) {
    _commonWidgets.customDialog(
        routerContext: context,
        barrierDismissible: true, mainText: mainText,
        cancleText: '취소', confirmText: confirmText, conFirmOnTap: conFirmOnTap);
  }

  void openDialogConfirm({
    required BuildContext routerContext,
    required String title,
    required String content,
    String? date,
    String? result,
    required bool isBox,
    required bool isOneButton,
    required GestureTapCallback confirm,
    GestureTapCallback? refuse,
  }) {
    _commonWidgets2.basicNotiDialog(
        routerContext: routerContext,
        title: title,
        content: content,
        date: date ?? '',
        result: result ?? '',
        isBox: isBox,
        confirm: confirm,
        isOneButton: isOneButton,
        refuse: refuse ?? (){Get.back();}
    );
  }

  String formatDate() {
    String allTime = DateFormat("yyyy년 MM월 dd일").format(DateTimeConfig().now);
    return allTime;
  }

  bool toggleSystemPush(BuildContext context) {
    spPush.value = !spPush.value;
    if(spPush.value){
      dealPush.value = true;
      addPush.value = true;
      chatPush.value = true;
    }
    else{
      dealPush.value = false;
      addPush.value = false;
      chatPush.value = false;
    }
    switch(spPush.value){
      case false:
        pushMessageSystem();
      case true:
        pushMessageSystem();
    }

    return spPush.value;
  }


  bool toggleAdPush(BuildContext context) {
    switch(mpPush.value){
      case false:
        pushMessageAd();
        _alertResult(context: context, isConfirm: true);
      case true:
        pushMessageAd();
        _alertResult(context: context, isConfirm: false);
    }
    return mpPush.value;
  }

  void _alertResult({
    required BuildContext context,
    required bool isConfirm
    }){
    openDialogConfirm(
        isOneButton: true,
        routerContext: context,
        title: '광고성 정보 수신 처리 결과',
        date: mpDate.value,
        result: '',
        content: isConfirm ? '수신동의 처리 완료' : '수신거부 처리 완료',
        isBox: true,
        confirm: (){}
    );
  }

  void checkSp(){
    if(!dealPush.value && !addPush.value && !chatPush.value){
      spPush.value = true;
      update();
      pushMessageSystem();
    }
  }

  bool toggleDealPush(BuildContext context) {
    switch(dealPush.value){
      case false:
        pushMessage(
            deal: !dealPush.value
                ? 'Y'
                :  'N'
        );
      case true:
        pushMessage(
            deal: !dealPush.value
                ? 'Y'
                :  'N'
        );
    }

    return dealPush.value;
  }

  bool toggleChatPush(BuildContext context) {
    switch(chatPush.value){
      case false:
        pushMessage(
            chat: !chatPush.value
                ? 'Y'
                :  'N'
        );
      case true:
        pushMessage(
            chat: !chatPush.value
                ? 'Y'
                :  'N'
        );
    }

    return chatPush.value;
  }

  bool toggleAddPush(BuildContext context) {
    switch(addPush.value){
      case false:
        pushMessage(
            add: !addPush.value
                ? 'Y'
                :  'N'
        );
      case true:
        pushMessage(
            add: !addPush.value
                ? 'Y'
                :  'N'
        );
    }

    return addPush.value;
  }


  void pushMessageSystem() async{
    if(Get.isSnackbarOpen){
      Get.back();
    } else{
      final String push = !spPush.value ? 'Y': 'N';
      AuthBagicApi api = await _etcEtcRepository.getPushStatus(
          appPush: dealPush.value ? 'Y': 'N',
          gwanggoPush: addPush.value ? 'Y': 'N',
          chatPush: chatPush.value ? 'Y': 'N',
          mpPush: SrcInfoController.to.infoM.value.mMpPush,
          mPeditDate: SrcInfoController.to.infoM.value.mEditDateMp,
      );
      if(api.status == 200)
      {
        await initStatus();
      }
    }
  }


  void pushMessageAd() async{
    if(Get.isSnackbarOpen){
      Get.back();
    } else{
      final String push = !mpPush.value ? 'Y': 'N';
      final String date = formatDate();
      AuthBagicApi api = await _etcEtcRepository.getPushStatus(
        appPush: SrcInfoController.to.infoM.value.mAppPush,
        gwanggoPush: SrcInfoController.to.infoM.value.mGwanggoPush,
        chatPush: SrcInfoController.to.infoM.value.mChatPush,
        mpPush: push,
        mPeditDate: date,
      );
      if(api.status == 200)
      {
        await initStatus();
      }
    }
  }

  void pushMessage(
  {
    String? deal,
    String? add,
    String? chat,
  }) async{
    if(Get.isSnackbarOpen){
      Get.back();
    }else{
      AuthBagicApi api = await _etcEtcRepository.getPushStatus(
          appPush: deal ?? SrcInfoController.to.infoM.value.mAppPush,
          gwanggoPush: add ?? SrcInfoController.to.infoM.value.mGwanggoPush,
          chatPush: chat ?? SrcInfoController.to.infoM.value.mChatPush,
          mpPush: SrcInfoController.to.infoM.value.mMpPush,
          mPeditDate: SrcInfoController.to.infoM.value.mEditDateMp,
      );
      if(api.status == 200)
      {
        await initStatus();
        checkSp();
      }
    }
  }
  //
  // Future<void> pushMessage3() async{
  //   if(Get.isSnackbarOpen == true){
  //     Get.back();
  //   } else{
  //     AuthBagicApi api = await _etcEtcRepository.getPushStatus(appPush: SrcInfoController.to.infoM.value.mAppPush,
  //         gwanggoPush: SrcInfoController.to.infoM.value.mGwanggoPush, chatPush: chatPush.value == false ? 'Y':  'N');
  //     if(api.status == 200)
  //     {
  //       await initStatus();
  //       Get.back();
  //     }
  //   }
  // }

  Future<void> initStatus() async{

    var info = await _srcInfoRepository.getUserInfo();
    if(info.status == 200)
    {
      SrcInfoController.to.infoM.value = info.result[0];
      update();
    }
    check.value++;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    dealPush.value = SrcInfoController.to.infoM.value.mAppPush == 'Y' ? true : false;
    addPush.value = SrcInfoController.to.infoM.value.mGwanggoPush == 'Y' ? true : false;
    chatPush.value = SrcInfoController.to.infoM.value.mChatPush == 'Y' ? true : false;
    mpPush.value = SrcInfoController.to.infoM.value.mMpPush == 'Y' ? true : false;
    mpDate.value = SrcInfoController.to.infoM.value.mEditDateMp;
    spPush.value = dealPush.value &&  addPush.value && chatPush.value;
    update();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    ever(check, (_) {
      dealPush.value = SrcInfoController.to.infoM.value.mAppPush == 'Y' ? true : false;
      addPush.value = SrcInfoController.to.infoM.value.mGwanggoPush == 'Y' ? true : false;
      chatPush.value = SrcInfoController.to.infoM.value.mChatPush == 'Y' ? true : false;
      mpPush.value = SrcInfoController.to.infoM.value.mMpPush == 'Y' ? true : false;
      mpDate.value = SrcInfoController.to.infoM.value.mEditDateMp;
      spPush.value = dealPush.value &&  addPush.value && chatPush.value;
      update();
    });
  }


}