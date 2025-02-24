import 'dart:async';
import 'dart:io';
import 'package:banana_deal_by_monkeycompany/app/components/common_widgets.dart';
import 'package:banana_deal_by_monkeycompany/app/managers/device_manager.dart';
import 'package:banana_deal_by_monkeycompany/app/managers/register_manager.dart';
import 'package:banana_deal_by_monkeycompany/app/routes/api_url.dart';
import 'package:banana_deal_by_monkeycompany/app/routes/const_element.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../components/carousel/src/helpers/carousel_controller.dart';
import '../../../css/size.dart';
import '../../../repository/sign/sign_5_repository.dart';
import '../../../routes/error_handling.dart';

class SignView1Controller extends GetxController {
  static SignView1Controller get to => Get.find();


  final CommonWidgets _commonWidgets;
  final Repo5 _repo5;

  SignView1Controller({
    required CommonWidgets commonWidgets,
    required Repo5 repo5,
  }) : _repo5 = repo5,
      _commonWidgets = commonWidgets;

  final Future<double> _deviceManager = DeviceManager.getDeviceHeight();

  RxString sign1Status = AppElement.statusLoading.obs;

  //이미지
  RxInt currentImageIndex = 0.obs;
  //이미지 컨트롤러

  final CarouselController carouselController = CarouselController();
  final CarouselController emptyController = CarouselController();
  //이미지 변경 함수
  void pageChanged(int index){
    currentImageIndex.value = index;
  }

  final List<String> defaultImages = [AppElement.onboardingDefault1, AppElement.onboardingDefault2];

  RxList<dynamic> images = <dynamic>[].obs;


  Future<void> backButton(BuildContext context) async{
    _commonWidgets.customDialog(barrierDismissible: true,
        routerContext: context,
        mainText: '앱을 종료하시겠어요?', cancleText: '취소', confirmText: '종료',
        conFirmOnTap: () async{
          GetPlatform.isAndroid ? await SystemNavigator.pop()
              : GetPlatform.isIOS
              ?  exit(0)
              : null;
        }
    );
  }

  Future<void> statusCheck() async {
    var data = await _repo5.getIntroImage();
    images.value = data.result;
    update();
    if(images.isNotEmpty){
      sign1Status.value = AppElement.statusSuccess;
      update();
    }
    else if(images.isEmpty){
      sign1Status.value = AppElement.statusEmpty;
      update();
    }
    else{
      sign1Status.value = AppElement.statusError;
      update();
      if(data.status == 500 || data.status == 503)
        {
          if(data.status == 500){
            ErrorManager.errorCodeReturn(
                status: data.status,
                funcRoute: 'Repo5-getIntroImage',
                msg: data.msg,
                apiRoute: '${ApiConsole.bananaOpenUrl}/appinfo/img'
            );
          }

        }

    }
  }

  RxDouble device = WidgetSize(Get.context!).height60px.obs;


  @override
  void onInit() async{
    await statusCheck();
    device.value = await _deviceManager;
    update();
    super.onInit();
  }

}