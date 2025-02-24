import 'package:banana_deal_by_monkeycompany/app/css/style.dart';
import 'package:banana_deal_by_monkeycompany/app/managers/permission/permission_handler_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import '../../../../../components/common_widgets.dart';
import '../../../../../components/future_loading_overlay.dart';
import '../../../../../models/auth_basic_api.dart';
import '../../../../../models/sign/address_model.dart';
import '../../../../../repository/change_map/change_map_repository.dart';
import '../../../../../routes/const_element.dart';
import '../../../../dialog/dialog_isolation/dialog_isolation.dart';
import '../../../../main/loading/loading_controller.dart';
import '../../../../naver_maps/pages/naver_marker/naver_marker_controller.dart';
import '../../../../naver_maps/pages/naver_marker/naver_marker_view.dart';
import '../../../../sign/views/widgets/aleart.dart';
import '../../../src_components/bottom_nav_bar/controllers/bd_bot_nav_store_controller.dart';
import '../../../src_components/controllers/src_info_controller.dart';

class ChangeMapController extends GetxController {
  static ChangeMapController get to => Get.find();

  final ChangeMapRepository _changeMapRepository;
  final CommonWidgets commonWidgets;

  ChangeMapController({
    required ChangeMapRepository changeMapRepository,
    required this.commonWidgets,
  }) : _changeMapRepository = changeMapRepository;

  late ScrollController changeRangeC;
  late ScrollController searchListC;
  late FocusNode focus;
  late TextEditingController addressFormController;

  RxBool dialogState = false.obs;
  RxBool extend = false.obs;
  RxString notice = ''.obs;
  RxString error = ''.obs;
  Rx<AddressModel> addressInfo = AddressModel(
      results: Results(
          common: Common(
              errorMessage: '', countPerPage: '', totalCount: '', errorCode: '', currentPage: ''
          ),
          juso: <Juso>[]
      )
  ).obs;



  RxBool rangeChange = false.obs;
  RxInt currentRange = 0.obs;

  RxString addr = ''.obs;
  RxString dong = ''.obs;
  RxString latitude = ''.obs;
  RxString longtitude = ''.obs;


  RxString addressInput = ''.obs;
  RxInt currentPage = 1.obs;
  RxString res = ''.obs;
  RxString res2 = ''.obs;
  RxString res3 = ''.obs;
  RxInt maxPage = 0.obs;

  // RxInt check = 0.obs;
  // List rangeValue = [ '', '1km', '2km', '3km', '4km', '5km' ];
  RxList<int> rangeList = <int>[].obs;
  RxBool closeDialog = false.obs;

  Future<void> getRangeList() async {
    AuthBagicApi api = await _changeMapRepository.getRange();
    if(api.status == 200){
      rangeList.value = api.result;
      update();
    }
    else{
      rangeList.clear();
      Get.back();
    }
  }

  void pressBackButton(){
    dialogState.value = false;
    update();
    Get.back();
  }

  Future<void> clickListAddress({
    required BuildContext context,
    required int index
  }) async{
    if(!dialogState.value){
      final NLatLng lat = await makePlaceMarks(
        adress: addressInfo.value.results.juso[index].roadAddrPart1,
        adress2: addressInfo.value.results.juso[index].engAddr,
        adress3: addressInfo.value.results.juso[index].jibunAddr,
        index: index,
      );
    }
  }

  void openDialogAd(){
    dialogState.value = true;
    update();
  }

  void searchReasultExtendsClick(){
    extend.value =! extend.value;
    update();
  }

  void clickRangeButton(int index){
    currentRange.value = index;
    update();
  }

  void rangeChangeButton(){
    initRange(SrcInfoController.to.infoM.value.mSearchRange);
    rangeChange.value = true;
    update();
  }

  void appBarBackButton(){
    !rangeChange.value
        ?
    getBack()
        :
    rangeChange.value = false;
    update();
  }


  int initRange(int searchRange){
    currentRange.value = searchRange;
    update();
    return searchRange;
  }

