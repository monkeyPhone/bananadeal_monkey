import 'dart:async';
import 'package:banana_deal_by_monkeycompany/app/managers/device_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import '../../../../../components/common_widgets.dart';
import '../../../../../css/size.dart';
import '../../../../../models/auth_basic_api.dart';
import '../../../../../models/etc/user_review.dart';
import '../../../../../repository/etc/bookmark_repository.dart';
import '../../../src_components/controllers/src_route_controller.dart';

class EtcReviewSettingController extends GetxController with GetSingleTickerProviderStateMixin{
  static EtcReviewSettingController get to => Get.find();

  final BookmarkRepository _bookmarkRepository;
  final CommonWidgets commonWidgets;

  EtcReviewSettingController({
    required BookmarkRepository bookmarkRepository,
    required this.commonWidgets,
  }) : _bookmarkRepository = bookmarkRepository;



  //tap controller

  late TabController tabController;
  RxInt currentTap = 0.obs;

  void tabselect() {
    currentTap.value = tabController.index;
  }

  //widget controller
  RxBool dataSend = false.obs;

  late ScrollController scrollController1;
  late ScrollController scrollController2;
  late TextEditingController textEditingController;

  RxBool no = false.obs;
  RxBool write = false.obs;

  Rx<UserReview> userReview = UserReview(status: 0, msg: '', result: []).obs;
  RxList<ReviewList> beforeReview = <ReviewList>[].obs;
  RxList<ReviewList> afterReview = <ReviewList>[].obs;
  RxList<int> buttonLength = <int>[].obs;

  void createBoolList(int length) {
    // List<bool>을 초기화하고 기본값으로 false를 설정합니다.
    List<int> intList = <int>[];
    for (int i = 0; i < length; i++) {
      intList.add(0);
    }
    buttonLength.value = intList;
    update();
  }

  void changeValue(int index, int change){
    buttonLength[index] = change;
    update();
  }

  Future<UserReview> getReviewList() async{
    UserReview datas = await _bookmarkRepository.getUserReviewList();
    if(datas.result.isEmpty)
    {
      no.value = true;
      return userReview.value = datas;
    }
    else{
      no.value = false;
      beforeReview.clear();
      afterReview.clear();
      beforeReview.addAll(datas.result.where((element) => element.ruIdx == 0 && element.smStoreName != ''));
      beforeReview.sort((a, b) =>
          b.dhRegdate!.compareTo(a.dhRegdate!));
      afterReview.addAll(datas.result.where((element) => element.ruIdx != 0 && element.smStoreName != ''));
      afterReview.sort((a, b) =>
          b.ruRegdate!.compareTo(a.ruRegdate!));
      createBoolList(afterReview.length);
      return userReview.value = datas;
    }
  }

  Future<AuthBagicApi> writeReview({
    required String mName, required ruDiIdx,required int userIdx, required String smMid, required int ruPoint,
    required String ruContent, required String mPathImageEdit1, required String mPathImageEdit2, required String mPathImageEdit3
  }) async{
    final String content = DeviceManager.emojiConvert(ruContent);
    dataSend.value = true;
    AuthBagicApi api = await _bookmarkRepository.sendUserReviewList(
        mName: mName, ruDiIdx: ruDiIdx, ruUserIdx: userIdx, ruSmMid: smMid, ruPoint: ruPoint,
        ruContent: content, mPathImageEdit1: mPathImageEdit1, mPathImageEdit2: mPathImageEdit2, mPathImageEdit3: mPathImageEdit3
    );
    if(api.status == 200){
      initSendReview();
      write.value = true;
    }

    return api;
  }

  Future<AuthBagicApi> updateReview({
    required int ruIdx, required int ruPoint, required String ruContent,
    required String imagePath1, required String imagePath2, required String imagePath3,
    required String updateImagePath1, required String updateImagePath2, required String updateImagePath3
  }) async{
    dataSend.value = true;
    final String content = DeviceManager.emojiConvert(ruContent);
    AuthBagicApi api = await _bookmarkRepository.updateUserReviewList(
        ruIdx: ruIdx,
        ruPoint: ruPoint,
        ruContent: content,
        pathImage1: imagePath1,
        pathImage2: imagePath2,
        pathImage3: imagePath3,
        mPathImageEdit1: updateImagePath1,
        mPathImageEdit2: updateImagePath2,
        mPathImageEdit3: updateImagePath3);
    if(api.status == 200){
      initSendReview();
      write.value = true;
    }
    return api;
  }

