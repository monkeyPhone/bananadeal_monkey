import 'dart:io';
import 'package:banana_deal_by_monkeycompany/app/app_outs/function/app_outs_function.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/upload/upload_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import '../../../../../components/common_dialog/common_widgets_2.dart';
import '../../../../../components/common_widgets.dart';
import '../../../../../css/style.dart';
import '../../../../../models/auth/auth_info.dart';
import '../../../../../models/auth_basic_api.dart';
import '../../../../../repository/etc/etc_info_repository.dart';
import '../../../../../repository/sign/sign_5_repository.dart';
import '../../../../../repository/src/src_info_repository.dart';
import '../../../../main/auth/auth_controller.dart';
import '../../../../main/loading/loading_controller.dart';
import '../../../src_components/controllers/src_info_controller.dart';
import '../../../src_components/controllers/src_route_controller.dart';


class EtcMyInfoSettingController extends GetxController {
  static EtcMyInfoSettingController get to => Get.find();

  final SrcInfoRepository _srcInfoRepository;
  final EtcInfoRepository _etcInfoRepository;
  final Repo5 _repo5;
  final CommonWidgets _commonWidgets;
  final CommonWidgets2 _commonWidgets2;

  EtcMyInfoSettingController({
    required SrcInfoRepository srcInfoRepository,
    required EtcInfoRepository etcInfoRepository,
    required Repo5 repo5,
    required CommonWidgets commonWidgets,
    required CommonWidgets2 commonWidgets2
  }) : _srcInfoRepository = srcInfoRepository,
       _etcInfoRepository = etcInfoRepository,
       _repo5 = repo5,
       _commonWidgets = commonWidgets,
       _commonWidgets2 = commonWidgets2;

  //crop
  RxBool crop = false.obs;

  RxString loading = ''.obs;

  //first
  RxInt currentCrop = 0.obs;
  RxString pickedFilePath = ''.obs;
  RxString croppedFilePath = ''.obs;
  List buttonName = ['','사진 보관함', '사진 찍기', '삭제하기'];
  List<IconData> icon = <IconData>[Icons.image, Icons.image_outlined, Icons.camera_alt_outlined, Icons.delete_outline_outlined];
  List<Color> color = <Color>[Style.blackWrite,Style.blackWrite,Style.blackWrite,Colors.redAccent];

  cropsRoute() async{
    switch(currentCrop.value){
      case 1:
        uploadImage();
        break;
      case 2:
        await uploadImageCamera();
        break;
      case 3:
        changeImage('');
        break;

    }
  }

  //second
  RxInt currentCrop2 = 0.obs;

  List buttonName2 = ['','저장하기', '취소하기'];
  List icon2 = [Icons.image, Icons.check,Icons.image_outlined, Icons.close];
  List color2 = [Style.blackWrite,Colors.blue,Style.blackWrite,Colors.redAccent];

  cropsRoute2() async{
    switch(currentCrop2.value){
      case 1:
        loading.value = '1';
        loading.value = await changeImage(croppedFilePath.value);
        update();
        break;
      case 2:
        init();
        break;
    }
  }



  void closeCrop(){
    crop.value = false;
    update();
  }


  void uploadImage() {
    SrcRouteController.to.gotoUpload('etc');
  }

  void cropButtonCropped(int index){
    currentCrop2.value = index;
    update();
    cropsRoute2();
  }

  void cropButtonNoCropped(int index){
    currentCrop.value = index;
    update();
    if(currentCrop.value == 3 && SrcInfoController.to.infoM.value.mPathImg == '')
    {
      _commonWidgets.customSnackbar('저장된 이미지가 없어요');
    }
    else{
      cropsRoute();
    }
  }

  Future<int> getImageFileSize(String imagePath) async {
    File imageFile = File(imagePath);
    int fileSize = await imageFile.length();
    update();
    return fileSize;
  }

