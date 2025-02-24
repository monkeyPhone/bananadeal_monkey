import 'dart:io';
import 'package:banana_deal_by_monkeycompany/package/data/crop_image_vo.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:flutter/material.dart';

class UploadAction {
  const UploadAction();

  Future<(List<AssetPathEntity>, List<AssetEntity>)> loadPhotos() async{
    List<AssetPathEntity> albums = await PhotoManager.getAssetPathList(
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
    List<AssetEntity> photos = [];
    var photoData = await albums.first.getAssetListPaged(page: 0, size: 30);
    photos.addAll(photoData);
    (List<AssetPathEntity>, List<AssetEntity>) result = (albums, photos);
    return result;
  }

  Future<List<AssetEntity>> loadPhotosChange(AssetPathEntity album) async{
    List<AssetEntity> photos = [];
    var photoData = await album.getAssetListPaged(page: 0, size: 30);
    photos.addAll(photoData);
    return photos;
  }


  Future<CropImageVO> cropImage({
    required ImageCropper crop,
    required UploadEnum caseUpload,
    required String selectImagePath,
    BuildContext? context,
  }) async{
    try{
      final croppedFile = await crop.cropImage(
          sourcePath: selectImagePath,
          compressFormat: ImageCompressFormat.png,
          compressQuality: 90,
          uiSettings: context == null
              ? [
            AndroidUiSettings(
              toolbarTitle: '이미지 업로드',
              toolbarColor: yellow,
              toolbarWidgetColor: brown,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false,
              hideBottomControls:  caseUpload == UploadEnum.chat ? false : true,
              cropGridColor: yellow,
              cropFrameColor: yellow,
              cropStyle: caseUpload == UploadEnum.userInfo ||  caseUpload == UploadEnum.thumbnail ? CropStyle.circle : CropStyle.rectangle,
            ),
            IOSUiSettings(
              title: '이미지 업로드',
              cancelButtonTitle: '취소',
              doneButtonTitle: '완료',
              cropStyle: caseUpload == UploadEnum.userInfo ||  caseUpload == UploadEnum.thumbnail ? CropStyle.circle : CropStyle.rectangle,
            ),
          ]
              :
          [
            WebUiSettings(
              translations: const WebTranslations(
                  title: '이미지 업로드',
                  rotateLeftTooltip: "왼쪽으로 90'회전",
                  rotateRightTooltip: "오른쪽으로 90'회전",
                  cancelButton: '취소',
                  cropButton: '완료'
              ),
              context: context,
              presentStyle: WebPresentStyle.dialog,

              //   boundary: const CroppieBoundary(
              //     width: 350,
              //     height:  350,
              //   ),
              //   viewPort:
              //   const CroppieViewPort(width: 250, height: 250, type: 'circle'),
              //   enableExif: true,
              //   enableZoom: true,
              //   showZoomer: true,
            ),
          ]
      );
      if(croppedFile != null){
        (bool, String) result = await _isImageSizeExceedsLimit(croppedFile.path);
        if(result.$1){
          return CropImageVO(isCanUpload: result.$1, imageSize: result.$2, imageUrl: croppedFile.path, msg: '');
        } else {
          return CropImageVO(isCanUpload: result.$1, imageSize: result.$2, imageUrl: '', msg: '업로드 용량을 초과한 이미지입니다.');
        }
      }
      else {
        return const CropImageVO(isCanUpload: false, imageSize: '', imageUrl: '', msg: '');
      }
    }catch(e){
      // MainSingleton.loggerError(route: 'why', error: e.toString());
      return const CropImageVO(isCanUpload: false, imageSize: '', imageUrl: '', msg: '잠시 후, 다시 시도해주세요.');
    }
  }


  Future<bool> checkLimit({
    required bool isIos
  }) async{
    if(isIos){
      final PermissionStatus result;
      result = await Permission.photos.request();
      if(result == PermissionStatus.limited){
        return true;
      } else {
        return false;
      }
    } else{
      return false;
    }
  }

  Future<int> _getImageFileSize(String imagePath) async {
    File imageFile = File(imagePath);
    int fileSize = await imageFile.length();
    return fileSize;
  }

  double _convertBytesToMB(int bytes) {
    double megabytes = bytes / (1024 * 1024);
    return megabytes;
  }

  Future<(bool, String)> _isImageSizeExceedsLimit(String imagePath) async{
    int fileSize;
    switch(kIsWeb){
      case true:
        final Dio dio = Dio();
        var response = await dio.get(imagePath);
        final bytes = response.headers["content-length"]!.first;
        fileSize = int.parse(bytes.toString());
        dio.close();
      case false:
        fileSize = await _getImageFileSize(imagePath);
    }
    double fileSizeInMB = _convertBytesToMB(fileSize);
    String result = fileSizeInMB.toStringAsFixed(2);
    return (fileSize < 5 * 1024 * 1024, result);
  }


}