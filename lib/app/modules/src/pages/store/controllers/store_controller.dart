import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../css/style.dart';
import '../../../../../models/auth_basic_api.dart';
import '../../../../../models/store/store_list_info.dart';
import '../../../../../repository/bdbot/bd_bot_nav_rapository.dart';
import '../../../../../routes/const_element.dart';
import '../../../../main/loading/loading_controller.dart';
import '../../../src_components/bottom_nav_bar/controllers/bd_bot_nav_store_controller.dart';
import '../../../../../repository/store/store_repository.dart';
import '../../../src_components/controllers/src_info_controller.dart';
import '../../../src_components/controllers/src_route_controller.dart';


class StoreController extends GetxController{
  static StoreController get to => Get.find();
  final  BdBotNavRepository _bdBotNavRepository;
  final  StoreRepository _storeRepository;

  StoreController({
    required BdBotNavRepository bdBotNavRepository,
    required StoreRepository storeRepository
  }) :  _bdBotNavRepository = bdBotNavRepository,
        _storeRepository = storeRepository;

  late ScrollController sController;

  late FocusNode focus;


  //rong 0 = sort, 1= search
  RxInt rong = 0.obs;


  RxInt currentButton = 0.obs;
  RxList buttonName = ['가까운 순', '평점 순', '참여 순', '단골매장 순'].obs;


  RxBool searchListLast = false.obs;
  RxBool storeListLast = false.obs;

  late final TextEditingController storeText;
  RxString storeInput = ''.obs;
  RxString status = ''.obs;


  RxList<Sinfo> storeSearch = <Sinfo>[].obs;

  Rx<(bool, String)> loadingSearch = (false, '').obs;

  void inputStore(val) {
    loadingSearch.value = (false, '');
    storeInput.value = val;
    update();
    if(storeInput.value != '')
      {
        rong.value = 1;
        update();
      }
    if(storeInput.value == ''){
      rong.value = 0;
      storeSearch.clear();
      update();
    }
  }



  Future<void> getStoreSearch() async{
      loadingSearch.value = (true, '');
      searchPage.value = 0;
      searchListLast.value = false;
      update();
      StoreListInfo store = await _bdBotNavRepository.getStoreListSearch(start: 0, keyword: storeInput.value);
      if(store.status == 200){
        storeSearch.value = store.result;
        loading.value = false;
        loadingSearch.value = (false, '성공');
        update();
        if (kDebugMode) {
          print('스토어 로딩 }');
        }
      }
      else{
        storeSearch.value = store.result;
        if (kDebugMode) {
          print('스토어 로딩 실패}');
        }
        loadingSearch.value = (false, '실패');
        loading.value = false;
        update();
      }

  }

  Future<void> getAddStoreSearch({required int page}) async{
    if(searchPage.value != 0){
      StoreListInfo store = await _bdBotNavRepository.getStoreListSearch(start:  20*page, keyword: storeInput.value);
      if(store.status == 200){
        addStore.value = store.result;
        storeSearch.addAll(addStore);
        loading.value = false;
        update();
      }
      else{

      }
    }
  }

  Future<void> checkStoreSearch({required int page}) async{
    if(!searchListLast.value){
      StoreListInfo store = await _bdBotNavRepository.getStoreListSearch(start:  20*page, keyword: storeInput.value);
      if(store.status == 200){
        searchPage.value++;
        loading.value = true;
        update();
      }
      else{
        loading.value = false;
        searchListLast.value = true;
        update();
      }
    } else{

    }
  }


  void goToDetail({required int index, required List<Sinfo> list, required int rong}){
        SrcRouteController.to.gotoStoreDetail(
        smid: list[index].smMId,
        midx: SrcInfoController.to.infoM.value.mIdx,
        index1: index,
        rong: rong);
  }

  RxBool changeFavorite = false.obs;

  Future<void> createFavorite({required fSmMid, required int index}) async{
    if(Get.isSnackbarOpen){
      Get.back();
    } else{
      AuthBagicApi api = await LoadingController.to.apiLoadings(
          future: _storeRepository.favoriteCreate(fMidx: SrcInfoController.to.infoM.value.mIdx, fSmMid: fSmMid
          ),
          text: Style.infoMent
      );
      if(api.status == 200){
        storeSearch[index].favoriteStore = 1;
        changeFavorite.value = true;
        update();
      }
    }
  }

  Future<void> deleteFavorite({required fSmMid, required int index}) async{
    if(Get.isSnackbarOpen){
      Get.back();
    } else{
      AuthBagicApi api = await LoadingController.to.apiLoadings(
          future: _storeRepository.favoriteDelete(fMidx: SrcInfoController.to.infoM.value.mIdx, fSmMid: fSmMid),
          text: Style.infoMent
      );
      if(api.status == 200){
        storeSearch[index].favoriteStore = 0;
        changeFavorite.value = true;
        update();

      }
    }
  }