  double convertBytesToMB(int bytes) {
    double megabytes = bytes / (1024 * 1024);
    update();
    return megabytes;
  }

  Future<bool> isImageSizeExceedsLimit(String imagePath) async{
    int fileSize = await getImageFileSize(imagePath);
    update();
    return fileSize < 5 * 1024 * 1024;
  }



  Future<void> cropImage(String file) async {
    if (file != '') {
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: file,
        compressFormat: ImageCompressFormat.jpg,
        compressQuality: 90,
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: '이미지 업로드',
            toolbarColor: Style.yellow,
            toolbarWidgetColor: Style.brown,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false,
            hideBottomControls: true,
            cropGridColor: Style.yellow,
            cropFrameColor: Style.yellow,
            cropStyle: CropStyle.circle,
          ),
          IOSUiSettings(
              title: '이미지 업로드',
              cancelButtonTitle: '취소',
              doneButtonTitle: '완료',
            cropStyle: CropStyle.circle,
          ),
        ],
      );
      if (croppedFile != null) {
      if(await isImageSizeExceedsLimit(croppedFile.path)){
        await changeImage(croppedFile.path);
      } else{
        _commonWidgets.customSnackbar('용량을 초과한 이미지에요!');
      }

      }
    }else{
      _commonWidgets.customSnackbar('수정할 사진을 먼저 선택해주세요!');
    }
  }



  Future<void> uploadImageCamera() async {
  try{
    final pickedFile =
    await ImagePicker().pickImage(source: ImageSource.camera, maxHeight: 800, maxWidth: 800, imageQuality: 80);
    if (pickedFile != null) {
      pickedFilePath.value = pickedFile.path;
      await cropImage(pickedFile.path);
      update();
    }
  } catch (e){
    _commonWidgets2.customDialogPermission(routerContext: Get.context!, route: 2);
    }
  }

  void chagne() {
      croppedFilePath.value = '';
      update();
  }

  void clear() {
      pickedFilePath.value = '';
      croppedFilePath.value = '';
      update();
}

