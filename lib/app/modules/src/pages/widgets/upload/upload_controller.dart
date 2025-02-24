import 'dart:async';
import 'dart:io';
import 'package:banana_deal_by_monkeycompany/app/models/chat_image_info.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/chat/controllers/chat_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/upload/upload_dialog.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_manager/photo_manager.dart';
import '../../../../../components/common_widgets.dart';
import '../../../../../css/style.dart';
import '../../../../../routes/const_element.dart';
import '../../../../sign/controllers/sign_view_3_controller.dart';
import '../../etc/controllers/etc_my_info_setting_controller.dart';
import '../../etc/controllers/etc_review_setting_controller.dart';
import '../../etc/views/components/etc_inquiry/inquiry_send/inquiry_send_controller.dart';
import '../../store/pages/store_detail/controllers/store_detail_controller.dart';
import '../service/service_moduels/controllers/chat_declaration_controller.dart';
import '../service/service_moduels/controllers/chat_log_controller.dart';
import '../../../../../repository/chat/chat_service_repository.dart';



// routecase == 0 카메라 이미지 routecase == 1 갤러리 이미지
class UploadController extends GetxController {
  static UploadController get to => Get.find();

  final ChatServiceRepository _chatServiceRepository;
  final CommonWidgets _commonWidgets;

  UploadController({
    required ChatServiceRepository chatServiceRepository,
    required CommonWidgets commonWidgets,
  }) : _chatServiceRepository = chatServiceRepository,
       _commonWidgets = commonWidgets;


  RxBool getLoading = false.obs;
  RxBool nextPage = true.obs;
  RxInt currentPage = 0.obs;
  Rx<AssetPathEntity> currentAlbums = AssetPathEntity(id: '', name: '').obs;

  RxString uploadRoute = ''.obs;

  RxString permissionState = ''.obs;

  RxString uploaded = ''.obs;

  // RxInt imageWidth = 0.obs;
  // RxInt imageHeight = 0.obs;


  RxString sizeError = ''.obs;
  RxString sendImagePath = ''.obs;
  late final ScrollController scrollController;
  late final ScrollController preViewController;
  late final ScrollController noController;
  RxBool canUpload = false.obs;
  RxString imageSize = ''.obs;

  RxList<AssetPathEntity> albums = <AssetPathEntity>[].obs;
  RxList<AssetEntity> imageList = <AssetEntity>[].obs;
  RxString headerTitle = ''.obs;

  Rx<AssetEntity> selectedImage = AssetEntity(
    id: '0',
    typeInt: 0,
    width: 0,
    height: 0,
  ).obs;
  RxString selectedImagePath = ''.obs;
  Rx<CroppedFile?> cropFile = CroppedFile('').obs;
  RxString croppedFilePath = ''.obs;

  Future<void> selectedBox(int index) async{
    imageList[index] == selectedImage.value
        ?
    initImage()
        :
    await changeSelectedImage(imageList[index]);
    update();
  }


  Future<void> getLimitedImage() async{
    await PhotoManager.presentLimited();
    await loadPhotos();
  }


  Future<void> cropImage(String type, BuildContext context) async {
    if(sizeError.value == ''){

    }else{
      if (selectedImagePath.value != '') {
        final croppedFile = await ImageCropper().cropImage(
          sourcePath: selectedImagePath.value,
          compressFormat: ImageCompressFormat.jpg,
          compressQuality: 90,
          uiSettings: [
            AndroidUiSettings(
                toolbarTitle: '이미지 업로드',
                toolbarColor: Style.yellow,
                toolbarWidgetColor: Style.brown,
                initAspectRatio: CropAspectRatioPreset.original,
                lockAspectRatio: false,
                hideBottomControls:  type == 'chat' ? false : true,
                cropGridColor: Style.yellow,
                cropFrameColor: Style.yellow,
              cropStyle: type == 'profile' ? CropStyle.circle : CropStyle.rectangle,
            ),
            IOSUiSettings(
                title: '이미지 업로드',
                cancelButtonTitle: '취소',
                doneButtonTitle: '완료',
              cropStyle: type == 'profile' ? CropStyle.circle : CropStyle.rectangle,
            ),
          ],
        );
        if (croppedFile != null) {
          await isImageSizeExceedsLimit(croppedFile.path);
          if(canUpload.value){
            cropFile.value = croppedFile;
            croppedFilePath.value = croppedFile.path;
            uploadRouterCase(cropFile.value, context);
          } else{
            _commonWidgets.customSnackbar('업로드 용량을 초과한 이미지에요!');
          }

        }
      } else{
        _commonWidgets.customSnackbar('수정할 사진을 먼저 선택해주세요!');
      }
    }
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
    double fileSizeInMB = convertBytesToMB(fileSize);
    imageSize.value = fileSizeInMB.toStringAsFixed(2);
    return canUpload.value = fileSize < 5 * 1024 * 1024;
  }


