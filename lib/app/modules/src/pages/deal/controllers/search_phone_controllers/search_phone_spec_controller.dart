import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/controllers/search_phone_controllers/search_phone_detail_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/views/pages/search_phone/components/common/dialog/search_dialog.dart';
import 'package:banana_deal_by_monkeycompany/app/repository/deal/phone_spec_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../managers/device_manager.dart';
import '../../../../../../models/deal/model_list_mobile_maker.dart';
import '../../../../../../models/deal/model_list_phone_spec.dart';
import '../../components/post_deal/moduels/make_deal/controllers/make_deal_controller.dart';
import '../../views/pages/search_phone/search_phone_detail.dart';

class SearchPhoneSpecController extends GetxController{

  final PhoneSpecRepository _phoneSpecRepository;

  SearchPhoneSpecController({
    required PhoneSpecRepository phoneSpecRepository
  }) : _phoneSpecRepository = phoneSpecRepository;

  late final ScrollController firstController;
  //제조사

  RxList<ModeListMobileMakerList> makerList = <ModeListMobileMakerList>[].obs;

  Future<List<ModeListMobileMakerList>> getMaker() async{
    ModeListMobileMaker data = await _phoneSpecRepository.getMakerList();
    makerList.value = data.list;
    update();
    return data.list;
  }


  List arraySort = ['기본순', '최신순', '이름순 ↓', '이름순 ↑'];
  late TextEditingController searchPhoneC;
  RxString searchPhoneText = ''.obs;

  //case1//
  //case1_var

  RxInt currentIndex = 0.obs;
  RxInt currentSort = 0.obs;
  Rx<ModelListPhoneSpec> datasSam = ModelListPhoneSpec(list: []).obs;
  Rx<ModelListPhoneSpec> datasApple = ModelListPhoneSpec(list: []).obs;
  Rx<ModelListPhoneSpec> datasEtc = ModelListPhoneSpec(list: []).obs;
  Rx<ModelListPhoneSpec> currentDatas = ModelListPhoneSpec(list: []).obs;
  Rx<ModelListPhoneSpec> showDatas = ModelListPhoneSpec(list: []).obs;

  void onTapCompany(int index){
    currentIndex.value = index;
    switchSort(searchPhoneText.value);
    firstController.jumpTo(0.0);
    update();
  }


  RegExp plusRegExp(text){
    RegExp regex = RegExp(text, caseSensitive: false);
    return regex;
  }

  GestureTapCallback basicOnTap(){
    return (){
      currentSort.value = 0;
      update();
      switchSort(searchPhoneText.value);
    };
  }


  GestureTapCallback latestOnTap(){
    return (){
      currentSort.value = 1;
      update();
      switchSort(searchPhoneText.value);
    };
  }

  GestureTapCallback nameOnTap(){
    return (){
      currentSort.value == 2 ? currentSort.value = 3 : currentSort.value = 2;
      update();
      switchSort(searchPhoneText.value);
    };
  }


  void searchButtonIcon(){
    searchPhoneText.value = searchPhoneC.text;
    switchSort(searchPhoneText.value);
    update();
  }

  ValueChanged<String>? searchButton(String valAddr){
    searchPhoneText.value = valAddr;
    if(valAddr == ''){
      switchSort(valAddr);
      update();
    } else {
      switchSort(valAddr);
      update();
    }
    return null;

  }

  //case1_fuc_search
  ValueChanged<String>? inputPhone(valAddr) {
    searchPhoneText.value = valAddr;
    switchSort(valAddr);
    update();
    return null;
  }


  void currentMaker(){
    currentDatas.value = ModelListPhoneSpec(list: []);
    switch(currentIndex.value){
      case 0:
         currentDatas.value = datasSam.value;
      case 1:
        currentDatas.value = datasApple.value;
      case 2:
        currentDatas.value = datasEtc.value;
    }
    update();
  }



