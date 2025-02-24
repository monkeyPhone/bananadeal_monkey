import 'package:banana_deal_by_monkeycompany/package/api/upload/model/action/upload_action.dart';
import 'package:banana_deal_by_monkeycompany/package/api/upload/upload_api.dart';
import 'package:banana_deal_by_monkeycompany/package/data/crop_image_vo.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:flutter/material.dart';

class UploadApiImpl extends UploadApi {
  final UploadAction action;

  const UploadApiImpl({
    required this.action,
  });

  @override
  Future<(List<AssetPathEntity>, List<AssetEntity>)> loadPhotos() async =>
    await action.loadPhotos();

  @override
  Future<List<AssetEntity>> loadPhotosChange(AssetPathEntity album) async =>
    await action.loadPhotosChange(album);

  @override
  Future<CropImageVO> cropImage({
    required UploadEnum caseUpload,
    required String selectImagePath,
    BuildContext? context,
  }) => action.cropImage(crop: ImageCropper(), caseUpload: caseUpload, selectImagePath: selectImagePath, context: context);

  @override
  Future<bool> checkLimit(bool isIos) async => action.checkLimit(isIos: isIos);



}