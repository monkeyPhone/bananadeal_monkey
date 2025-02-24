import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:get/get.dart';
import '../../../../css/size.dart';
import '../../../../managers/device_manager.dart';


class NaverMarkerStaticController extends GetxController {

  late NaverMapController? mapController;

  RxDouble deviceHeight = WidgetSize(Get.context!).height60px.obs;
  RxBool isComplete = false.obs;

  Future<void> viewComplete() async{
    NCameraPosition currentPosition = await mapController!.getCameraPosition();
    await mapController!.updateCamera(
        NCameraUpdate.withParams(
            target: NLatLng(
                currentPosition.target.latitude,
                currentPosition.target.longitude
            )
        )
    );
    isComplete.value = true;
    update();


  }

  void onMapReadyCase1(NaverMapController controller) async{
    mapController = controller;
    await mapController!.setLocationTrackingMode(NLocationTrackingMode.none);
    await viewComplete();
  }


  @override
  void onInit() async{
    super.onInit();
    deviceHeight.value = await DeviceManager.getDeviceHeight();
    update();

}

void closeController(){
    if(mapController != null){
      mapController!.dispose();
    }
}

  @override
    void onClose() {
    closeController();
    // TODO: implement onClose
    super.onClose();
  }

}