import 'dart:convert';

import 'package:banana_deal_by_monkeycompany/app/modules/src/src_components/controllers/src_info_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../../../../components/common_widgets.dart';
import '../../../../../../../../models/auth_basic_api.dart';
import '../../../../../../../../models/etc/etc_event_detail.dart';
import '../../../../../../../../repository/etc/etc_event_repository.dart';
import '../../../../../../../../routes/api_url.dart';
import '../../../../../../../../routes/const_element.dart';


class EtcEventDetailController extends GetxController{

  final EtcEventRepository _etcEventRepository;
  final CommonWidgets _commonWidgets;

  EtcEventDetailController({
    required EtcEventRepository etcEventRepository,
    required CommonWidgets commonWidgets
  }) : _etcEventRepository = etcEventRepository,
       _commonWidgets = commonWidgets;

  late ScrollController scrollController;

  RxBool openButton = false.obs;

  Rx<EtcEventDetailResult> eventDetail = EtcEventDetailResult(
      bepIsPrize: null,
      beStatus: '',
      beType: '', beTitle: '', beContent: '', beUrl: '', beNotice: '', bePathImg2: '', bePathImg3: '', beResult: '').obs;
  RxList image = [].obs;

  Future<EtcEventDetailResult> getEventDetail({required int eventIdx, required String email}) async{
    EtcEventDetail api = await _etcEventRepository.getUserEtcEventDetail(eventIdx: eventIdx, email: email);

    if(api.status == 200 && api.result.isNotEmpty)
    {
      pageChange.value = 0;
      update();
      return  eventDetail.value = api.result.first;
    }
    else{
      Get.back();
      _commonWidgets.customSnackbar('잘못된 접근입니다.');
      update();
      return  eventDetail.value = EtcEventDetailResult(
          bepIsPrize: null,
          beStatus: '',
          beType: '', beTitle: '', beContent: '', beUrl: '', beNotice: '', bePathImg2: '', bePathImg3: '', beResult: '');
    }
  }


  RxInt pageChange = 0.obs;

  Future<void> launchInBrowser(String url) async {
    try{
      final Uri launchUri = Uri.parse(url);
      await launchUrl(launchUri, mode: LaunchMode.externalApplication);
    }catch(e){

      _commonWidgets.customSnackbar(AppElement.pageMoveFail);
    }
  }


  Future<void> postEventJoin(int beIdx, ) async{
    AuthBagicApi api = await _etcEventRepository.postEventJoin(beIdx: beIdx,
        name: SrcInfoController.to.infoM.value.mName, email: SrcInfoController.to.infoM.value.mEmail,
      mIdx: SrcInfoController.to.infoM.value.mIdx
    );

    if(api.status == 200){
      pageChange.value = 20;
      update();
    }else{

    }

  }

  Future<void> shareEvent(int idx) async{
    String message = "EVENT/$idx";
    String encode = base64.encode(utf8.encode(message));
    String url = '${ApiConsole.shareMode}/$encode';
    await Share.share("바나나딜에서 진행중인 이벤트에요! 바나나딜 앱에서 확인해보세요.\n$url");

  }

  void _controllerClose(){
    scrollController.dispose();
  }


  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
    scrollController = ScrollController();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    debounce(pageChange, (_) {
      if(pageChange.value == 20){
        pageChange.value = 0;
      }
    });
  }

  @override
  void onClose() {
    // TODO: implement onClose
    _controllerClose();
    super.onClose();
  }

}