import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/views/pages/search_rateplan/search_rateplan_status/dialog/rate_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../models/deal/model_name.dart';
import '../../../../../../models/deal/phone_rate_plan.dart';
import '../../../../../../models/deal/phone_rate_plan_detail.dart';
import '../../../../../../models/deal/rate_plan_name_list.dart';
import '../../../../../../repository/deal/rate_plan_repository.dart';
import '../../components/post_deal/moduels/make_deal/controllers/make_deal_controller.dart';


class SearchRateplanController extends GetxController {

  final RatePlanRepository _ratePlanRepository;

  SearchRateplanController({
    required RatePlanRepository ratePlanRepository
  }) : _ratePlanRepository = ratePlanRepository;

  late final ScrollController firstController;



  List arraySort = ['기본 순', '기본료 순 ↓', '기본료 순 ↑', '최신 순', '이름 순 ↓', '이름 순 ↑'];

  Rx<RatePlanNameList> nameData = RatePlanNameList(
      list: [
    NameList(pgIdx: '', tkIdx: '', pgOrder: '', pgName: '', pgRegiDate: '', pgEditDate: '')
  ]).obs;


  Rx<PhoneRatePlan> rateData = PhoneRatePlan(
      rateList: [
        RateList(pIdx: '', pgIdx: '', pOrder: '', pType: '', pPlanName: '', pPlanPrice: '', pLte: '', pTel: '', pSms: '', pgName: '')
      ]).obs;
  RxList<RateList> rateListModel = <RateList>[].obs;


  late TextEditingController searchPlanC;
  RxString searchPlanText = ''.obs;

  //case1//
  //case1_var
  RxInt currentIndex = 0.obs;
  RxInt currentSort = 0.obs;
  RxString convertInfo = ''.obs;



  void searchButtonIcon(){
    searchPlanText.value = searchPlanC.text;
    switchSort(searchPlanText.value);
    update();
  }

  void rateSortClick(int index){
    switch(index){
      case 0:
        currentSort.value = 0;
        update();
        switchSort(searchPlanText.value);
      case 1:
        currentSort.value == 1 ? currentSort.value = 2 : currentSort.value = 1;
        update();
        switchSort(searchPlanText.value);
      case 2:
        currentSort.value = 3;
        update();
        switchSort(searchPlanText.value);
      case 3:
        currentSort.value == 4 ? currentSort.value = 5 : currentSort.value = 4;
        update();
        switchSort(searchPlanText.value);
    }

  }

  ValueChanged<String>? searchButton(String valAddr){
    searchPlanText.value = valAddr;
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
    searchPlanText.value = valAddr;
    switchSort(valAddr);
    update();
    return null;
  }

  //case1_bu
  //case1_fuc_search