  void getBack(){
    Get.back();
  }

  void nextPage() {
    Get.back();
  }

  Future<void> changeOnMapViewButton({required String addrs, required String dongs, required String latitudes, required String longtitudes}) async{
    addr.value = addrs;
    dong.value = dongs;
    latitude.value = latitudes;
    longtitude.value = longtitudes;
    update();
    await getMessage();
  }

  Rx<AuthBagicApi> msg = AuthBagicApi(status: 0, msg: '',result: []).obs;
  Rx<AuthBagicApi> rangeV = AuthBagicApi(status: 0, msg: '',result: []).obs;



  // TODO: check 수정해야 됨
  Future<AuthBagicApi> getMessage() async{
    AuthBagicApi data;
    data = await LoadingController.to.apiLoadings(
        future: _changeMapRepository.updateAdress(
            add: addr.value, dong: dong.value, latitude: latitude.value, longitude: longtitude.value
        ),
        text: Style.infoMent
    );

    if(data.status == 200)
    {
      await SrcInfoController.to.updateUserInfo();
      await BdBotNavStoreController.to.getStore(start: 0, mOrder: AppElement.storeDistance, mAsc: AppElement.storeAscending123);
      update();
      Get.back();
    }
    else{
      await SrcInfoController.to.updateUserInfo();
      update();
    }
    update();
    return msg.value = data;
  }



  // TODO: check 수정해야 됨
  Future<AuthBagicApi> changeMessage({required int range}) async{
    AuthBagicApi data = await LoadingController.to.apiLoadings(
        future: _changeMapRepository.updateSearchRange(range: range),
        text: Style.infoMent
    );

    if(data.status == 200)
    {
      await SrcInfoController.to.updateUserInfo();
      SrcInfoController.to.infoM.value.mLatitude == ''
          ? null
          : await BdBotNavStoreController.to.getStore(start: 0, mOrder: AppElement.storeDistance, mAsc: AppElement.storeAscending123);
      rangeChange.value = false;
    }
    else{
      await SrcInfoController.to.updateUserInfo();
    }
    rangeV.value = data;
    update();
    return data;
  }


  void inputAddr(String valAddr) {
    addressInput.value = valAddr;
    addressInput.value != '' ? notice.value = '' : null;
    update();
  }

  void moveScroll() async{
    if(searchListC.hasClients) {
      await searchListC.animateTo(searchListC.position.minScrollExtent, duration: const Duration(milliseconds: 1), curve: Curves.easeIn);
      update();
    }
  }

  Future<void> countPlus(BuildContext context) async{
    if(currentPage.value < int.parse(addressInfo.value.results.common.totalCount)/20.ceil())
    {
      currentPage.value++;
      moveScroll();
      await getAdress(search: addressInput.value, currentPage: currentPage.value, context: context);
    }
    else{
      currentPage.value = (int.parse(addressInfo.value.results.common.totalCount)/20).ceil();
    }
    update();
  }

  Future<void> countMinus(BuildContext context) async{
    if(currentPage.value > 1)
    {
      currentPage.value--;
      moveScroll();
      await getAdress(search: addressInput.value, currentPage: currentPage.value, context: context);
    }
    else {
      currentPage.value = 1;
    }
    update();
  }

  void noInputClick(){
    notice.value = '검색어를 입력해주세요!';
    update();
  }

  Future<AddressModel> getAdress({required String search, required int currentPage, required BuildContext context}) async{
    final AddressModel data = await showFutureLoadingOverlay<dynamic>(
      context: context,
      future: _changeMapRepository.addressSearch(search: search, currentPage: currentPage),
      expanded: true,
    );
    addressInfo.value = data;
    if(addressInfo.value.results.common.errorMessage != '정상')
    {
      error.value = addressInfo.value.results.common.errorMessage;
    }
    else{
      if(addressInfo.value.results.juso.isEmpty)
      {
        error.value = '검색 실패';
      }
      else{
        error.value = '';
      }
    }
    update();
    return addressInfo.value = data;
  }

