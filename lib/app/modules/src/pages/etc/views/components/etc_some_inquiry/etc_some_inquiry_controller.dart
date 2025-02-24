import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../../../../models/etc/some_question.dart';
import '../../../../../../../repository/etc/etc_etc_repository.dart';


class EtcSomeInquiryController extends GetxController{

  final EtcEtcRepository _etcEtcRepository;

  EtcSomeInquiryController({
    required EtcEtcRepository etcEtcRepository
  }) : _etcEtcRepository = etcEtcRepository;

  late ScrollController scrollController;
  late ScrollController columnController;


  RxList<SomeQuestionList> questionList = <SomeQuestionList>[].obs;
  List imageList = [];
  RxList<SomeQuestionList> currentQuestionList =  <SomeQuestionList>[].obs;

  Future<List<SomeQuestionList>> getQuestionList() async{
    SomeQuestion api = await _etcEtcRepository.getUserSomeInqList();
    if(api.status == 200)
      {
        update();
        return questionList.value = api.result;
      }
    else{
      update();
      return questionList.value = [];
    }
  }


  void leadingSome(){
    if(currentQuestionList.isEmpty){
      Get.back();
    } else{
      currentQuestionList.clear();
      imageList.clear();
      update();
    }
  }

  void addQuestionList(int index){
    currentQuestionList.add(questionList[index]);
    currentQuestionList.first.bfqPathImg1 != '' ? imageList.add(currentQuestionList.first.bfqPathImg1) : null;
    currentQuestionList.first.bfqPathImg2 != '' ? imageList.add(currentQuestionList.first.bfqPathImg2) : null;
    currentQuestionList.first.bfqPathImg3 != '' ? imageList.add(currentQuestionList.first.bfqPathImg3) : null;
    update();
  }

  void clearQuestionList(){
    currentQuestionList.clear();
    imageList.clear();
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
  void onClose() {
    // TODO: implement onClose
    _controllerClose();
    super.onClose();
  }

}