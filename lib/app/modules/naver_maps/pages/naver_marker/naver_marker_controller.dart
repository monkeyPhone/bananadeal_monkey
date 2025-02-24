import 'dart:async';
import 'package:banana_deal_by_monkeycompany/app/managers/device_manager.dart';
import 'package:flutter/services.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import '../../../../components/common_widgets.dart';
import '../../../../css/size.dart';
import '../../../sign/controllers/sign_view_4_controller.dart';
import '../../../src/pages/widgets/change_map/change_map_controller.dart';
import '../../../src/src_components/controllers/src_info_controller.dart';


class NaverMarkerController extends GetxController {

  final CommonWidgets _commonWidgets;

  NaverMarkerController({
    required CommonWidgets commonWidgets,
  }) : _commonWidgets = commonWidgets;

  late NaverMapController? mapController;

  //네이버 맵 현재 위치 위도경도
  Rx<NLatLng> myLatLng = NLatLng(0, 0).obs;

  Rx<NLatLng> currentLatLng = NLatLng(0, 0).obs;
  //false 카메라 움직이는중 , true 카메라 정지
  //휴대폰 위치와 지도상 마커와의 거리

  RxBool isCurrent = false.obs;

  NCameraUpdateReason? rosons;

  //현재 주소 위도 경도에서 변환한 변수
  RxList<Placemark> placemarks = <Placemark>[].obs;
  RxString street = ''.obs;
  RxString setDong = ''.obs;
  RxString error = ''.obs;

  RxBool isComplete = false.obs;

  Future<void> viewComplete() async{
      final NLatLng coordinate = await setPosition();
      await initPosition(coordinate.latitude, coordinate.longitude);
      isComplete.value = true;
      update();
  }


  Future<List<Placemark>> makePlaceAndroid(latitude, longitude) async{
    final List<Placemark> place = await placemarkFromCoordinates(latitude, longitude);
    placemarks.value = place;
    update();
    if(place.isNotEmpty){
      final List str = place.firstWhere((element) => element.street!.isNotEmpty && element.street != '' && !element.street!.contains('KR')).street.toString().split(' ');
      str.removeAt(0);
      final String tr = str.join(" ");
      street.value = tr;
      setDong.value = place.firstWhere((element) => element.thoroughfare!.isNotEmpty && element.thoroughfare != '').thoroughfare.toString();
      update();
    } else{
      setDong.value = '';
      street.value = '인식 불가 지역이에요.';
      update();
    }
    return place;
  }

  //지도 주소, 거리 계산 함수.
  Future<List<Placemark>> makePlaceIos(latitude, longitude) async{
    final List<Placemark> place = await placemarkFromCoordinates(latitude, longitude);
    placemarks.value = place;
    update();
    if(place.isNotEmpty){
      setDong.value = place.first.subLocality ?? '';
      street.value = place.first.street!.isNotEmpty && setDong.value != ''
              ? place.first.street.toString()
              : place.first.subLocality!.isNotEmpty && place.first.subLocality != '' && place.first.name!.isNotEmpty
                  ? '${place.first.subLocality} ${place.first.name}'
                  : '인식 불가 지역이에요.';
      update();
    } else{
      setDong.value = '';
      street.value = '인식 불가 지역이에요.';
      update();
    }
    return place;
  }


  void onMapReady(NaverMapController controller) async{
    mapController = controller;
    await mapController!.setLocationTrackingMode(NLocationTrackingMode.none);
    await mapController!.getLocationTrackingMode();
    await viewComplete();
  }


  Future<NLatLng> setPosition() async{
   try{
     final Position position = await Geolocator.getCurrentPosition(
         locationSettings: LocationSettings(
           accuracy: LocationAccuracy.best
          ),
         );
     final NLatLng lat = NLatLng(
         position.latitude,
         position.longitude
     );
     myLatLng.value = lat;
     update();
     return lat;
   } catch(_){
     final NLatLng lat = NLatLng(
         37.5760222,
         126.9769000
     );
     myLatLng.value = lat;
     update();
     _commonWidgets.customSnackbar('현재 위치 설정에 실패했습니다');
     return lat;
   }
  }




