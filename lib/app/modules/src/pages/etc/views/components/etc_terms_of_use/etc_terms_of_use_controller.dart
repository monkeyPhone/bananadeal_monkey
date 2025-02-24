import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../models/etc/terms.dart';
import '../../../../../../../repository/etc/etc_etc_repository.dart';

class EtcTermsOfUseController extends GetxController with GetSingleTickerProviderStateMixin{

  final EtcEtcRepository _etcEtcRepository;

  EtcTermsOfUseController({
    required EtcEtcRepository etcEtcRepository
  }) : _etcEtcRepository = etcEtcRepository;

  late TabController tabController;
  late ScrollController scrollController;

  RxInt currentTap = 0.obs;

  Rx<Terms> terms = Terms(status: 0, msg: '', result: []).obs;

  RxBool loadings = false.obs;

  RxString termsText = ''.obs;

  void tabselect() {
    currentTap.value = tabController.index;
    scrollController.jumpTo(0);
    update();
  }

  Future<Terms> getTermsofUse() async{
    Terms api = await _etcEtcRepository.getTerms();

    if(api.status == 200)
      {
        termsText.value = api.result.first.tService;
        update();
        return  terms.value = api;
      }
    else{
      update();
      return  terms.value = Terms(status: 0, msg: '', result: []);
    }
  }

  void _controllerClose(){

  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    scrollController = ScrollController();
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(tabselect);

  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    ever(currentTap, (_){
      loadings.value = true;
      termsText.value = '';
      update();
      Timer(Duration(milliseconds: 400), (){
        termsText.value =
        currentTap.value == 0
            ? terms.value.result.first.tService
            : currentTap == 1
            ? terms.value.result.first.tPrivacy
            : terms.value.result.first.tLocation;
        loadings.value = false;
        update();
      });

    });

  }

  @override
  void onClose() {
    tabController.dispose();
    scrollController.dispose();
    super.onClose();
  }

}