  //case1_button_func_sort
  switchSort(String text){
    switch(currentSort.value){
      case 0:
        return basicSort(text);
      case 1:
        return recentSort(text);
      case 2:
        return nameSort1(text);
      case 3:
        return nameSort2(text);
    }
    update();
  }





  //기본순
  Future<void> basicSort(String text) async{
    currentMaker();
    if(currentDatas.value.list.isEmpty){
      await getSpec();
      if(text == '') {
        showDatas.value.list.clear();
        showDatas.value.list.addAll(
            currentDatas.value.list
        );
        showDatas.value.list.toSet().toList();
        update();
      }else {
        RegExp regex = plusRegExp(text);
        showDatas.value.list.clear();
        showDatas.value.list.addAll(currentDatas.value.list.where((element) => regex.hasMatch(element.psName)));
        showDatas.value.list.toSet().toList();
        update();
      }
    }
    else{
      if(text == '') {
        showDatas.value.list.clear();
        showDatas.value.list.addAll(
            currentDatas.value.list
        );
        showDatas.value.list.toSet().toList();
        update();
      }else {
        RegExp regex = plusRegExp(text);
        showDatas.value.list.clear();
        showDatas.value.list.addAll(currentDatas.value.list.where((element) => regex.hasMatch(element.psName)));
        showDatas.value.list.toSet().toList();
        update();
      }
    }
  }

  Future<void> recentSort(String text) async{
    currentMaker();
    if(currentDatas.value.list.isEmpty){
      await getSpec();
      if(text == '') {
        showDatas.value.list.clear();
        showDatas.value.list.addAll(
            currentDatas.value.list
        );
        showDatas.value.list.sort((a, b) =>
            b.psReleaseDate.compareTo(a.psReleaseDate));
        showDatas.value.list.toSet().toList();
        update();
      }else {
        RegExp regex = plusRegExp(text);
        showDatas.value.list.clear();
        showDatas.value.list.addAll(currentDatas.value.list.where((element) => regex.hasMatch(element.psName)));
        showDatas.value.list.sort((a, b) =>
            b.psReleaseDate.compareTo(a.psReleaseDate)
        );
        showDatas.value.list.toSet().toList();
        update();
      }
    }
    else{
      if(text == '') {
        showDatas.value.list.clear();
        showDatas.value.list.addAll(
            currentDatas.value.list
        );
        showDatas.value.list.sort((a, b) =>
            b.psReleaseDate.compareTo(a.psReleaseDate));
        showDatas.value.list.toSet().toList();
        update();
      }else {
        RegExp regex = plusRegExp(text);
        showDatas.value.list.clear();
        showDatas.value.list.addAll(currentDatas.value.list.where((element) => regex.hasMatch(element.psName)));
        showDatas.value.list.sort((a, b) =>
            b.psReleaseDate.compareTo(a.psReleaseDate)
        );
        showDatas.value.list.toSet().toList();
        update();
      }
    }
  }

  //이름순
  Future<void> nameSort1(String text) async{
    currentMaker();
    if(currentDatas.value.list.isEmpty){
      await getSpec();
      if(text == '') {
        showDatas.value.list.clear();
        showDatas.value.list.addAll(
            currentDatas.value.list
        );
        showDatas.value.list.sort((a, b) =>
            a.psName.compareTo(b.psName) );
        showDatas.value.list.toSet().toList();
        update();
      }else {
        RegExp regex = plusRegExp(text);
        showDatas.value.list.clear();
        showDatas.value.list.addAll(currentDatas.value.list.where((element) => regex.hasMatch(element.psName)));
        showDatas.value.list.sort((a, b) =>
            a.psName.compareTo(b.psName) );
        showDatas.value.list.toSet().toList();
        update();
      }
    }
    else{
      if(text == '') {
        showDatas.value.list.clear();
        showDatas.value.list.addAll(
            currentDatas.value.list
        );
        showDatas.value.list.sort((a, b) =>
            a.psName.compareTo(b.psName) );
        showDatas.value.list.toSet().toList();
        update();
      }else {
        RegExp regex = plusRegExp(text);
        showDatas.value.list.clear();
        showDatas.value.list.addAll(currentDatas.value.list.where((element) => regex.hasMatch(element.psName)));
        showDatas.value.list.sort((a, b) =>
            a.psName.compareTo(b.psName) );
        showDatas.value.list.toSet().toList();
        update();
      }
    }
  }

