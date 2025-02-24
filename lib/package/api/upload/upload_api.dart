import 'package:banana_deal_by_monkeycompany/package/data/crop_image_vo.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:flutter/material.dart';

abstract class UploadApi {
  const UploadApi();

  Future<(List<AssetPathEntity>, List<AssetEntity>)> loadPhotos();

  Future<List<AssetEntity>> loadPhotosChange(AssetPathEntity album);

  Future<CropImageVO> cropImage({
    required UploadEnum caseUpload,
    required String selectImagePath,
    BuildContext? context,
  });

  Future<bool> checkLimit(bool isIos);



}