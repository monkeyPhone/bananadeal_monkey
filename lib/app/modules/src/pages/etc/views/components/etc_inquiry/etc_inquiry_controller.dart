import 'package:banana_deal_by_monkeycompany/app/components/common_widgets.dart';
import 'package:banana_deal_by_monkeycompany/app/managers/image/image_dialog_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../../../../models/etc/in_question.dart';
import '../../../../../../../repository/etc/etc_etc_repository.dart';
import '../../../../../src_components/controllers/src_info_controller.dart';
import 'inquiry_send/inquiry_send_controller.dart';
import 'inquiry_send/inquiry_send_view.dart';

class EtcInquiryController extends GetxController{
  static EtcInquiryController get to => Get.find();

  final ImageDialogManager imageDialogManager;
  final EtcEtcRepository _etcEtcRepository;
  final CommonWidgets _commonWidgets;

  EtcInquiryController({
    required this.imageDialogManager,
    required EtcEtcRepository etcEtcRepository,
    required CommonWidgets commonWidgets
  }) : _etcEtcRepository = etcEtcRepository,
       _commonWidgets = commonWidgets;

  late ScrollController scrollController;

  RxBool sendInq = false.obs;


  RxList<QuestionList> questionList = <QuestionList>[].obs;
  List imageList = [];
  List imageListC = [];
  RxList<QuestionList> currentQuestionList =  <QuestionList>[].obs;

  Future<List<QuestionList>> getQuestionList() async{
    InQuestion api = await _etcEtcRepository.getUserInqList(mIdx: SrcInfoController.to.infoM.value.mIdx);
    if(api.status == 200)
      {

        questionList.value = api.result;
        questionList.sort(
          (a, b) => (DateTime.parse(b.miQRegdate).toLocal()).compareTo((DateTime.parse(a.miQRegdate).toLocal()))
        );
        update();
        return questionList.value = api.result;
      }
    else{
      update();
      return questionList.value = [];
    }
  }


  void leading(){
    if(currentQuestionList.isEmpty){
      Get.back();
    } else{
      clearQuestionList();
    }
  }

  void addQuestionList(int index){
    currentQuestionList.add(questionList[index]);
    currentQuestionList.first.miQPathImg1 != '' ? imageList.add(currentQuestionList.first.miQPathImg1) : null;
    currentQuestionList.first.miQPathImg2 != '' ? imageList.add(currentQuestionList.first.miQPathImg2) : null;
    currentQuestionList.first.miQPathImg3 != '' ? imageList.add(currentQuestionList.first.miQPathImg3) : null;
    currentQuestionList.first.miAPathImg1 != '' ? imageListC.add(currentQuestionList.first.miAPathImg1) : null;
    currentQuestionList.first.miAPathImg2 != '' ? imageListC.add(currentQuestionList.first.miAPathImg2) : null;
    currentQuestionList.first.miAPathImg3 != '' ? imageListC.add(currentQuestionList.first.miAPathImg3) : null;
    update();
  }

  void clearQuestionList(){
    currentQuestionList.clear();
    imageList.clear();
    imageListC.clear();
    update();
  }

  void listTapEvent(int index){
    currentQuestionList.isEmpty
        ? addQuestionList(index)
        : clearQuestionList();
  }

  void moveToSend(){
    Get.to(
            () => InquirySendView(), binding:
    BindingsBuilder(() {
      Get.put(InquirySendController(
          etcEtcRepository: _etcEtcRepository,
          commonWidgets: _commonWidgets

      ));
    }));
  }

  void _controllerClose(){
    scrollController.dispose();
  }

  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
    scrollController = ScrollController();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    debounce(sendInq, (_){
      if(sendInq.value){
        sendInq.value = false;
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