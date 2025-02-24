import 'dart:async';
import 'package:banana_deal_by_monkeycompany/app/components/future_loading_overlay.dart';
import 'package:get/get.dart';
import '../../../../../css/style.dart';
import '../../../../../models/auth_basic_api.dart';
import '../../../../../models/store/store_list_info.dart';
import '../../../../main/loading/loading_controller.dart';
import '../../../pages/store/controllers/store_controller.dart';
import '../../../../../repository/store/store_repository.dart';
import '../../controllers/src_info_controller.dart';
import '../../../../../repository/bdbot/bd_bot_nav_rapository.dart';

class BdBotNavStoreController extends GetxController{
  static BdBotNavStoreController get to => Get.find();

  final StoreRepository _storeRepository;
  final BdBotNavRepository _bdBotNavRepository;

  BdBotNavStoreController({
    required StoreRepository storeRepository,
    required BdBotNavRepository bdBotNavRepository
  }) : _storeRepository = storeRepository,
        _bdBotNavRepository = bdBotNavRepository;


  Rx<StoreListInfo> storeInfo = StoreListInfo(status: 0, msg: '', result: <Sinfo>[]).obs;
  RxList<Sinfo> storeInfoSort = <Sinfo>[].obs;
  RxInt storeStatus = 0.obs;

  RxInt change = 0.obs;

  void changeValue(){
    change.value = 20;
    update();
  }




  Future<void> createFavorite({required fSmMid, required int index}) async{
    if(Get.isSnackbarOpen){
      Get.back();
    } else {
      AuthBagicApi api = await LoadingController.to.apiLoadings(
           future: _storeRepository.favoriteCreate(
               fMidx: SrcInfoController.to.infoM.value.mIdx, fSmMid: fSmMid
           ), text: Style.infoMent,

      );
      if(api.status == 200){
        storeInfoSort[index].favoriteStore = 1;
        update();
      }
    }
  }

  Future<void> deleteFavorite({required fSmMid, required int index}) async{
    if(Get.isSnackbarOpen){
      Get.back();
    } else{
      AuthBagicApi api = await LoadingController.to.apiLoadings(
          future: _storeRepository.favoriteDelete(
              fMidx: SrcInfoController.to.infoM.value.mIdx, fSmMid: fSmMid
          ),
          text: Style.infoMent
      );
      if(api.status == 200){
        storeInfoSort[index].favoriteStore = 0;
        update();
      }
    }
  }


// TODO: check 수정해야 됨

  Future<StoreListInfo> getStore({required int start, required String mOrder, required String mAsc}) async{
    StoreController.to.storePage.value = 0;
    StoreController.to.storeListLast.value = false;
    update();
    StoreListInfo store =  await _bdBotNavRepository.getStoreList(start: start, mOrder: mOrder, mAsc: mAsc);
    storeStatus.value = store.status;
    if(store.status == 200) {
      if(store.result.isNotEmpty){
        storeInfoSort.value = store.result.where((element) => element.ruBlock == '').toList();
        update();
        return storeInfo.value = store;
      } else{
        storeInfoSort.value = <Sinfo>[];
        update();
        return storeInfo.value = StoreListInfo(status: 0, msg: '', result: <Sinfo>[]);
      }
    }else{
      storeInfoSort.value = <Sinfo>[];
      update();
      return storeInfo.value = StoreListInfo(status: 0, msg: '', result: <Sinfo>[]);
    }
  }

// TODO: check 수정해야 됨
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    debounce(change,(_)=>
        Timer(const Duration(milliseconds: 100),
                () async{
              if(change.value == 20){
               await getStore(
                   start: 0,
                   mOrder: StoreController.to.switchMorder(StoreController.to.currentButton.value),
                   mAsc: StoreController.to.switchMasc(StoreController.to.currentButton.value)
               );
               StoreController.to.initState();
                Timer(const Duration(milliseconds: 100),
                        (){
                          change.value = 0;
                          update();
                    }
                );
              }
            }
        )
    );

    // );
  }


}