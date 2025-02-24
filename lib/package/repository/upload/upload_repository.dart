import 'package:banana_deal_by_monkeycompany/package/data/crop_image_vo.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:photo_manager/photo_manager.dart';

abstract class UploadRepository {
  const UploadRepository();

  Stream<(List<AssetPathEntity>, List<AssetEntity>)> streamLoadPhotos();
  Stream<List<AssetEntity>> streamLoadPhotosChange(AssetPathEntity album);
  Stream<CropImageVO> streamCropImage({
    required UploadEnum caseUpload,
    required String selectImagePath,
  });
  Future<bool> checkLimit();

  Future<(List<AssetEntity>, bool)> morePhoto({
    required AssetPathEntity album,
    required int currentPage
  });


}