  RxInt storePage = 0.obs;
  RxInt searchPage = 0.obs;
  RxBool loading = false.obs;

  RxList<Sinfo> addStore = <Sinfo>[].obs;

  // TODO: check 수정해야 됨

  Future<void> getAddStore({required int page}) async{
    if(storePage.value != 0){
      StoreListInfo store = await _bdBotNavRepository.getStoreList(start: 20*page, mOrder: switchMorder(currentButton.value), mAsc: switchMasc(currentButton.value));
      if(store.status == 200){
        addStore.value = store.result;
        BdBotNavStoreController.to.storeInfoSort.addAll(addStore);
        loading.value = false;
        update();

      }
      else{

      }
    }
  }



  // TODO: check 수정해야 됨

  Future<void> checkStore({required int page}) async{
    if(!storeListLast.value){
      StoreListInfo store = await _bdBotNavRepository.getStoreList(start: 20*page, mOrder: switchMorder(currentButton.value), mAsc: switchMasc(currentButton.value));
      if(store.status == 200){
        storePage.value++;
        loading.value = true;
        update();
      }
      else{
        storeListLast.value = true;
        loading.value = false;
        update();
      }
    } else{

    }
  }

  String switchMorder(int index){
    switch(index){
      case 0:
        return AppElement.storeDistance;
      case 1:
        return AppElement.storeAvgPoint;
      case 2:
        return AppElement.storeParticipation;
      case 3:
        return AppElement.storeFavorite;
      default:
        return AppElement.storeRegDate;
    }
  }

  String switchMasc(int index){
    switch(index){
      case 0:
        return AppElement.storeAscending123;
      case 1:
        return AppElement.storeDescending321;
      case 2:
        return AppElement.storeDescending321;
      case 3:
        return AppElement.storeDescending321;
      default:
        return AppElement.storeDescending321;
    }
  }

  Future<void> switchStoreApi({required int start ,required int index}) async{
    initState();
    loading.value = true;
    update();
    switch(index){
      case 0:
        await BdBotNavStoreController.to.getStore(start: start, mOrder: AppElement.storeDistance, mAsc: AppElement.storeAscending123);
        break;
      case 1:
        await BdBotNavStoreController.to.getStore(start: start, mOrder: AppElement.storeAvgPoint, mAsc: AppElement.storeDescending321);
        break;
      case 2:
        await BdBotNavStoreController.to.getStore(start: start, mOrder: AppElement.storeParticipation, mAsc: AppElement.storeDescending321);
        break;
      case 3:
        await BdBotNavStoreController.to.getStore(start: start, mOrder: AppElement.storeFavorite, mAsc: AppElement.storeDescending321);
        break;
    }
    loading.value = false;
    update();
  }

  Future<void> clickSortBar(int index) async{
    currentButton.value = index;
    await switchStoreApi(start:0, index:index);
    await moveScrollInit();
    update();
  }

  Future<void> moveScrollInit() async{
    if(sController.hasClients){
      await sController.animateTo(sController.position.minScrollExtent, duration: const Duration(milliseconds: 1), curve: Curves.easeIn);
    }
  }



  void initState(){
    changeFavorite.value = false;
    loadingSearch.value = (false, '');
    rong.value = 0;
    storeSearch.clear();
    storeText.clear();
    storeInput.value = '';
    update();
  }

  void _controllerClose(){
    sController.dispose();
    storeText.dispose();
    focus.dispose();
  }


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    sController = ScrollController();
    storeText = TextEditingController();
    focus = FocusNode();
    sController.addListener(() async{
      if(sController.position.maxScrollExtent == sController.position.pixels)
        {
          if(rong.value == 0){
            await checkStore(page: storePage.value+1);
          } else{
            await checkStoreSearch(page: searchPage.value+1);
          }
          update();
        }
    });
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    debounce(storeInput, (_) async{
      storeInput.value == ''
          ? rong.value = 0 : rong.value = 1;
      update();
      if(storeInput.value == '' && changeFavorite.value){
        await switchStoreApi(start: 0, index: currentButton.value);
        changeFavorite.value = false;
        update();
      }
      if(storeInput.value != '')
        {
          loadingSearch.value = (true, '');
          update();
          Timer(Duration(seconds: 1),() async{
            await getStoreSearch();
          });
        }

    });

    debounce(storePage, (_) async{
      if(storePage.value != 0){
        await getAddStore(page: storePage.value);
        update();
      }
    });

    debounce(searchPage, (_) async{
      if(searchPage.value != 0){
        await getAddStoreSearch(page: searchPage.value);
        update();
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