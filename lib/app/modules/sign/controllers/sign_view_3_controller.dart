import 'dart:io';
import 'package:banana_deal_by_monkeycompany/app/components/common_dialog/common_widgets_2.dart';
import 'package:banana_deal_by_monkeycompany/app/managers/device_manager.dart';
import 'package:banana_deal_by_monkeycompany/app/managers/register_manager.dart';
import 'package:banana_deal_by_monkeycompany/app/models/auth_basic_api.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/sign/controllers/sign_view_5_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/repository/sign/sign_5_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import '../../../components/common_widgets.dart';
import '../../../css/size.dart';
import '../../../css/style.dart';
import '../../../managers/permission/permission_handler_manager.dart';
import '../../src/pages/widgets/upload/upload.dart';
import '../../src/pages/widgets/upload/upload_controller.dart';
import '../views/pages/sign4/sign_view_4.dart';

class SignView3Controller extends GetxController {
  static SignView3Controller get to => Get.find();

  final Repo5 _repo5 = const RegisterManager().getRepo5();

  final CommonWidgets _commonWidgets;
  final CommonWidgets2 _commonWidgets2;
  final PermissionHandlerManager _permissionHandlerManager;

  SignView3Controller({
    required CommonWidgets commonWidgets,
    required CommonWidgets2 commonWidgets2,
    required PermissionHandlerManager permissionHandlerManager
  }) :
        _commonWidgets = commonWidgets,
        _commonWidgets2 = commonWidgets2,
        _permissionHandlerManager = PermissionHandlerManager();

  RxDouble deviceHeight = WidgetSize(Get.context!).height60px.obs;

  late TextEditingController nicknameController;
  RxString validate = ''.obs;
  RxString nickName = ''.obs;

  RxBool valiColor = false.obs;
  RxBool confirm = false.obs;

  void touchScreen(){
    focusNode.unfocus();
    crop.value = false;
    update();
  }

  Future<void> sendName(String mName) async{
    if(nickName.value != ''){
      AuthBagicApi api = await _repo5.checkName(mName);
      if(api.status == 200){
        focusNode.unfocus();
        confirm.value = true;
        valiColor.value = true;
        validate.value = '사용 가능한 닉네임입니다.';
        update();

      } else{
        confirm.value = false;
        valiColor.value = false;
        validate.value = api.msg;
        update();

      }
    } else{
      confirm.value = false;
      valiColor.value = false;
      validate.value = '닉네임을 입력해주세요.';
      update();
    }
  }


  var selectedImagePath = ''.obs;


  RxList<CroppedFile?> imagePath = <CroppedFile?>[null,null,null].obs;
  RxBool crop = false.obs;

  RxInt currentCrop = 0.obs;
  List buttonName = ['','사진 보관함', '사진 찍기', '삭제하기'];
  List<IconData> icon = <IconData>[Icons.image, Icons.image_outlined, Icons.camera_alt_outlined, Icons.delete_outline_outlined];
  List<Color> color = <Color>[Style.blackWrite,Style.blackWrite,Style.blackWrite,Colors.redAccent];

  void setCrop(int index){
    currentCrop.value = index;
    update();
  }

  Future<void> cropsRoute() async{
    switch(currentCrop.value){
      case 1:
        if(GetPlatform.isIOS){
          final photos = await _permissionHandlerManager.checkPermission(PermissionHandlerManager.photos);
          if(photos == PermissionHandlerManager.granted || photos == PermissionHandlerManager.limited){
            uploadImage();
          } else {
            _commonWidgets2.customDialogPermission(routerContext: Get.context!, route: 1);
          }
        }else{
          uploadImage();
        }
        break;
      case 2:
        if(GetPlatform.isIOS){
          final camera = await _permissionHandlerManager.checkPermission(PermissionHandlerManager.camera);
          if(camera == PermissionHandlerManager.granted){
            await uploadImageCamera();
          } else {
            _commonWidgets2.customDialogPermission(routerContext: Get.context!, route: 2);
          }
        } else {
          await uploadImageCamera();
        }

        break;
      case 3:
        init();
        break;

    }
  }

  //second
  RxInt currentCrop2 = 0.obs;
  List buttonName2 = ['','저장하기', '사진변경', '취소하기'];
  List icon2 = [Icons.image, Icons.check,Icons.image_outlined, Icons.close];
  List color2 = [Style.blackWrite,Colors.blue,Style.blackWrite,Colors.redAccent];



  void imageCardAction(BuildContext context){
    !crop.value
        ? _commonWidgets.customDialog(
            routerContext: context,
            barrierDismissible: false,
            mainText: '선택한 사진을 변경하시겠어요?',
            cancleText: '취소',
            confirmText: '확인',
            conFirmOnTap: (){
              if(Get.isSnackbarOpen){
                Get.back();
                }
              else{
                init();
                Get.back();
                }
              }
            )
        : null;
  }