  //이름순
  Future<void> nameSort2(String text) async{
    currentMaker();
    if(currentDatas.value.list.isEmpty){
      await getSpec();
      if(text == '') {
        showDatas.value.list.clear();
        showDatas.value.list.addAll(
            currentDatas.value.list
        );
        showDatas.value.list.sort((a, b) =>
            b.psName.compareTo(a.psName) );
        showDatas.value.list.toSet().toList();
        update();
      }else {
        RegExp regex = plusRegExp(text);
        showDatas.value.list.clear();
        showDatas.value.list.addAll(currentDatas.value.list.where((element) => regex.hasMatch(element.psName)));
        showDatas.value.list.sort((a, b) =>
            b.psName.compareTo(a.psName) );
        showDatas.value.list.toSet().toList();
        update();
      }
    }
    else{
      if(text == '') {
        showDatas.value.list.clear();
        showDatas.value.list.addAll(
            currentDatas.value.list
        );
        showDatas.value.list.sort((a, b) =>
            b.psName.compareTo(a.psName) );
        showDatas.value.list.toSet().toList();
        update();
      }else {
        RegExp regex = plusRegExp(text);
        showDatas.value.list.clear();
        showDatas.value.list.addAll(currentDatas.value.list.where((element) => regex.hasMatch(element.psName)));
        showDatas.value.list.sort((a, b) =>
            b.psName.compareTo(a.psName) );
        showDatas.value.list.toSet().toList();
        update();
      }
    }
  }






  //case1//
  //데이터 받기 - default 설정 삼성 => 기본순
  Future<ModelListPhoneSpec> getFirstSpec() async {
    var data = await _phoneSpecRepository.getModelListPhoneSpec(1);
    datasSam.value = data;
    currentMaker();
    showDatas.value.list.clear();
    showDatas.value.list.addAll(data.list);
    showDatas.value.list.toSet().toList();
    update();
    return data;
  }

  Future<void> getSpec() async {
    var data = await _phoneSpecRepository.getModelListPhoneSpec(makerList[currentIndex.value].mkIdx);
    switch(currentIndex.value){
      case 0:
        datasSam.value = data;
      case 1:
        datasApple.value = data;
      case 2:
        datasEtc.value = data;
    }
    update();
    currentMaker();
  }


  void moveToDetail(int index) async{
    await DeviceManager.overLayClients();
    Get.to(
            () => SearchPhoneDetail(
          psIdex: int.parse(showDatas.value.list[index].psIdx),
          psName: showDatas.value.list[index].psName,
        ), binding: BindingsBuilder(() {
      Get.put(SearchPhoneDetailController());
    })
    );
  }


  void dialogClick(int index){
    MakeDealController.to.joinerPhone.value = showDatas
        .value
        .list[index]
        .psName;
    MakeDealController.to.joinerPhoneIdx.value = showDatas.value.list[index].psIdx;
    MakeDealController.to.joinerPhoneModel.value = showDatas.value.list[index].psModel;
    MakeDealController.to.joinerPhoneImg.value = showDatas.value.list[index].piPath;
  }

  void openDialogPhoneData({
    required BuildContext routerContext,
    required int index
}){
    SearchDialog().openNewbieDialog(
      routerContext: routerContext,
      index: index
    );
  }

  void _controllerClose(){
    firstController.dispose();
    searchPhoneC.dispose();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    firstController = ScrollController();
    searchPhoneC = TextEditingController();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    _controllerClose();
    super.onClose();
  }

}