  void updateSetting({required int point, required String content, required String image1, required String image2, required String image3,}) {
    reviewPoint.value = point;
    reviewInput.value = content;
    netWorkimage1.value = image1;
    netWorkimage2.value = image2;
    netWorkimage3.value = image3;
    textEditingController.text = content;
    switch(point){
      case 1:
        pointCheck.value = <bool>[true, false, false, false, false];
        break;
      case 2:
        pointCheck.value = <bool>[true, true, false, false, false];
        break;
      case 3:
        pointCheck.value = <bool>[true, true, true, false, false];
        break;
      case 4:
        pointCheck.value = <bool>[true, true, true, true, false];
        break;
      case 5:
        pointCheck.value = <bool>[true, true, true, true, true];
        break;
    }
  }

  void initSendReview() {
    reviewPoint.value = 0;
    reviewInput.value = '';
    imagePath.value = <CroppedFile?>[null,null,null];
    pointCheck.value =  <bool>[false, false, false, false, false];
    netWorkimage1.value = '';
    netWorkimage2.value = '';
    netWorkimage3.value = '';
    Get.back();
  }

  RxInt reviewPoint = 0.obs;

  RxString reviewInput = ''.obs;

  RxList<CroppedFile?> imagePath = <CroppedFile?>[null,null,null].obs;

  RxString netWorkimage1 = ''.obs;
  RxString netWorkimage2 = ''.obs;
  RxString netWorkimage3 = ''.obs;

  double imageSize = WidgetSize(Get.context!).sizedBox144/1.618;

  late FocusNode focus;

  void inputReview(val) {
    reviewInput.value = val;
  }

  void inputImage({required int index, required CroppedFile? crop}){
    EtcReviewSettingController.to.imagePath[index] = crop;
  }

  RxList<bool> pointCheck = <bool>[false, false, false, false, false].obs;

  String switchCasePointName(){
    switch(reviewPoint.value){
      case 0:
        return "점수를 선택하세요";
      case 1:
        return "별로에요";
      case 2:
        return "조금 아쉬워요";
      case 3:
        return "보통이에요";
      case 4:
        return "만족스러워요";
      case 5:
        return "적극 추천해요";
      default:
        return "점수를 선택하세요";

    }
  }

  bool regExpS(String val){
    return !RegExp(r'^\s*$').hasMatch(val);
  }

  void reviewContact(int index){
    switch(index){
      case 0:
        if(reviewPoint.value == 1)
          {
            reviewPoint.value = 0;
            pointCheck.value = [false, false, false, false, false];
          }
        else{
          reviewPoint.value = 1;
          pointCheck.value = [true, false, false, false, false];
        }
        break;
      case 1:
        reviewPoint.value = 2;
        pointCheck.value = [true, true, false, false, false];
        break;
      case 2:
        reviewPoint.value = 3;
        pointCheck.value = [true, true, true, false, false];
        break;
      case 3:
        reviewPoint.value = 4;
        pointCheck.value = [true, true, true, true, false];
        break;
      case 4:
        reviewPoint.value = 5;
        pointCheck.value = [true, true, true, true, true];
        break;
    }
  }


  void switchRouteCaseUpload(int index){
    switch(index){
      case 0:
        SrcRouteController.to.gotoUpload('review $index');
        break;
      case 1:
        SrcRouteController.to.gotoUpload('review $index');
        break;
      case 2:
        SrcRouteController.to.gotoUpload('review $index');
        break;
    }


  }

  void switchRouteCaseDelete({
    required BuildContext context,
    required int index
  }){
    commonWidgets.customDialog(
        routerContext: context,
        barrierDismissible: false,
        mainText: '선택한 사진의 등록을 삭제하시겠어요?', cancleText: '취소', confirmText: '삭제하기',
        conFirmOnTap: (){
          imagePath[index] = null;
          Get.back();
        });
  }

  void _controllerClose(){
    tabController.dispose();
    scrollController1.dispose();
    scrollController2.dispose();
    textEditingController.dispose();
    focus.dispose();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    scrollController1 = ScrollController();
    scrollController2 = ScrollController();
    textEditingController = TextEditingController();
    focus = FocusNode();
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(tabselect);
  }


  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    debounce(write, (_) =>
        Timer(Duration(milliseconds: 200), () async{
          write.value = false;
          dataSend.value = false;
          await getReviewList();
        }));
  }

  @override
  void onClose() {
    _controllerClose();
    // sController.dispose();
    super.onClose();
  }


}