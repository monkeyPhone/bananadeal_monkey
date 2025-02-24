import 'package:banana_deal_by_monkeycompany/app/managers/permission/permission_handler_manager.dart';
import 'package:banana_deal_by_monkeycompany/app/managers/register_manager.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/sign/controllers/sign_view_5_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import '../../../components/common_widgets.dart';
import '../../../components/future_loading_overlay.dart';
import '../../../managers/device_manager.dart';
import '../../../models/sign/address_model.dart';
import '../../../repository/sign/sign_5_repository.dart';
import '../../naver_maps/pages/naver_marker/naver_marker_controller.dart';
import '../../naver_maps/pages/naver_marker/naver_marker_view.dart';
import '../views/widgets/aleart.dart';

class SignView4Controller extends GetxController {
  static SignView4Controller get to => Get.find();

  final Repo5 _repo5 = const RegisterManager().getRepo5();

  final CommonWidgets commonWidgets;
  final PermissionHandlerManager _permissionHandlerManager;

  SignView4Controller({

    required this.commonWidgets,
    required PermissionHandlerManager permissionHandlerManager
  }) :  _permissionHandlerManager = PermissionHandlerManager();

  late FocusNode focus;
  RxBool dialogState = false.obs;
  RxString error = ''.obs;
  Rx<AddressModel> addressInfo = AddressModel(
      results: Results(
          common: Common(
              errorMessage: '', countPerPage: '', totalCount: '', errorCode: '', currentPage: ''
          ),
          juso: <Juso>[]
      )
  ).obs;

  late TextEditingController addressFormController;


  RxString addr = ''.obs;
  RxString dong = ''.obs;
  RxString latitude = ''.obs;
  RxString longtitude = ''.obs;


  RxString addressInput = ''.obs;
  RxInt currentPage = 1.obs;
  RxString res = ''.obs;




  void nextPage() {

    SignView5Controller.to.otherPageAdressUpdate(
      addrs: addr.value,
      dongs: dong.value,
      latitudes: latitude.value,
      longtitudes: longtitude.value
    );
    SignView5Controller.to.nextPage();
  }


  void inputAddr(valAddr) {
    addressInput.value = valAddr;
    update();

  }

  Future<void> countPlus(context) async{
    if(currentPage.value < int.parse(addressInfo.value.results.common.totalCount)/20.ceil())
    {
      currentPage.value++;
      update();
      await getAdress(addressInput.value, currentPage.value, context);
    }
    else{
      currentPage.value = (int.parse(addressInfo.value.results.common.totalCount)/20).ceil();
      update();
    }
  }

  Future<void> countMinus(context) async{
    if(currentPage.value > 1)
    {
      currentPage.value--;
      update();
      await getAdress(addressInput.value, currentPage.value, context);

    }
    else {
      currentPage.value = 1;
      update();
    }
  }

  void otherPageAdressUpdate({
    required String addrs,
    required String dongs,
    required String latitudes,
    required String longtitudes,
  }){
    addr.value = addrs;
    dong.value = dongs;
    latitude.value = latitudes;
    longtitude.value = longtitudes;
  }


