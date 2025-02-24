import 'package:banana_deal_by_monkeycompany/app/components/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../models/etc/etc_event.dart';
import '../../../../../../../repository/etc/etc_event_repository.dart';
import '../../../../../src_components/controllers/src_info_controller.dart';
import 'etc_event_detail/etc_event_detail_view.dart';
import 'etc_event_detail/etc_evnet_detail_controller.dart';


class EtcEventController extends GetxController with GetSingleTickerProviderStateMixin{

  final EtcEventRepository _etcEventRepository;
  final CommonWidgets _commonWidgets;

  EtcEventController({
    required EtcEventRepository etcEventRepository,
    required CommonWidgets commonWidgets
  }) : _etcEventRepository = etcEventRepository,
       _commonWidgets = commonWidgets;

  late TabController tabController;
  late ScrollController scrollController;

  RxInt currentTap = 0.obs;

  Rx<EtcEvent> events = EtcEvent(status: 0, msg: '', result: []).obs;
  RxList<EtcEventList> currentEvent = <EtcEventList>[].obs;
  RxList<EtcEventList> endEvent = <EtcEventList>[].obs;

  void tabselect() {
    currentTap.value = tabController.index;
    update();
  }

  Future<EtcEvent> getEvent() async{
    EtcEvent api = await _etcEventRepository.getUserEtcEvent(mIdx: SrcInfoController.to.infoM.value.mIdx);

    if(api.status == 200)
      {
        currentEvent.clear();
        endEvent.clear();
        currentEvent.addAll(api.result.where((element) => element.beStatus == '진행중'));
        currentEvent.sort((a, b) => b.beIdx.compareTo(a.beIdx));
        endEvent.addAll(api.result.where((element) => element.beStatus == '종료'));
        endEvent.sort((a, b) => b.beIdx.compareTo(a.beIdx));
        update();
        return  events.value = api;
      }
    else{
      update();
      return  events.value = api;
    }
  }


  void clickImage({required int eventIdx, required String email}){
    Get.to(
            () => EtcEventDetailView(
              eventIdx: eventIdx,
              email: email,
            ), binding:
    BindingsBuilder(() {
      Get.put(EtcEventDetailController(
          etcEventRepository: _etcEventRepository,
          commonWidgets: _commonWidgets
      ));
    })
    );
  }

  void _controllerClose(){
    tabController.dispose();
    scrollController.dispose();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    scrollController = ScrollController();
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(tabselect);
  }

  @override
  void onClose() {
    _controllerClose();
    super.onClose();
  }

}