  //case1_button_func
  void onTapComPany(var index){
    currentIndex.value = index;
    update();
    switchSort(searchPlanText.value);
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

  // //case1_button_func_sort_def
  // switchSortDef(String text) {
  //   log(searchPlanText.value);
  //   log(currentSort.value.toString());
  //   switch (currentSort.value) {
  //     case 0:
  //       return basicSort(text);
  //     case 1:
  //       return priceSort(text);
  //     case 2:
  //       return priceSort2(text);
  //     case 3:
  //       return latestSort(text);
  //     case 4:
  //       return namingSort(text);
  //     case 5:
  //       return namingSort2(text);
  //     default:
  //       return rateListModel.value = [];
  //   }
  // }

  RegExp plusRegExp(text){
    RegExp regex = RegExp(text, caseSensitive: false);
    return regex;
  }

  //기본순
  void basicSort(String text){
    rateListModel.clear();
    rateListModel.value = <RateList>[];
    update();
    if(text == '') {
      rateListModel.addAll(rateData.value.rateList!.where((element) =>
          element.pgName!.contains(nameData.value.list[currentIndex.value].pgName)));
      rateListModel.sort((a, b) =>
          int.parse(b.pOrder!).compareTo(int.parse(a.pOrder!)));
      rateListModel.toSet().toList();
      update();
    }else {
      RegExp regex = plusRegExp(text);
      rateListModel.addAll(rateData.value.rateList!.where((element) => element.pgName!.contains(nameData.value.list[currentIndex.value].pgName))
          .where((element) => regex.hasMatch(element.pPlanName!)));
      rateListModel.sort((a,b)=>int.parse(b.pOrder!).compareTo(int.parse(a.pOrder!)));
      rateListModel.toSet().toList();
      update();
    }
  }

  //가격순
  void priceSort(String text){

    if(text == '')
    {
      rateListModel.clear();
      rateListModel.addAll(rateData.value.rateList!.where((element) => element.pgName!.contains(nameData.value.list[currentIndex.value].pgName)));
      rateListModel.sort((a,b)=>int.parse(a.pPlanPrice!).compareTo(int.parse(b.pPlanPrice!)));
      rateListModel.toSet().toList();
      update();

    }
    else{
      RegExp regex = plusRegExp(text);
      rateListModel.clear();
      rateListModel.addAll(rateData.value.rateList!.where((element) => element.pgName!.contains(nameData.value.list[currentIndex.value].pgName))
          .where((element) => regex.hasMatch(element.pPlanName!)  ));
      rateListModel.sort((a,b)=>int.parse(a.pPlanPrice!).compareTo(int.parse(b.pPlanPrice!)));
      rateListModel.toSet().toList();
      update();
    }

  }

  void priceSort2(String text){

    if(text == '')
    {
      rateListModel.clear();
      rateListModel.addAll(rateData.value.rateList!.where((element) => element.pgName!.contains(nameData.value.list[currentIndex.value].pgName)));
      rateListModel.sort((a,b)=>int.parse(b.pPlanPrice!).compareTo(int.parse(a.pPlanPrice!)));
      rateListModel.toSet().toList();
      update();

    }
    else{
      RegExp regex = plusRegExp(text);
      rateListModel.clear();
      rateListModel.addAll(rateData.value.rateList!.where((element) => element.pgName!.contains(nameData.value.list[currentIndex.value].pgName))
          .where((element) => regex.hasMatch(element.pPlanName!)  ));
      rateListModel.sort((a,b)=>int.parse(b.pPlanPrice!).compareTo(int.parse(a.pPlanPrice!)));
      rateListModel.toSet().toList();
      update();
    }

  }

  //최신순
  void latestSort(String text){
    if(text == '')
      {
        rateListModel.clear();
        rateListModel.addAll(rateData.value.rateList!.where((element) => element.pgName!.contains(nameData.value.list[currentIndex.value].pgName)));
        rateListModel.sort((a,b)=>int.parse(b.pIdx!).compareTo(int.parse(a.pIdx!)));
        rateListModel.toSet().toList();
        update();

      }
    else{
      RegExp regex = plusRegExp(text);
      rateListModel.clear();
      rateListModel.addAll(rateData.value.rateList!.where((element) => element.pgName!.contains(nameData.value.list[currentIndex.value].pgName))
          .where((element) => regex.hasMatch(element.pPlanName!)  ));
      rateListModel.sort((a,b)=>int.parse(b.pIdx!).compareTo(int.parse(a.pIdx!)));
      rateListModel.toSet().toList();
      update();
    }
  }


  //이름순
  void namingSort(String text){
    if(text == '')
      {
        rateListModel.clear();
        rateListModel.addAll(rateData.value.rateList!.where((element) => element.pgName!.contains(nameData.value.list[currentIndex.value].pgName)));
        rateListModel.sort((a,b)=>a.pPlanName!.compareTo(b.pPlanName!));
        rateListModel.toSet().toList();
        update();
      }
    else{
      RegExp regex = plusRegExp(text);
      rateListModel.clear();
      rateListModel.addAll(rateData.value.rateList!.where((element) => element.pgName!.contains(nameData.value.list[currentIndex.value].pgName))
          .where((element) =>  regex.hasMatch(element.pPlanName!)));
      rateListModel.sort((a,b)=>a.pPlanName!.compareTo(b.pPlanName!));
      rateListModel.toSet().toList();
      update();
    }
  }

  void namingSort2(String text){
    if(text == '')
    {
      rateListModel.clear();
      rateListModel.addAll(rateData.value.rateList!.where((element) => element.pgName!.contains(nameData.value.list[currentIndex.value].pgName)));
      rateListModel.sort((a,b)=>b.pPlanName!.compareTo(a.pPlanName!));
      rateListModel.toSet().toList();
      update();
    }
    else{
      RegExp regex = plusRegExp(text);
      rateListModel.clear();
      rateListModel.addAll(rateData.value.rateList!.where((element) => element.pgName!.contains(nameData.value.list[currentIndex.value].pgName))
          .where((element) =>  regex.hasMatch(element.pPlanName!)));
      rateListModel.sort((a,b)=>b.pPlanName!.compareTo(a.pPlanName!));
      rateListModel.toSet().toList();
      update();
    }
  }
  //데이터받기


  RxString error = ''.obs;

  Future<void> getModelRatePlan(var companyNum) async {
    try{
      RatePlanNameList name = await _ratePlanRepository.getRatePlanName(companyNum);
      if(MakeDealController.to.joinerPhoneModel.value == '' && MakeDealController.to.requestAgencyN.value != 0){
        var data = await _ratePlanRepository.getRatePlan(companyNum);
        // nameData.value = name;
        nameData.value.list.clear();
        nameData.value.list.addAll(name.list.where(
                (element1) => data.rateList!.where(
                    (element2) => element2.pgName!.contains(element1.pgName)).isNotEmpty
         )
        );
        rateData.value = data;
        rateListModel.clear();
        rateListModel.addAll(rateData.value.rateList!.where((element) =>
            element.pgName!.contains(nameData.value.list[currentIndex.value].pgName)));
        rateListModel.sort((a, b) =>
            int.parse(b.pOrder!.toString()).compareTo(int.parse(a.pOrder!.toString())));

        rateListModel.toSet().toList();
        update();
      }
      else{
        ModelName model = await _ratePlanRepository.getPhoneModelName(tkIdx: MakeDealController.to.requestAgencyN,ps_idx: MakeDealController.to.joinerPhoneIdx);
        MakeDealController.to.joinerPhoneModel.value = model.list.first.mdModel;
        var data = await _ratePlanRepository.getRatePlanMobile(tkIdx: MakeDealController.to.requestAgencyN, mdModel: model.list.first.mdModel);
        //nameData.value = name;
        nameData.value.list.clear();
        nameData.value.list.addAll(name.list.where(
                (element1) => data.rateList!.where(
                    (element2) => element2.pgName!.contains(element1.pgName)).isNotEmpty
        )
        );
        rateData.value = data;
        rateListModel.clear();
        rateListModel.addAll(rateData.value.rateList!.where((element) =>
            element.pgName!.contains(nameData.value.list[currentIndex.value].pgName)));
        rateListModel.sort((a, b) =>
            int.parse(b.pOrder!.toString()).compareTo(int.parse(a.pOrder!.toString())));
        rateListModel.toSet().toList();
        update();
      }
    } catch(_){
      error.value = 'N';
      rateData.value = PhoneRatePlan(
          rateList: [
            RateList(pIdx: '', pgIdx: '', pOrder: '', pType: '', pPlanName: '', pPlanPrice: '', pLte: '', pTel: '', pSms: '', pgName: '')
          ]);
      update();
    }
  }

  Rx<PhoneRatePlanDetail> rateDetail = PhoneRatePlanDetail(list: []).obs;

  String convertHtml(String spec,){
    List<String> designDetail = spec.split('\n');
    String designDetailFinal = '';
    for (int i = 0; i < designDetail.length; i++){
      designDetail[i] = designDetail[i].replaceAll('<u>', '');
      designDetail[i] = designDetail[i].replaceAll('</u>', '');
      designDetailFinal += designDetail[i];
    }
    convertInfo.value = designDetailFinal;
    update();
    return designDetailFinal;
  }


  void convertString(String value){
    String p = value;
    p.replaceAll("음성", "");
    p.replaceAll("데이터", "");
    convertInfo.value = p;
    update();
  }


  Future<PhoneRatePlanDetail> getModelRatePlanDetail(var pIdx) async {
    if(MakeDealController.to.joinerPhoneModel.value == '' && MakeDealController.to.requestAgencyN.value != 0) {

      var data = await _ratePlanRepository.getRatePlanDetail(pIdx);
      rateDetail.value = data;
      update();
      convertHtml(data.list.first.pInfo!);
      return data;
    } else{
      var data = await _ratePlanRepository.getRatePlanMobileDetail(pIdx: pIdx, tkIdx: MakeDealController.to.requestAgencyN, mdModel: MakeDealController.to.joinerPhoneModel);
      rateDetail.value = data;
      update();
      convertHtml(data.list.first.pInfo!);
      return data;
    }
  }

  void rateDialog({
    required BuildContext context,
    required RateList rate
  }){
    RateDialog().clickDetailDialog(routerContext: context, rate: rate);
  }

  void _controllerClose(){
    firstController.dispose();
    searchPlanC.dispose();
  }

  @override
  void onInit() async{
    super.onInit();
    firstController = ScrollController();
    searchPlanC = TextEditingController();
    await getModelRatePlan(Get.arguments);
  }

  @override
  void onReady(){
    super.onReady();
    debounce(error, (_){
      Get.delete<SearchRateplanController>();
      Get.back();
    });
    debounce(searchPlanText, (_){
      switchSort(searchPlanText.value);
    });
  }

  @override
    void onClose() {
      // TODO: implement onClose
    _controllerClose();
    super.onClose();
  }
}
