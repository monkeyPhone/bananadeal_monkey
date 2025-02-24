import 'package:banana_deal_by_monkeycompany/app/components/common_widgets.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/controllers/search_phone_controllers/search_phone_detail_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/views/pages/search_phone/components/common/dialog/search_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../managers/device_manager.dart';
import '../../../../../../models/deal/model_list_mobile.dart';
import '../../../../../../models/deal/model_list_mobile_maker.dart';
import '../../../../../../repository/deal/phone_spec_repository.dart';
import '../../components/post_deal/moduels/make_deal/controllers/make_deal_controller.dart';
import '../../views/pages/search_phone/search_phone_detail.dart';

class SearchPhoneTelecomController extends GetxController{

  final PhoneSpecRepository _phoneSpecRepository;
  final CommonWidgets _commonWidgets;

  SearchPhoneTelecomController({
    required PhoneSpecRepository phoneSpecRepository,
    required CommonWidgets commonWidgets,
  }) : _phoneSpecRepository = phoneSpecRepository,
       _commonWidgets = commonWidgets;

  late final ScrollController firstController;

  //제조사

  RxList<ModeListMobileMakerList> makerList = <ModeListMobileMakerList>[].obs;

  Future<List<ModeListMobileMakerList>> getgMaker() async{
    ModeListMobileMaker data = await _phoneSpecRepository.getMakerList();
    makerList.value = data.list;
    update();
    return data.list;

  }

  List arraySort = ['기본순', '출고가순 ↓', '출고가순 ↑', '최신순', '이름순 ↓', '이름순 ↑'];
  late TextEditingController searchPhoneC;
  RxString searchPhoneText = ''.obs;

  //case1//
  //case1_var

  RxInt currentIndex = 0.obs;
  RxInt currentSort = 0.obs;
  Rx<ModelListMobile> datas = ModelListMobile(list: []).obs;
  Rx<ModelListMobile> phoneDatas = ModelListMobile(list: []).obs;


  GestureTapCallback basicOnTap(){
    return (){
      currentSort.value = 0;
      update();
      switchSort(searchPhoneText.value);
    };
  }

  GestureTapCallback saleOnTap(){
    return (){
      currentSort.value == 1 ? currentSort.value = 2 : currentSort.value = 1;
      update();
      switchSort(searchPhoneText.value);
    };
  }

  GestureTapCallback recentOnTap(){
    return (){
      currentSort.value = 3;
      update();
      switchSort(searchPhoneText.value);
    };
  }