  void openDialog({required Widget image, required BuildContext context})
  {
    UploadDialog().openDialog(image: image, context: context);
  }

  void _noImageDialog(){
    _commonWidgets.customDialogButton1(
        routerContext: Get.context!,
        onTap: (){
      Get.back();
      Get.back();
    }, mainText: "저장된 이미지가 없습니다!", buttonText: "확인");
  }

  Future<void> loadPhotos() async {
    //PermissionState result = await PhotoManager.requestPermissionExtend();
    final PermissionStatus result;
    if(GetPlatform.isAndroid){
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      final int androidVersion = androidInfo.version.sdkInt;
      if(androidVersion  >= 33){
        result = await Permission.photos.request();
      }
      else {
       result = await Permission.storage.request();
      }
    } else {
     result = await Permission.photos.request();
    }
    if (result == PermissionStatus.granted) {
      albums.value = await PhotoManager.getAssetPathList(
        type: RequestType.image,
        filterOption: FilterOptionGroup(
          imageOption: const FilterOption(
            sizeConstraint: SizeConstraint(minHeight: 100, minWidth: 100),
          ),
          orders: [
            const OrderOption(type: OrderOptionType.createDate, asc: false),
          ],
        ),
      );
      await _loadData();
      if(albums.isEmpty)
      {
        _noImageDialog();
      }
      else if (imageList.isEmpty){
        _noImageDialog();
      }
    } else {
        if(result == PermissionStatus.limited)
        {
          permissionState.value = 'limited';

          albums.value = await PhotoManager.getAssetPathList(
            type: RequestType.image,
            filterOption: FilterOptionGroup(
              imageOption: const FilterOption(
                sizeConstraint: SizeConstraint(minHeight: 100, minWidth: 100),
              ),
              orders: [
                const OrderOption(type: OrderOptionType.createDate, asc: false),
              ],
            ),
          );
          await _loadData();
        }// message 권한 요청
        else{
          final int _androidSdkVersion;
          if(GetPlatform.isAndroid){
            DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
            AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
            _androidSdkVersion = androidInfo.version.sdkInt;

          } else {
            _androidSdkVersion = 0;
          }
          Get.back();
        }
      }

  }

  Future<void> _loadData() async {
    await changeAlbum(albums.first);
    currentAlbums.value = albums.first;
    // update();
  }

  Future<void> _pagingPhotos(AssetPathEntity album) async {
    var photos = await album.getAssetListPaged(page: 0, size: 30);
    imageList.addAll(photos);
    initImage();
  }


  void getLoadingTrue() async{
    getLoading.value = true;
    update();
  }

  Future<void> getLoadingFalse() async{
    await Future.delayed(Duration(milliseconds: 800));
    getLoading.value = false;
    update();
  }



  Future<void> _loadMorePhotos() async {
     getLoadingTrue();
    try{
      final List<AssetEntity> entities = await currentAlbums.value.getAssetListPaged(
        page: currentPage.value,
        size: 30,
      );
      if(entities.isEmpty){
        nextPage.value = false;
      } else{
        imageList.addAll(entities);
        initImage();

      }
    } catch(e){
      nextPage.value = false;
      currentPage.value = 0;

    }
     await getLoadingFalse();
  }




  initImage(){
    selectedImage(AssetEntity(
      id: '0',
      typeInt: 0,
      width: 0,
      height: 0,
    ));
    sizeError.value = '';
    selectedImagePath.value = '';
    croppedFilePath.value = '';
    pickedFilePath.value = '';
    imageSize.value = '';
    canUpload.value = false;
  }

  initCrop(){
    croppedFilePath.value = '';
    pickedFilePath.value = '';
    imageSize.value = '';
    canUpload.value = false;
  }

  Future<void> changeSelectedImage(AssetEntity image) async{

    selectedImage.value = image;
    await getFilePath(image);

    update();
    // update();
  }


  Future<void> getFilePath(AssetEntity image) async{
    var file = await selectedImage.value.file;
    var path = file!.path;
    selectedImagePath.value = path;
    if(image.height < 4096 && image.width < 4096)
    {
      sizeError.value = AppElement.goodImage;
    }
    else{
      sizeError.value = '';
    }
  }


  void initAlbums(){
    currentAlbums.value = AssetPathEntity(id: '', name: '');
  }


  Future<void> changeAlbum(AssetPathEntity album) async {
    headerTitle(album.name);
    imageList.clear();
    currentPage.value = 0;
    nextPage.value = true;
    await _pagingPhotos(album);
  }