void init(){
    crop.value = false;
  pickedFilePath.value = '';
  croppedFilePath.value = '';
    update();
}

  RxBool clickQuit = false.obs;


  clickQuickPush() {
    if(!clickQuit.value)
      {

      }
    else{
      etcController.clear();
      input.value = '';
      check.value = 0;
    }
    update();
    return clickQuit.value = clickQuit.value ? false : true;
  }

  void clickOut(BuildContext context){
    _commonWidgets.customDialog(
        routerContext: context,
        barrierDismissible: true,
        mainText: '정말로 탈퇴를 진행하시겠어요?', cancleText: '취소', confirmText: '탈퇴', conFirmOnTap: () async{
          Get.back();
          await userOut();
        });
  }

  Future<void> userOut() async{
    if(Get.isSnackbarOpen){
      Get.back();
    } else{
      AuthBagicApi api = await LoadingController.to.apiLoadings(
          future: _etcInfoRepository.userOut(reason: check.value, reasonDetail: check.value == 5 ? input.value : ''),
          text: Style.dataMent
      );
      if( api.status == 200)
      {
        if(SrcInfoController.to.infoM.value.mJoinType == "KAKAO"){
          try {
            await UserApi.instance.unlink();
            await AuthController.to.userout();
          } catch (error) {
            if (kDebugMode) {
              print('연결 끊기 실패 $error');
            }
          }
        } else{
          await AuthController.to.userout();
        }

        //await AuthController.to.logout();
      }
      update();
    }
  }

  RxInt check = 0.obs;
  List stepYearList1 =
  [
  '','더 이상 이용을 안 해요', '딜의 결과가 마음에 들지 않아요', '고객 응대가 마음에 들지 않아요', '다른 서비스를 이용하려고 해요', '기타'
  ];

  late TextEditingController etcController;
  late final TextEditingController passwordTextField1;

  RxString input = ''.obs;

  inputEtc(val){
    input.value = val;
    update();
  }


  RxString password1 = ''.obs;
  RxString error = ''.obs;
  RxBool lock1 = true.obs;


  //비밀번호 변경 다이어로그
  void inputPassword1(String val) {
    password1.value = val;
    update();
    if(val.length >= 20){
      error.value = '비밀번호의 길이가 너무 깁니다.';
      update();
    }
    if(!AppOutsFunction().pwRegExp(val))
    {
      error.value = '비밀번호의 조건이 충족되지 않습니다.';
      update();
    }
    if(password1.value.length == 0)
    {
      error.value = '';
      update();
    }
    if(AppOutsFunction().pwRegExp(val) && password1.value != password2.value && val.length <= 20)
    {
      error.value = '비밀번호가 일치하지 않습니다.';
      update();
    }
    if(password1.value == password2.value && val.length <= 20 && AppOutsFunction().pwRegExp(val))
    {
      error.value = '';
      update();
    }

  }

  bool validater(){
    bool result1 = AppOutsFunction().pwRegExp(password1.value);
    bool result2 = AppOutsFunction().pwRegExp(password2.value);
    return result1 && result2;
  }

  late TextEditingController passwordTextField2;
  RxString password2 = ''.obs;
  RxBool lock2 = true.obs;

  void inputPassword2(String val) {
    password2.value = val;
    update();

    if(val.length >= 20){
      error.value = '비밀번호의 길이가 너무 깁니다.';
      update();
    }
    if(!AppOutsFunction().pwRegExp(password1.value))
    {
      error.value = '비밀번호의 조건이 충족되지 않습니다.';
      update();
    }
    if(password1.value == password2.value  && val.length <= 20 && AppOutsFunction().pwRegExp(password1.value))
    {
      error.value = '';
      update();
    }
    if(AppOutsFunction().pwRegExp(password1.value) && password1.value != password2.value && val.length <= 20)
    {
      error.value = '비밀번호가 일치하지 않습니다.';
      update();
    }
    if(password2.value.length == 0)
    {
      error.value = '';
      update();
    }

  }

  void lockDown1(){
    lock1.value =! lock1.value;
    update();
  }

  void lockDown2(){
    lock2.value =! lock2.value;
    update();
  }

  void cropDown(){
    crop.value =! crop.value;
    update();
  }

  void changeCheck(int index){
    etcController.clear();
    input.value = '';
    check.value = index;
    update();
  }

  void initPass(){
    passwordTextField1.clear();
    password1.value = '';
    error.value = '';
    lock1.value = true;
    passwordTextField2.clear();
    password2.value = '';
    lock2.value = true;
    update();
    Get.back();
  }

  Future<void> changePw() async{
    if(Get.isSnackbarOpen){
      Get.back();
    } else{
      loading.value = '1';
      AuthBagicApi send = await _etcInfoRepository.changePw(email: SrcInfoController.to.infoM.value.mEmail, pw: password1.value);
      if(send.status == 200)
      {
        passwordTextField1.clear();
        password1.value = '';
        error.value = '';
        lock1.value = true;
        passwordTextField2.clear();
        password2.value = '';
        lock2.value = true;
        await getInfoM();
        update();
        Get.back();
        _commonWidgets.customSnackbar('비밀번호가 성공적으로 변경되었어요.');
      }
      if(send.status != 0){
        loading.value = '성공';
        update();
      }
    }

  }


  late TextEditingController nicknameController;
  RxString validate = ''.obs;
  RxBool okSign = false.obs;
  RxString nickName = ''.obs;
  RxInt strl = 0.obs;

  Future<void> sendName(String mName) async{
    if(nickName.value != ''){
      AuthBagicApi api = await _repo5.checkName(mName);
      if(api.status == 200){
        validate.value = '사용 가능한 닉네임이에요.';
        update();
      } else{
        validate.value = api.msg;
        update();

      }
    } else{
      validate.value = '닉네임을 입력해주세요.';
      update();
    }
  }

  Future<void> getInfoM() async{
    AuthInfo info = await _srcInfoRepository.getUserInfo();
    if(info.status == 200)
      {
        SrcInfoController.to.getMyInfoUpdate(info);
      }
  }

  Future<void> changeNick(mName) async{
   if(Get.isSnackbarOpen){
     Get.back();
   } else{
     loading.value = '1';
     AuthBagicApi send = await _etcInfoRepository.sendNick(mName: mName);
     if(send.status == 200)
     {
       nicknameController.clear();
       okSign.value = false;
       validate.value = '';
       nickName.value = '';
       strl.value = 0;
       await getInfoM();
       update();
       Get.back();
       _commonWidgets.customSnackbar('닉네임이 성공적으로 변경되었어요.');
     }
     if(send.status != 0){
       loading.value = '성공';
       update();
     }
   }
  }

  Future<String> changeImage(mPathImageEdit) async{
    AuthBagicApi send =

    mPathImageEdit == ''
    ?
    await _etcInfoRepository.deleteImage(mEmail: SrcInfoController.to.infoM.value.mEmail,
        mPathImage: SrcInfoController.to.infoM.value.mPathImg)
        :
    await _etcInfoRepository.sendImage(mEmail: SrcInfoController.to.infoM.value.mEmail,
        mPathImage: SrcInfoController.to.infoM.value.mPathImg, mPathImageEdit: mPathImageEdit);
    if(send.status == 200){
      await getInfoM();
      init();
      update();
      return '성공';
    } else{
      crop.value = true;
      _commonWidgets.customSnackbar('변경 실패');
      update();
      UploadController.to.initImage();
      return '';
    }
  }

  late FocusNode focus;

  void initNick(){
    nicknameController.clear();
    validate.value = '';
    nickName.value = '';
    okSign.value = false;
    strl.value = 0;
    update();
    Get.back();
  }


  void inputNick(valPh) {
    nickName.value = valPh.trimLeft().trimRight();
    update();

    if(nickName.value.length == 0){
      validate.value = '';
      okSign.value = false;
      update();
    }

    if (nickName.value.length < 2 && nickName.value.length != 0) {

      validate.value = '닉네임이 너무 짧아요.';
      okSign.value = false;
      update();
    }

    if (nickName.value.length > 10){

      validate.value = '닉네임이 너무 길어요.';
      okSign.value = false;
      update();
    }


    if (!RegExp(r"^[a-zA-Z가-힣0-9 ]*$")
        .hasMatch(valPh)) {
      okSign.value = false;
      validate.value = '사용할 수 없는 닉네임이에요.';
      update();
    }

    if((nickName.value.length  >= 2 && nickName.value.length  <= 10) && (RegExp(r"^[a-zA-Z가-힣0-9 ]*$")
        .hasMatch(valPh))) {
      okSign.value = true;
      validate.value = '중복체크를 해주세요.';
      update();
    }

  }

  void quitButtonClick(BuildContext context) {
    if(check.value == 0)
    {
      _commonWidgets.customSnackbar('탈퇴 사유를 선택해주세요!');
    }
    else{
      if(check.value == 5 &&input.value == ''){
        _commonWidgets.customSnackbar('사유를 작성해주세요!');
      }
      else{
        clickOut(context);
      }
    }
  }

  void _controllerClose(){
    etcController.dispose();
    passwordTextField1.dispose();
    passwordTextField2.dispose();
    nicknameController.dispose();
    focus.dispose();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    etcController = TextEditingController();
    passwordTextField1 = TextEditingController();
    passwordTextField2 = TextEditingController();
    nicknameController = TextEditingController();
    focus = FocusNode();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    debounce(loading, (_){
     if(loading.value == '성공' || loading.value == '실패'){
       loading.value = '';
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