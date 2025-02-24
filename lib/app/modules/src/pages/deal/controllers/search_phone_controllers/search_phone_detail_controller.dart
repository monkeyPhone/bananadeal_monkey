import 'package:banana_deal_by_monkeycompany/app/managers/register_manager.dart';
import 'package:banana_deal_by_monkeycompany/app/models/deal/mk_list.dart';
import 'package:banana_deal_by_monkeycompany/app/models/deal/mks_list.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/views/pages/search_phone/components/common/dialog/search_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../models/deal/model_detail_data.dart';
import '../../../../../../repository/deal/phone_spec_repository.dart';




class SearchPhoneDetailController extends GetxController {

  late final ScrollController firstController;
  final PhoneSpecRepository _phoneSpecRepository = const RegisterManager().getPhoneSpecRepository();

  Rx<ModelDetailData> datas = ModelDetailData(
    result: '',
    phoneSpecDetail: PhoneSpecDetail(
        psIdx: '', mkIdx: '', mksIdx: '',
        psOrder: '', psName: '', psModel: '', psOs: '', psCpu: '', psDisplay: '', psDisplaySize: '',
        psCameraFront: '', psCameraBack: '', psWeight: '', psHeight: '', psWidth: '', psThickness: '', psInMemory: '',
        psExMemory: '', psRam: '', psBattery: '', psInfo1: '', psInfo2: '', psExplainImgPath: '', psMobileGrade: '',
        psTypeAnalytics: '', psReleaseDate:  DateTime(0), psRegiDate:  DateTime(0), psEditDate:  DateTime(0),
        psDualNumber: '', psAllImgPath: '', psIsAllImg: '', psSpecNfc: '', psSpecType: '', psSpecFilm: '', psSpecUsim: '',
        psSpecComponent: '', psSpecDesign: '', psSpecSpecial: '', psSpecCamera: '', psSpecAsinfo: '', psSpecAod: '', psSpecPay: '', psSpecIp: ''),

    phoneImg: [], phoneOptionNum: [], ).obs;

  Rx<MksList> mksList =  MksList(mksIdx: '', mksName: '', mksOrder: '', mksImgPath: '').obs;
  RxList<MkList> mkList = <MkList>[].obs;

  RxInt currentColor = 0.obs;
  RxBool currentPage = false.obs;


  RxString specDesign = ''.obs;
  RxString specSpecial = ''.obs;
  RxString specCamera = ''.obs;

  Future<ModelDetailData> getModelDetail(var psIdx) async {
    var data = await _phoneSpecRepository.getModelDetailData(psIdx);
    var mk = await _phoneSpecRepository.getModelDetailMkData();
    var mks = await _phoneSpecRepository.getModelDetailMksData(data.phoneSpecDetail.mksIdx);
    specDesign.value = convertHtml(data.phoneSpecDetail.psSpecDesign);
    specSpecial.value = convertHtml(data.phoneSpecDetail.psSpecSpecial);
    specCamera.value = convertHtml(data.phoneSpecDetail.psSpecCamera);
    datas.value = data;
    mkList.value = mk.list;
    mksList.value = mks.list;
    update();
    return data;
  }

  void clickFloating(){
    currentPage.value =! currentPage.value;
    update();
  }

  void clickColor(int index){
    currentColor.value = index;
    update();
  }

  void openDialog(Widget image)
  {
    SearchDialog().openDetailImageDialog(
        routerContext: Get.context!,
        image: image);
  }

  String convertHtml(String spec,){
    List<String> designDetail = spec.split('\n');
    String designDetailFinal = '';
    for (int i = 0; i < designDetail.length; i++){
      if(i == 0){
        designDetail[i] = '<ul style="padding-left:0; margin-left:0;"><li style="margin: 10px 0px;">'+designDetail[i]+'</li>';
      } else{
        if(i == designDetail.length-1){
          designDetail[i] = '<li style="margin: 10px 0px;">'+designDetail[i]+'</li></ul>';
        } else{
          designDetail[i] = '<li style="margin: 10px 0px;">'+designDetail[i]+'</li>';
        }
      }
      designDetailFinal += designDetail[i];
    }
    return designDetailFinal;
  }

  void _controllerClsoe(){
    firstController.dispose();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    firstController = ScrollController();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    _controllerClsoe();
    super.onClose();
  }

}