  GestureTapCallback nameOnTap(){
    return (){
      currentSort.value == 4 ? currentSort.value = 5 : currentSort.value = 4;
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

  //case1_button_func
  void onTapCompany(int index){
    currentIndex.value = index;
    switchSort(searchPhoneText.value);
    firstController.jumpTo(0.0);
    update();
  }

  //case1_button_func


  //case1_button_func_sort
  switchSort(String text){
    switch(currentSort.value){
      case 0:
        return basicSort(text);
      case 1:
        return priceSort(text);
      case 2:
        return priceSort2(text);
      case 3:
        return latestSort(text);
      case 4:
        return namingSort(text);
      case 5:
        return namingSort2(text);
    }
    update();
  }

  //기본순
  void basicSort(String text){
    if(text == '') {
      phoneDatas.value.list.clear();
      phoneDatas.value.list.addAll(datas.value.list.where((element) =>
          element.mkName == makerList[currentIndex.value].mkName
      ));
      phoneDatas.value.list.sort((a, b) =>
          int.parse(b.psOrder).compareTo(int.parse(a.psOrder)));
      phoneDatas.value.list.toSet().toList();
      update();
    }else {
      RegExp regex = plusRegExp(text);
      phoneDatas.value.list.clear();
      phoneDatas.value.list.addAll(datas.value.list.where(
              (element) => element.mkName == makerList[currentIndex.value].mkName
      ).where((element) => regex.hasMatch(element.psName)));
      phoneDatas.value.list.sort((a, b) =>
          int.parse(b.psOrder).compareTo(int.parse(a.psOrder)));
      phoneDatas.value.list.toSet().toList();
      update();
    }
  }

  //가격순
  void priceSort(String text){
    if(text == '')
    {
      phoneDatas.value.list.clear();
      phoneDatas.value.list.addAll(datas.value.list.where((element) =>
        element.mkName == makerList[currentIndex.value].mkName
      ));
      phoneDatas.value.list.sort((a,b) {
        if(int.parse(a.mdReleasePrice) == int.parse(b.mdReleasePrice)){
          return int.parse(b.psOrder).compareTo(int.parse(a.psOrder));
        }
        else{
          return int.parse(a.mdReleasePrice).compareTo(int.parse(b.mdReleasePrice));
        }
      });
      phoneDatas.value.list.toSet().toList();
      update();
    }
    else
    {
      RegExp regex = plusRegExp(text);
      phoneDatas.value.list.clear();
      phoneDatas.value.list.addAll(datas.value.list.where(
              (element) =>
              element.mkName == makerList[currentIndex.value].mkName
      )
          .where((element) => regex.hasMatch(element.psName)));
      phoneDatas.value.list.sort((a,b) {
        if(int.parse(a.mdReleasePrice) == int.parse(b.mdReleasePrice)){
          return int.parse(b.psOrder).compareTo(int.parse(a.psOrder));
        }
        else{
          return int.parse(a.mdReleasePrice).compareTo(int.parse(b.mdReleasePrice));
        }
      });
      phoneDatas.value.list.toSet().toList();
      update();
    }
  }

  void priceSort2(String text){
    if(text == '')
    {
      phoneDatas.value.list.clear();
      phoneDatas.value.list.addAll(datas.value.list.where((element) =>
        element.mkName == makerList[currentIndex.value].mkName
      ));
      phoneDatas.value.list.sort((a,b) {
        if(int.parse(a.mdReleasePrice) == int.parse(b.mdReleasePrice)){
          return int.parse(b.psOrder).compareTo(int.parse(a.psOrder));
        }
        else{
          return int.parse(b.mdReleasePrice).compareTo(int.parse(a.mdReleasePrice));
        }
      });
      phoneDatas.value.list.toSet().toList();
      update();
    }
    else
    {
      RegExp regex = plusRegExp(text);
      phoneDatas.value.list.clear();
      phoneDatas.value.list.addAll(datas.value.list.where((element) =>
        element.mkName == makerList[currentIndex.value].mkName
      ).where((element) => regex.hasMatch(element.psName)));
      phoneDatas.value.list.sort((a,b) {
        if(int.parse(a.mdReleasePrice) == int.parse(b.mdReleasePrice)){
          return int.parse(b.psOrder).compareTo(int.parse(a.psOrder));
        }
        else{
          return int.parse(b.mdReleasePrice).compareTo(int.parse(a.mdReleasePrice));
        }
      });
      phoneDatas.value.list.toSet().toList();
      update();
    }
  }

  //최신순
  void latestSort(String text){
    if(text == '')
    {
      phoneDatas.value.list.clear();
      phoneDatas.value.list.addAll(datas.value.list.where((element) =>
        element.mkName == makerList[currentIndex.value].mkName
      ));
      phoneDatas.value.list.sort((a,b) {
        if(a.mdReleaseDate == b.mdReleaseDate){
          return int.parse(b.psOrder).compareTo(int.parse(a.psOrder));
        }
        else{
          return b.mdReleaseDate.compareTo(a.mdReleaseDate);
        }
      });
      phoneDatas.value.list.toSet().toList();
      update();
    }
    else{
      RegExp regex = plusRegExp(text);
      phoneDatas.value.list.clear();
      phoneDatas.value.list.addAll(datas.value.list.where((element) =>
        element.mkName == makerList[currentIndex.value].mkName
      ).where((element) => regex.hasMatch(element.psName)));
      phoneDatas.value.list.sort((a,b) {
        if(a.mdReleaseDate == b.mdReleaseDate){
          return int.parse(b.psOrder).compareTo(int.parse(a.psOrder));
        }
        else{
          return b.mdReleaseDate.compareTo(a.mdReleaseDate);
        }
      });
      phoneDatas.value.list.toSet().toList();
      update();
    }
  }


  //이름순
  void namingSort(String text){
    if(text == '')
    {
      phoneDatas.value.list.clear();
      phoneDatas.value.list.addAll(datas.value.list.where((element) =>
        element.mkName == makerList[currentIndex.value].mkName
      ));
      phoneDatas.value.list.sort((a,b) {
        if(a.psName == b.psName){
          return int.parse(b.psOrder).compareTo(int.parse(a.psOrder));
        }
        else{
          return a.psName.compareTo(b.psName);
        }
      });
      phoneDatas.value.list.toSet().toList();
      update();
    }
    else{
      RegExp regex = plusRegExp(text);
      phoneDatas.value.list.clear();
      phoneDatas.value.list.addAll(datas.value.list.where((element) =>
        element.mkName == makerList[currentIndex.value].mkName
      ).where((element) => regex.hasMatch(element.psName)));
      phoneDatas.value.list.sort((a,b) {
        if(a.psName == b.psName){
          return int.parse(b.psOrder).compareTo(int.parse(a.psOrder));
        }
        else{
          return a.psName.compareTo(b.psName);
        }
      });
      phoneDatas.value.list.toSet().toList();
      update();
    }
  }

  void namingSort2(String text){
    if(text == '')
    {
      phoneDatas.value.list.clear();
      phoneDatas.value.list.addAll(datas.value.list.where((element) =>
        element.mkName == makerList[currentIndex.value].mkName
      ));
      phoneDatas.value.list.sort((a,b) {
        if(a.psName == b.psName){
          return int.parse(b.psOrder).compareTo(int.parse(a.psOrder));
        }
        else{
          return b.psName.compareTo(a.psName);
        }
      });
      phoneDatas.value.list.toSet().toList();
      update();
    }
    else{
      RegExp regex = plusRegExp(text);
      phoneDatas.value.list.clear();
      phoneDatas.value.list.addAll(
          datas.value.list.where((element) =>
          element.mkName == makerList[currentIndex.value].mkName
          ).where((element) => regex.hasMatch(element.psName)));
      phoneDatas.value.list.sort((a,b) {
        if(a.psName == b.psName){
          return int.parse(b.psOrder).compareTo(int.parse(a.psOrder));
        }
        else{
          return b.psName.compareTo(a.psName);
        }
      });
      phoneDatas.value.list.toSet().toList();
      update();
    }
  }


  RegExp plusRegExp(text){
    RegExp regex = RegExp(text, caseSensitive: false);
    return regex;
  }

  void reFreshButton(){
    currentIndex.value = 0;
    currentSort.value = 0;
    phoneDatas.value.list.clear();
    phoneDatas.value.list.addAll(datas.value.list.where((element) =>
    element.mkName == makerList[currentIndex.value].mkName
    ));
    phoneDatas.value.list.sort((a, b) =>
        int.parse(b.psOrder).compareTo(int.parse(a.psOrder)));
    phoneDatas.value.list.toSet().toList();
    update();
  }

  //case1//
  //데이터 받기 - default 설정 삼성 => 기본순
  Future<ModelListMobile> getModelTelecom(var companyNum) async {
    ModeListMobileMaker read = await _phoneSpecRepository.getMakerList();
    makerList.value = read.list;
    update();
    ModelListMobile data = await _phoneSpecRepository.getModelListMobile(companyNum);
    datas.value = data;
    update();
    if (makerList.isNotEmpty && currentIndex.value < makerList.length) {
      String currentMkName = makerList[currentIndex.value].mkName;

      phoneDatas.value.list.clear();
      phoneDatas.value.list.addAll(data.list.where((element) =>
      element.mkName == currentMkName
      ));
      phoneDatas.value.list.sort((a, b) =>
          int.parse(b.psOrder).compareTo(int.parse(a.psOrder)));
      phoneDatas.value.list = phoneDatas.value.list.toSet().toList();
      update();
    } else {
      Get.back();
      _commonWidgets.customSnackbar('잠시 후 다시 시도해주세요.');
      // 리스트가 비어있거나 currentIndex가 범위를 초과했을 때의 처리 로직
    }
    return data;
  }


  void moveToDetail(int index) async{
    await DeviceManager.overLayClients();
    Get.to(
            () => SearchPhoneDetail(
          psIdex: int.parse(phoneDatas.value.list[index].psIdx),
          psName: phoneDatas.value.list[index].psName,
        ), binding: BindingsBuilder(() {
      Get.put(SearchPhoneDetailController());
    })
    );
  }


  void dialogClick(int index){
    MakeDealController.to.joinerPhone.value = phoneDatas
        .value
        .list[index]
        .psName;
    MakeDealController.to.joinerPhoneIdx.value = phoneDatas.value.list[index].psIdx;
    MakeDealController.to.joinerPhoneModel.value = phoneDatas.value.list[index].mdModel;
    MakeDealController.to.joinerPhoneMax.value = phoneDatas.value.list[index].mdIsHalbuMonth48;
    MakeDealController.to.joinerPhoneImg.value = phoneDatas.value.list[index].piPath;
  }

  void openDialogPhoneData({
    required BuildContext routerContext,
    required int index
  }){
    SearchDialog().openTelecomDialog(
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