  // Future<bool> getImageSize() async{
  //   if(croppedFilePath.value != ''){
  //     ByteData bytes = await rootBundle.load(croppedFilePath.value);
  //
  //   }else{
  //     if(selectedImagePath.value != ''){
  //
  //     }else{
  //       return false;
  //     }
  //   }
  // }


  Future<String> uploadImage(BuildContext context) async {

     if(croppedFilePath.value == '')
     {
       _commonWidgets.customSnackbar('선택된 이미지가 없어요.');
       return '';
     }
     else{
       uploaded.value = '진행 중';
       AuthBagicApiChat messeage = await _chatServiceRepository.sendImage(
         //cri 삭제해야될 수도 잇음
          cri: '${ChatLogController.to.roomInfo.value.crIdx}',
           mPathImageEdit: croppedFilePath.value
       );
       if(messeage.status == 200){
         Get.back();
         return chatImageInfoToJson(messeage.result.first);
       } else{
         initImage();
         messeage.status != 503 ? _commonWidgets.customSnackbar('이미지 업로드에 실패했어요.') : null;
         return  '';
       }
     }

  }

  void inputImage(){
    SignView3Controller.to.imagePath[0] = cropFile.value;
    SignView3Controller.to.crop.value = false;
    Get.back();
  }

  void unfocusKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  RxString pickedFilePath = ''.obs;


  void endUpload(){
    uploaded.value = '성공';
  }

  void uploadRouterCase(CroppedFile? crops, BuildContext context) async{
    if(uploadRoute.value.contains('inquiry')){
      uploaded.value = '진행 중';
      if(uploadRoute.value.contains('0')){
        InquirySendController.to.updateImage(index: 0, cropFile: crops);
        endUpload();
      }
      if(uploadRoute.value.contains('1')){
        InquirySendController.to.updateImage(index: 1, cropFile: crops);
        endUpload();

      }
      if(uploadRoute.value.contains('2')){
        InquirySendController.to.updateImage(index: 2, cropFile: crops);
        endUpload();
      }
    }
    else if(uploadRoute.value.contains('review')){
      uploaded.value = '진행 중';
      if(uploadRoute.value.contains('0')){
        EtcReviewSettingController.to.inputImage(index: 0, crop: crops);
        endUpload();
      }
      if(uploadRoute.value.contains('1')){
        EtcReviewSettingController.to.inputImage(index: 1, crop: crops);
        endUpload();
      }
      if(uploadRoute.value.contains('2')){
        EtcReviewSettingController.to.inputImage(index: 2, crop: crops);
        endUpload();
      }
    }
    else if(uploadRoute.value.contains('declaration')){
      uploaded.value = '진행 중';
      if(uploadRoute.contains('0')){
        StoreDetailController.to.imagePath[0] = crops;
        endUpload();
      }
      if(uploadRoute.value.contains('1')){
        StoreDetailController.to.imagePath[1] = crops;
        endUpload();
      }
      if(uploadRoute.value.contains('2')){
        StoreDetailController.to.imagePath[2] = crops;
        endUpload();
      }
    }
    else if(uploadRoute.value.contains('decChat')){
      uploaded.value = '진행 중';
      if(uploadRoute.value.contains('0')){
        ChatDeclarationController.to.imagePath[0] = crops;
        endUpload();
      }
      if(uploadRoute.value.contains('1')){
        ChatDeclarationController.to.imagePath[1] = crops;
        endUpload();
      }
      if(uploadRoute.value.contains('2')){
        ChatDeclarationController.to.imagePath[2] = crops;
        endUpload();
      }
    }
    else if(uploadRoute.value == 'chat'){
        await ChatLogController.to.inputImage(await uploadImage(context));
    }
    else if(uploadRoute.value == 'sign'){
       inputImage();
    }
    else if(uploadRoute.value == 'etc'){
      uploaded.value = '진행 중';
      uploaded.value = await EtcMyInfoSettingController.to.changeImage(croppedFilePath.value);
    }
  }

  void _controllerClose(){
    scrollController.dispose();
  }

  @override
  void onInit() async{
    super.onInit();
    scrollController = ScrollController();
    preViewController = ScrollController();
    noController = ScrollController();
    await loadPhotos();
    scrollController.addListener((){
      if(scrollController.position.maxScrollExtent == scrollController.position.pixels)
      {
        if(nextPage.value){
          currentPage.value = currentPage.value+1;
        }

      }
    });
  }


  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    debounce(uploaded, (_){
        if(uploaded.value == '성공'){
          Get.back();
        }
      }
    );
    debounce(currentPage, (_) async{
      if(currentPage.value != 0 ){
        await _loadMorePhotos();
      }
    }
    );

  }

  @override
  void onClose() {
    // TODO: implement onClose

    super.onClose();
    _controllerClose();

  }

}