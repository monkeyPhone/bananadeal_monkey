import 'package:banana_deal_by_monkeycompany/app/models/deal/page_info.dart';
import 'package:banana_deal_by_monkeycompany/app/models/etc/favorite_list_pae.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../../models/auth_basic_api.dart';
import '../../../../../models/store/store_list_info.dart';
import '../../../../../repository/etc/bookmark_repository.dart';
import '../../../src_components/controllers/src_info_controller.dart';
import '../../../src_components/controllers/src_route_controller.dart';
import '../../../../../repository/store/store_repository.dart';

class EtcBookmarkSettingController extends GetxController{
  static EtcBookmarkSettingController get to => Get.find();

  final BookmarkRepository _bookmarkRepository;
  final StoreRepository _storeRepository;

  EtcBookmarkSettingController({
    required BookmarkRepository bookmarkRepository,
    required StoreRepository storeRepository,
  }) :  _bookmarkRepository = bookmarkRepository,
        _storeRepository = storeRepository;

  late ScrollController bookmarkController;

  // Rx<BookmarkSetting> bookmark = BookmarkSetting(status: 0, msg: '', result: <Sinfo>[]).obs;
  // RxList<Sinfo> search = <Sinfo>[].obs;

  // RxString searchStore = ''.obs;

  RxList<Sinfo> favoriteList = <Sinfo>[].obs;
  Rx<AllPageInfo> pageInfo = AllPageInfo(total: 0, totalPages: 0).obs;
  RxInt currentPage = 1.obs;
  RxInt favoriteStatus = 0.obs;
  RxBool loading = false.obs;

  Future<void> getFavoritePageInit() async{
    favoriteStatus.value = 0;
    currentPage.value = 1;
    update();
    FavoriteListPage page = await _bookmarkRepository.getFavoriteListPage(
      mIdx: SrcInfoController.to.infoM.value.mIdx,
      latitude: SrcInfoController.to.infoM.value.mLatitude,
      longtitude: SrcInfoController.to.infoM.value.mLongitude,
      page: 1,
    );

    favoriteStatus.value = page.status;
    update();
    if(page.status == 200){
      favoriteList.value = page.result.first.list;
      pageInfo.value = AllPageInfo(
          total: page.result.first.total,
          totalPages: page.result.first.totalPages
      );
      update();
    }
    else{
      // print('asdfasdfasdf ${page.status}');
      favoriteList.value = [];
      pageInfo.value = AllPageInfo(total: 0, totalPages: 0);
      update();
    }
  }




  Future<void> getReloadFavorite() async{
    List<Sinfo> result = [];
    for(int i = 1; i <= currentPage.value; i++){
      final List<Sinfo> element = await reloadAdd(i);
      result.addAll(element);
    }
    loading.value = false;
    favoriteList.value = result;
    update();
  }


  Future<List<Sinfo>> reloadAdd(int index) async{
    FavoriteListPage page = await _bookmarkRepository.getFavoriteListPage(
      mIdx: SrcInfoController.to.infoM.value.mIdx,
      latitude: SrcInfoController.to.infoM.value.mLatitude,
      longtitude: SrcInfoController.to.infoM.value.mLongitude,
      page: index,
    );
    favoriteStatus.value = page.status;
    update();
    if(page.status == 200){
      if(currentPage.value > page.result.first.totalPages){
        currentPage.value = page.result.first.totalPages;
        update();
      }
      pageInfo.value = AllPageInfo(
          total: page.result.first.total,
          totalPages: page.result.first.totalPages
      );
      update();
      return page.result.first.list;
    }
    else{
      favoriteList.value = [];
      favoriteStatus.value = 502;
      pageInfo.value = AllPageInfo(total: 0, totalPages: 0);
      update();
      return [];
    }
  }

  Future<void> addPage() async{
    loading.value = true;
    currentPage.value++;
    update();
    FavoriteListPage page = await _bookmarkRepository.getFavoriteListPage(
      mIdx: SrcInfoController.to.infoM.value.mIdx,
      latitude: SrcInfoController.to.infoM.value.mLatitude,
      longtitude: SrcInfoController.to.infoM.value.mLongitude,
      page: currentPage.value,
    );
    favoriteStatus.value = page.status;
    update();
    if(page.status == 200){
      favoriteList.addAll(page.result.first.list);
      update();
    }
    else{
      favoriteList.value = [];
      pageInfo.value = AllPageInfo(total: 0, totalPages: 0);
      update();
    }
    loading.value = false;
    update();
  }


  // getFavorite() async{
  //   BookmarkSetting datas = await _bookmarkRepository.getFavoriteList(
  //       mIdx: SrcInfoController.to.infoM.value.mIdx,
  //       latitude: SrcInfoController.to.infoM.value.mLatitude,
  //       longtitude: SrcInfoController.to.infoM.value.mLongitude,
  //   );
  //   if(datas.result.isEmpty)
  //     {
  //       no.value = true;
  //       update();
  //       return bookmark.value = datas;
  //     }
  //   else{
  //     no.value = false;
  //     update();
  //     return bookmark.value = datas;
  //   }
  // }


  Future<void> deleteFavorite({required fSmMid, required int index}) async{
    if(Get.isSnackbarOpen){
      Get.back();
    } else{
      loading.value = true;
      update();
      AuthBagicApi api = await _storeRepository.favoriteDelete(fMidx: SrcInfoController.to.infoM.value.mIdx, fSmMid: fSmMid);
      if(api.status == 200){
        await getReloadFavorite();
      }
    }
  }

  // ValueChanged<String>? searchButton(String valAddr){
  //   searchStore.value = valAddr;
  //   update();
  //   return null;
  //
  // }

  goToDetail(index) {
    SrcRouteController.to.gotoStoreDetail(
        smid: favoriteList[index].smMId,
        midx: SrcInfoController.to.infoM.value.mIdx,
        index1: index,
        rong: 3);
  }

  void _controllerClose(){
    bookmarkController.dispose();
  }

  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
    bookmarkController = ScrollController();
    bookmarkController.addListener(() async{
      if(pageInfo.value.totalPages > currentPage.value){
        if(bookmarkController.position.pixels == bookmarkController.position.maxScrollExtent){
          await addPage();
        }
      }
    });
    await getFavoritePageInit();
  }



  @override
  void onClose() {
    // TODO: implement onClose
    _controllerClose();
    super.onClose();
  }

}