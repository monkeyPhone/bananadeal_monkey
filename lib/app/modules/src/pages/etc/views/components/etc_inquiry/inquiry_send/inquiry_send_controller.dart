import 'package:banana_deal_by_monkeycompany/app/css/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import '../../../../../../../../components/common_widgets.dart';
import '../../../../../../../../managers/device_manager.dart';
import '../../../../../../../../models/auth_basic_api.dart';
import '../../../../../../../../repository/etc/etc_etc_repository.dart';
import '../../../../../../../main/loading/loading_controller.dart';
import '../../../../../../src_components/controllers/src_info_controller.dart';
import '../../../../../../src_components/controllers/src_route_controller.dart';
import '../../etc_some_inquiry/etc_some_inquiry_controller.dart';
import '../../etc_some_inquiry/etc_some_inquiry_view.dart';
import '../etc_inquiry_controller.dart';


class InquirySendController extends GetxController{
  static InquirySendController get to => Get.find();

  final EtcEtcRepository _etcEtcRepository;
  final CommonWidgets _commonWidgets;

  InquirySendController({
    required EtcEtcRepository etcEtcRepository,
    required CommonWidgets commonWidgets,
  }) : _etcEtcRepository = etcEtcRepository,
       _commonWidgets = commonWidgets;



  late TextEditingController headerController;
  late TextEditingController contentController;

  RxString header = ''.obs;
  RxString content = ''.obs;

  void inputHeader(val) {
    header.value = val;
    update();
  }

  void inputContent(val) {
    content.value = val;
    update();
  }

  RxList<CroppedFile?> imagePath = <CroppedFile?>[null,null,null].obs;

  void switchRouteCaseUpload(int index){
    switch(index){
      case 0:
        SrcRouteController.to.gotoUpload('inquiry $index');
        break;
      case 1:
        SrcRouteController.to.gotoUpload('inquiry $index');
        break;
      case 2:
        SrcRouteController.to.gotoUpload('inquiry $index');
        break;
    }
  }

  void switchRouteCaseDelete({
    required BuildContext context,
    required int index
  }){
    _commonWidgets.customDialog(
        routerContext: context,
        barrierDismissible: false,
        mainText: '선택한 사진의 등록을 삭제하시겠어요?', cancleText: '취소', confirmText: '삭제하기',
        conFirmOnTap: (){
          imagePath[index] = null;
          update();
          Get.back();
        });
  }

  Future<void> sendInqCreate() async{
    if(Get.isSnackbarOpen){
      Get.back();
    } else{
      final String title = DeviceManager.emojiConvert(header.value);
      final String result = DeviceManager.emojiConvert(content.value);
      AuthBagicApi api = await 
      LoadingController.to.apiLoadings(
          future: _etcEtcRepository.userInqCreate(
            miMidx: SrcInfoController.to.infoM.value.mIdx,
            miName: SrcInfoController.to.infoM.value.mName,
            miTitle: title, miContent: result,
            miQpathImg1: imagePath[0] == null ? '' : imagePath[0]!.path,
            miQpathImg2: imagePath[1] == null ? '' : imagePath[1]!.path,
            miQpathImg3: imagePath[2] == null ? '' : imagePath[2]!.path,
          ),
        text: Style.inqCreate
      );
      if(api.status == 200)
      {
        EtcInquiryController.to.sendInq.value = true;
        update();
        Get.back();
        _commonWidgets.customSnackbar('1:1 문의 작성에 성공하였습니다.');
      }
      else{
        _commonWidgets.customSnackbar('1:1 문의 작성에 실패하였습니다.');
      }
    }
  }

  void updateImage({required int index, required CroppedFile? cropFile}){
    imagePath[index] = cropFile;
    update();
  }

  void moveToQuestion(){
    Get.to(
            () => EtcSomeInQuiryView(), binding:
    BindingsBuilder(() {
      Get.put(EtcSomeInquiryController(
        etcEtcRepository: _etcEtcRepository
      ));
    }));
  }

  void _controllerClose(){
    headerController.dispose();
    contentController.dispose();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    headerController = TextEditingController();
    contentController = TextEditingController();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    _controllerClose();
    super.onClose();
  }

}