  Future<int> getImageFileSize(String imagePath) async {
    File imageFile = File(imagePath);
    int fileSize = await imageFile.length();
    return fileSize;
  }

  double convertBytesToMB(int bytes) {
    double megabytes = bytes / (1024 * 1024);
    return megabytes;
  }

  Future<bool> isImageSizeExceedsLimit(String imagePath) async{
    int fileSize = await getImageFileSize(imagePath);
    return fileSize < 5 * 1024 * 1024;
  }


  Future<void> cropImage(String type) async {
    if (selectedImagePath.value != '') {
      final croppedFiles = await ImageCropper().cropImage(
        sourcePath: selectedImagePath.value,
        compressFormat: ImageCompressFormat.jpg,
        compressQuality: 90,
        uiSettings: [
          AndroidUiSettings(
            cropStyle: CropStyle.circle,
            toolbarTitle: '이미지 업로드',
            toolbarColor: Style.yellow,
            toolbarWidgetColor: Style.brown,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false,
            hideBottomControls: true,
            cropGridColor: Style.yellow,
            cropFrameColor: Style.yellow,
          ),
          IOSUiSettings(
              cropStyle: CropStyle.circle,
              title: '이미지 업로드',
              cancelButtonTitle: '취소',
              doneButtonTitle: '완료'
          ),
        ],
      );
      if (croppedFiles != null) {
        if(await isImageSizeExceedsLimit(croppedFiles.path)){
          imagePath[0] = croppedFiles;
          crop.value = false;
          update();
        } else{
         _commonWidgets.customSnackbar('용량을 초과한 이미지에요!');
        }

      }
    } else{
      _commonWidgets.customSnackbar('수정할 사진을 먼저 선택해주세요!');
    }
  }

  void uploadImage() async{
    await DeviceManager.overLayClients();
    Get.to(()=>Upload(
      router: 'sign',
    ),
        binding: BindingsBuilder(() {
          Get.put(UploadController(
              chatServiceRepository: const RegisterManager().getChatServiceRepository(),
              commonWidgets: _commonWidgets
          ));
        })
    );

  }

  Future<void> uploadImageCamera() async {
    final pickedFile =
    await ImagePicker().pickImage(source: ImageSource.camera, imageQuality: 100, maxWidth: 3000);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
      update();
      await cropImage(pickedFile.path);
    }
  }


  void init(){
    selectedImagePath.value = '';
    crop.value = false;
    imagePath[0] = null;
    update();
  }

  void changePic() {
    crop.value =! crop.value;
    update();
  }

  void exitCrop(){
    crop.value = false;
    update();
  }

  void inputNick(valPh) {
    nickName.value = valPh.trimLeft().trimRight();
    update();

    if(nickName.value.isEmpty){
      validate.value = '';
      valiColor.value = false;
      confirm.value = false;
      update();
    }

    if (nickName.value.length < 2 && nickName.value.isNotEmpty) {

      validate.value = '닉네임이 너무 짧아요.';
      valiColor.value = false;
      confirm.value = false;
      update();
    }

    if (nickName.value.length > 10){

      validate.value = '닉네임이 너무 길어요.';
      valiColor.value = false;
      confirm.value = false;
      update();
    }


    if (!RegExp(r"^[a-zA-Z가-힣0-9 ]*$")
        .hasMatch(valPh)) {
      valiColor.value = false;
      confirm.value = false;
      validate.value = '사용할 수 없는 닉네임입니다.';
      update();
    }

    if((nickName.value.length  >= 2 && nickName.value.length  <= 10) && (RegExp(r"^[a-zA-Z가-힣0-9 ]*$")
        .hasMatch(valPh))) {
      valiColor.value = false;
      confirm.value = false;
      validate.value = '중복체크를 해주세요.';
      update();
    }

  }



  void confirmButton(){
    exitCrop();
    SignView5Controller.to.otherPageProfileUpdate(
        name: nickName.value,
        image: imagePath[0] == null
            ? ''
            : imagePath[0]!.path
    );
    Get.to(()=>SignView4());
  }

  late FocusNode focusNode;

  void _onFocusChanged() {
    if ( focusNode.hasFocus) {
      exitCrop();
    }
  }

  void _controllerClose(){
    focusNode.removeListener(_onFocusChanged);
    focusNode.dispose();
    nicknameController.dispose();

  }

  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
    focusNode = FocusNode();
    focusNode.addListener(_onFocusChanged);
    nicknameController = TextEditingController();
    deviceHeight.value = await DeviceManager.getDeviceHeight();
    update();

  }

  @override
  void onClose() {
    // TODO: implement onClose
    _controllerClose();
    super.onClose();
  }
}