  void onMapTap(NPoint point, NLatLng latLng) async{
    await mapController!.updateCamera(NCameraUpdate.withParams(target: latLng));
    NCameraPosition currentPosition = await mapController!.getCameraPosition();
    street.value = '';
    currentLatLng.value = currentPosition.target;
    update();
  }


  Future<void> myPosition() async{
    await initPosition2();
  }

  Future<void> initPosition(double lat,double lnt) async{
    await mapController!.updateCamera(
        NCameraUpdate.withParams(
            target: NLatLng(
                lat,
                lnt
            )
        )
    );
    NCameraPosition currentPosition = await mapController!.getCameraPosition();
    street.value = '';
    currentLatLng.value = currentPosition.target;
    update();
  }

  Future<void> initPosition2() async{
    await mapController!.updateCamera(
        NCameraUpdate.withParams(
            target: NLatLng(
                myLatLng.value.latitude,
                myLatLng.value.longitude
            )
        )
    );
    NCameraPosition currentPosition = await mapController!.getCameraPosition();
    currentLatLng.value = currentPosition.target;
    street.value = '';
    update();
  }


  void cameraChange(
      NCameraUpdateReason reason, bool? isAnimated) async{
        try{
          if(isAnimated == true) {
            error.value = '위치 인식중...';
            reason = NCameraUpdateReason.location;
            rosons = reason;

            update();
          }
          if(isAnimated == false){

            street.value = '';
            error.value = '마커가 이동중입니다.';
            reason = NCameraUpdateReason.location;
            update();
          }
        } catch(e){
          street.value = '';
          error.value = '네트워크 상태를 확인해주세요.';
          update();
        }

  }

  void cameraFinish() async{
    NCameraPosition currentPosition = await mapController!.getCameraPosition();
    currentLatLng.value = currentPosition.target;
    if(currentLatLng.value == NLatLng(0, 0)) {
      error.value = '마커를 이동시켜 위치를 설정하세요!';
      update();
    }
    else{
      GetPlatform.isAndroid
       ? await makePlaceAndroid(
          currentPosition.target.latitude, currentPosition.target.longitude)
      : await makePlaceIos(
          currentPosition.target.latitude, currentPosition.target.longitude);
    }
  }


  void changeAdress(String m_add, String m_add_dong) async{
    SignView4Controller.to.otherPageAdressUpdate(addrs: m_add, dongs: m_add_dong, latitudes: currentLatLng.value.latitude.toString(), longtitudes: currentLatLng.value.longitude.toString());
    m_add != '' && m_add_dong != '' && currentLatLng.value.latitude.toString() != '' && currentLatLng.value.longitude.toString() != ''
      ? Get.back()
      : _commonWidgets.customSnackbar('마커를 움직여 다시 설정해주세요.');
    SignView4Controller.to.nextPage();

  }

  void changeAdress2(String m_add, String m_add_dong) async{
    await ChangeMapController.to.changeOnMapViewButton(
        addrs: m_add,
        dongs: m_add_dong,
        latitudes: currentLatLng.value.latitude.toString(),
        longtitudes: currentLatLng.value.longitude.toString()
    );
    m_add != '' && m_add_dong != '' && currentLatLng.value.latitude.toString() != '' && currentLatLng.value.longitude.toString() != ''
        ? Get.back()
        : _commonWidgets.customSnackbar('마커를 움직여 다시 설정해주세요.');
  }



  VoidCallback onTapFinish(route) {
    return (){
      if(street.value.contains('.') || street.value.contains('.'))
        {
          Get.snackbar('오류', '위치를 찾아주세요');
        }
      else{
        if(route == 0){
          changeAdress(street.value, setDong.value);
        } else{
            changeAdress2(street.value, setDong.value);
        }
      }
    };
  }


  RxDouble deviceHeight = WidgetSize(Get.context!).height60px.obs;


  void _controllerClose(){
   if(mapController != null ){
     mapController!.dispose();
   }
  }


  @override
  void onInit() async{
    deviceHeight.value = await DeviceManager.getDeviceHeight();
    update();
    super.onInit();

  }


  @override
  void onClose() {
    // TODO: implement onClose
    _controllerClose();
    super.onClose();
  }

}