  void focusAdress() {
    currentPage.value = 1;
    res.value = '';
    addressInfo.value = AddressModel(
        results: Results(
            common: Common(
                errorMessage: '', countPerPage: '', totalCount: '', errorCode: '', currentPage: ''
            ),
            juso: <Juso>[]
        )
    );
    update();
  }

  void initSelect(){
    addr.value = '';
    dong.value = '';
    latitude.value = '';
    longtitude.value = '';
    msg.value.status = 0;
    update();
  }

  void openDialog(BuildContext context){
    commonWidgets.customDialog(
        routerContext: context,
        barrierDismissible: true,  mainText: '앱 위치 접근 권한이 없기 때문에 지도에서 선택하기 서비스를 이용할 수 없습니다. 검색으로 위치 설정을 해주세요.',
        cancleText: '뒤로가기', confirmText: '설정이동', conFirmOnTap: (){Get.back(); PermissionHandlerManager().openLocation(); });
  }

  void moveToMap(){
    Get.to(
            () => NaverMarkerView(routeCase: 3,), binding:
    BindingsBuilder(() {
      Get.put(NaverMarkerController(
        commonWidgets: commonWidgets
      ));
    }));
  }

  Future<Position> determinePosition(BuildContext context) async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      openDialog(context);
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      openDialog(context);
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    moveToMap();
    return await Geolocator.getCurrentPosition();
  }


  void successGotoNaverMap(BuildContext context) async{
   if(SrcInfoController.to.infoM.value.mLatitude != ''){
     initAdress();
     Get.to(
             () => const NaverMarkerView(
           routeCase: 1,
         ), binding:
     BindingsBuilder(() {
       Get.put(NaverMarkerController(
           commonWidgets: commonWidgets
       ));
     }));
   } else {
     await determinePosition(context);
   }
  }

  void initAdress() {
    addressFormController.clear();
    addressInput.value = '';
    currentPage.value = 1;
    res.value = '';
    extend.value = false;
    addressInfo.value = AddressModel(
        results: Results(
            common: Common(
                errorMessage: '', countPerPage: '', totalCount: '', errorCode: '', currentPage: ''
            ),
            juso: <Juso>[]
        )
    );
    update();
  }

  Rx<NLatLng> currentLatLng = NLatLng(0, 0).obs;

  Future<NLatLng> makePlaceMarks({required String adress, required String adress2, required String adress3, required int index}) async{
    dialogState.value = true;
    update();
    try{
      List<Location> locations = await locationFromAddress(adress);
      currentLatLng.value = NLatLng(locations.first.latitude,locations.first.longitude);
      update();
      DialogIsolation().openAddressDialog(
        routerContext: Get.context!,
        middleText1:  currentLatLng.value == NLatLng(0, 0)
            ?
        '선택할 수 없는 장소입니다.'
            : '주소를 확인해주세요!',
        middleText2: addressInfo.value.results.juso[index].roadAddr,
        middleText3: addressInfo.value.results.juso[index].jibunAddr,
        onTapCancle: () {
          dialogState.value = false;
          update();
          Get.back();
        },
        onTapConfirm:
            () async{
          if(Get.isSnackbarOpen) {
            Get.back();
          } else{
            dong.value = addressInfo.value.results.juso[index].emdNm;
            addr.value = addressInfo.value.results.juso[index].roadAddr;
            latitude.value = currentLatLng.value.latitude.toString();
            longtitude.value = currentLatLng.value.longitude.toString();
            extend.value = false;
            dialogState.value = false;
            update();
            Get.back();
            {
              await getMessage();
            }
          }
        },
      );

      return currentLatLng.value = NLatLng(locations.first.latitude,locations.first.longitude);
    } catch(e) {
      //Get.back();
      return await makePlaceMarks2(adress: adress2, sub: adress3, index: index);
      //return callback;
    }
  }

  Future<NLatLng> makePlaceMarks2({required String adress, required String sub, required int index}) async{
    try{
      List<Location> locations = await locationFromAddress(adress);
      currentLatLng.value = NLatLng(locations.first.latitude,locations.first.longitude);
      update();
      Get.dialog(
          barrierDismissible: false,
          PopScope(
            canPop: false,
            onPopInvoked: (bool didPop) {
              if(didPop) {
                return;
              }
              pressBackButton();
            },
            child: AlertMessage(
              middleText1:  currentLatLng.value == NLatLng(0, 0)
                  ?
              '선택할 수 없는 장소입니다.'
                  : '주소를 확인해주세요!',
              middleText2: addressInfo.value.results.juso[index].roadAddr,
              middleText3: addressInfo.value.results.juso[index].jibunAddr,
              cancleText: '취소', confirmText: '선택',
              onTapCancle: () {
                dialogState.value = false;
                update();
                Get.back();
              },
              onTapConfirm:
                  () async{
                if(Get.isSnackbarOpen){
                  Get.back();
                } else{
                  dong.value = addressInfo.value.results.juso[index].emdNm;
                  addr.value = addressInfo.value.results.juso[index].roadAddr;
                  latitude.value = currentLatLng.value.latitude.toString();
                  longtitude.value = currentLatLng.value.longitude.toString();
                  extend.value = false;
                  dialogState.value = false;
                  update();
                  Get.back();
                  {
                    await getMessage();
                  }
                }
              },
            ),
          )
      );
      return currentLatLng.value = NLatLng(locations.first.latitude,locations.first.longitude);
    } catch(e){
      // Get.back();
      return await makePlaceMarks3(adress: sub, index: index);
    }
  }

  Future<NLatLng> makePlaceMarks3({required String adress, index}) async{
    try{
      List<Location> locations = await locationFromAddress(adress);
      currentLatLng.value = NLatLng(locations.first.latitude,locations.first.longitude);
      update();
      Get.dialog(
          barrierDismissible: false,
          PopScope(
            canPop: false,
            onPopInvoked: (bool didPop) {
              if(didPop){
                return;
              }
              pressBackButton();
            },
            child: AlertMessage(
              middleText1:  currentLatLng.value == NLatLng(0, 0)
                  ?
              '선택할 수 없는 장소입니다.'
                  : '주소를 확인해주세요!',
              middleText2: addressInfo.value.results.juso[index].roadAddr,
              middleText3: addressInfo.value.results.juso[index].jibunAddr,
              cancleText: '취소', confirmText: '선택',
              onTapCancle: () {
                dialogState.value = false;
                update();
                Get.back();
              },
              onTapConfirm:
                  () async{
                if(Get.isSnackbarOpen){
                  Get.back();
                } else{
                  dong.value = addressInfo.value.results.juso[index].emdNm;
                  addr.value = addressInfo.value.results.juso[index].roadAddr;
                  latitude.value = currentLatLng.value.latitude.toString();
                  longtitude.value = currentLatLng.value.longitude.toString();
                  extend.value = false;
                  dialogState.value = false;
                  update();
                  Get.back();
                  {
                    await getMessage();
                  }
                }
              },
            ),
          )
      );
      return currentLatLng.value = NLatLng(locations.first.latitude,locations.first.longitude);
    } catch(e){
      dialogState.value = false;
      update();
      // Get.back();
      commonWidgets.customSnackbar('위치를 찾을 수 없습니다. \n다른 장소를 선택해주세요.');
      return currentLatLng.value = const NLatLng(0,0);
    }
  }

  void _controllerClose(){
    changeRangeC.dispose();
    searchListC.dispose();
    addressFormController.dispose();
    focus.unfocus();
  }

  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
    initRange(SrcInfoController.to.infoM.value.mSearchRange);
    changeRangeC = ScrollController();
    searchListC = ScrollController();
    focus = FocusNode();
    addressFormController = TextEditingController();
    await getRangeList();

  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    ever(addressInput, (_) {
      focusAdress();
    });

  }

  @override
  void onClose() {
    // TODO: implement onClose
    _controllerClose();
    super.onClose();
  }

}