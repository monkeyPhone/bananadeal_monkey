import 'dart:async';
import 'package:banana_deal_by_monkeycompany/app/components/common_widgets.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../models/auth_basic_api.dart';

import '../../../../../models/etc/user_block.dart';
import '../../../../../repository/etc/bookmark_repository.dart';

import '../../../src_components/controllers/src_info_controller.dart';


class EtcBlockSettingController extends GetxController with GetSingleTickerProviderStateMixin{
  static EtcBlockSettingController get to => Get.find();

  final BookmarkRepository _bookmarkRepository;
  final CommonWidgets commonWidgets;

  EtcBlockSettingController({
    required BookmarkRepository bookmarkRepository,
    required this.commonWidgets,
  }) : _bookmarkRepository = bookmarkRepository;

  //tap controller
  late ScrollController scrollController1;
  late ScrollController scrollController2;
  late TextEditingController textEditingController;

  late TabController tabController;

  RxInt currentTap = 0.obs;

  void tabselect() {
    currentTap.value = tabController.index;
    update();
  }


  //widget controller


  RxBool no = false.obs;
  RxBool write = false.obs;

  Rx<UserBlock> userBlock = UserBlock(status: 0, msg: '', result: []).obs;
  RxList<UserBlockList> storeList = <UserBlockList>[].obs;
  RxList<UserBlockList> userList = <UserBlockList>[].obs;

  Future<UserBlock> getBlockList() async{
    UserBlock datas = await _bookmarkRepository.getUserBlockList(SrcInfoController.to.infoM.value.mIdx);
    if(datas.result.isEmpty)
    {
      no.value = true;
      update();
      return userBlock.value = datas;
    }
    else{
      no.value = false;
      storeList.clear();
      userList.clear();
      storeList.addAll(datas.result.where((element) => element.smStoreName != ''));
      userList.addAll(datas.result.where((element) => element.mName != ''));
      update();
      return userBlock.value = datas;
    }
  }

  Future<AuthBagicApi> blockClear(int buIdx) async{
    AuthBagicApi api = await _bookmarkRepository.userBlockDelete(buIdx);
    if(api.status == 200){
      write.value = true;
      update();
      Get.back();
    }
    return api;
  }

  void _controllerClose(){
    tabController.dispose();
    scrollController1.dispose();
    scrollController2.dispose();
    textEditingController.dispose();
  }


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    scrollController1 = ScrollController();
    scrollController2 = ScrollController();
    textEditingController = TextEditingController();
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(tabselect);
  }


  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    debounce(write, (_) =>
       write.value
           ?
       Timer(Duration(milliseconds: 500), () async{
         UserBlock api = await getBlockList();
         if(api.status == 200){
           write.value = false;
           update();
         }
       })
           : null
    );
  }

  @override
  void onClose() {
    // TODO: implement onClose
    _controllerClose();
    super.onClose();
  }


}