  Future<AddressModel> getAdress(search, currentPage, context) async{
    final data = await showFutureLoadingOverlay<dynamic>(
      context: context,
      future: _repo5.addressSearch(search, currentPage),
      expanded: true,
    );
  addressInfo.value = data;
  update();
  if(addressInfo.value.results.common.errorMessage != '정상')
    {
      error.value = addressInfo.value.results.common.errorMessage;
      update();
    }
  else{
   if(addressInfo.value.results.juso.isEmpty)
     {
       error.value = '검색 실패';
       update();
     }
   else{
     error.value = '';
     update();
   }
  }
  return data;
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

  void initDialog(){
    dialogState.value = false;
    update();
    Get.back();
  }

  void initSelect(){
    addr.value = '';
    dong.value = '';
    latitude.value = '';
    longtitude.value = '';
    addressInput.value = '';
    update();
    addressFormController.clear();
  }

  void initAdress() {
    addressFormController.clear();
    addressInput.value = '';
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

  void openDialog(BuildContext context){
    commonWidgets.customDialog(
        routerContext: context,
        barrierDismissible: true,
        mainText: '앱 위치 접근 권한이 없기 때문에 지도에서 선택하기 서비스를 이용할 수 없습니다. 검색으로 위치 설정을 해주세요.',
        cancleText: '뒤로가기',
        confirmText: '설정이동',
        conFirmOnTap: (){
            Get.back();
            _permissionHandlerManager.openLocation();
          }
        );
  }

  void moveToMap() async{
    await DeviceManager.overLayClients();
    Get.to(
            () => NaverMarkerView(routeCase: 0,), binding:
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

  Rx<NLatLng> currentLatLng = NLatLng(0, 0).obs;

  Future makePlaceMarks(String adress, adress2, adress3, index) async{
    dialogState.value = true;
    update();
    try{
      List<Location> locations = await locationFromAddress(adress);
      currentLatLng.value = NLatLng(locations.first.latitude,locations.first.longitude);
          Get.dialog(
              barrierDismissible: false,
              PopScope(
                canPop: false,
                onPopInvoked: (bool didPop) {
                  if(didPop){
                    return;
                  }
                  initDialog();
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
                      () {
                    if(Get.isSnackbarOpen){
                      Get.back();
                    } else{
                      dong.value = addressInfo.value.results.juso[index].emdNm;
                      addr.value = addressInfo.value.results.juso[index].roadAddr;
                      latitude.value = currentLatLng.value.latitude.toString();
                      longtitude.value = currentLatLng.value.longitude.toString();
                      dialogState.value = false;
                      update();
                      Get.back();
                      nextPage();
                      {

                      }
                    }
                  },
                ),
              )
          );
      return NLatLng(locations.first.latitude,locations.first.longitude);
    } catch(e) {
      return makePlaceMarks2(adress2, adress3, index);
      //return callback;
    }
  }

  Future makePlaceMarks2(String adress, String sub, index) async{
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
              initDialog();
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
                  () {
                if(Get.isSnackbarOpen){
                  Get.back();
                } else{
                  dong.value = addressInfo.value.results.juso[index].emdNm;
                  addr.value = addressInfo.value.results.juso[index].roadAddr;
                  latitude.value = currentLatLng.value.latitude.toString();
                  longtitude.value = currentLatLng.value.longitude.toString();
                  dialogState.value = false;
                  update();
                  Get.back();
                  nextPage();
                }
              },
            ),
          )
      );
      return NLatLng(locations.first.latitude,locations.first.longitude);
    } catch(e){
      return makePlaceMarks3(sub, index);
    }
  }

  Future makePlaceMarks3(String adress, index) async{
    try{
      List<Location> locations = await locationFromAddress(adress);
      currentLatLng.value = NLatLng(locations.first.latitude,locations.first.longitude);
      update();
      Get.dialog(
          barrierDismissible: false,
          PopScope(
            canPop: false,
            onPopInvoked: (bool didPop){
              if(didPop){
                return;
              }
              initDialog();
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
                  () {
                if(Get.isSnackbarOpen){
                  Get.back();
                } else{
                  dong.value = addressInfo.value.results.juso[index].emdNm;
                  addr.value = addressInfo.value.results.juso[index].roadAddr;
                  latitude.value = currentLatLng.value.latitude.toString();
                  longtitude.value = currentLatLng.value.longitude.toString();
                  dialogState.value = false;
                  update();
                  nextPage();
                }
              },
            ),
          )
      );
      return NLatLng(locations.first.latitude,locations.first.longitude);
    } catch(e){
      commonWidgets.customSnackbar('위치를 찾을 수 없습니다. \n다른 장소를 선택해주세요.');
      return NLatLng(0,0);
    }
  }

  void _controllerClose(){
    addressFormController.dispose();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    addressFormController = TextEditingController();
    focus = FocusNode();
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