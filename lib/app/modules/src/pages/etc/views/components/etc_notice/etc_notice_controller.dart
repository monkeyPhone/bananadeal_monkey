import 'package:banana_deal_by_monkeycompany/app/managers/image/image_dialog_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../../../../models/etc/etc_notice.dart';
import '../../../../../../../repository/etc/etc_etc_repository.dart';


class EtcNoticeController extends GetxController{

  final EtcEtcRepository _etcEtcRepository;
  final ImageDialogManager imageDialogManager;

  EtcNoticeController({
    required EtcEtcRepository etcEtcRepository,
    required this.imageDialogManager
  }) : _etcEtcRepository = etcEtcRepository;

  RxInt parameter = 0.obs;

  late ScrollController scrollController;
  late ScrollController columnController;

  RxList<EtcNoticeList> questionList = <EtcNoticeList>[].obs;
  RxList<EtcNoticeList> currentQuestionList =  <EtcNoticeList>[].obs;

  Future<List<EtcNoticeList>> getQuestionList() async{
    EtcNotice api = await _etcEtcRepository.getUserNoticeList();
    if(api.status == 200)
      {
        questionList.value = api.result;
        questionList.sort(
          (a, b) => a.bnOrder.compareTo(b.bnOrder)
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
    currentQuestionList.isEmpty
        ? Get.back()
        : currentQuestionList.clear();
    update();
  }

  void addQuestionList(int index){
    currentQuestionList.add(questionList[index]);
    update();
  }
  
  void addOtherList(int other){
    currentQuestionList.add(questionList.firstWhere((element) => element.bnIdx == other));
    update();
  }

  void clearQuestionList(){
    currentQuestionList.clear();
    update();
  }

  void listTapEvent(int index){
    currentQuestionList.isEmpty
        ? addQuestionList(index)
        : clearQuestionList();
  }

  void _controllerClose(){
    scrollController.dispose();
    columnController.dispose();
  }

  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
    scrollController = ScrollController();
    columnController = ScrollController();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    debounce(parameter, (_) {
      if(parameter.value != 0){
        if(questionList.isNotEmpty){
          addOtherList(parameter.value);
        }
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