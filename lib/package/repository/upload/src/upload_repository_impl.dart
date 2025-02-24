import 'package:banana_deal_by_monkeycompany/package/api/upload/upload_api.dart';
import 'package:banana_deal_by_monkeycompany/package/data/crop_image_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/upload/upload_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:photo_manager/photo_manager.dart';

class UploadRepositoryImpl implements UploadRepository {
  final UploadApi api;
  final bool isIos;
  const UploadRepositoryImpl({
    required this.api,
    required this.isIos,
  });

  @override
  Stream<(List<AssetPathEntity>, List<AssetEntity>)> streamLoadPhotos()
    => Stream.fromFuture(api.loadPhotos());
  
  @override
  Stream<List<AssetEntity>> streamLoadPhotosChange(AssetPathEntity album) =>
    Stream.fromFuture(api.loadPhotosChange(album));
  
  @override
  Stream<CropImageVO> streamCropImage({
    required UploadEnum caseUpload,
    required String selectImagePath,
  }) => Stream.fromFuture(api.cropImage(caseUpload: caseUpload, selectImagePath: selectImagePath));

  @override
  Future<bool> checkLimit() async => await api.checkLimit(isIos);

  @override
  Future<(List<AssetEntity>, bool)> morePhoto({
    required AssetPathEntity album,
    required int currentPage
  }) async{
    final List<AssetEntity> entities = await album.getAssetListPaged(page: currentPage, size: 30);
    return (entities, entities.isNotEmpty);
  }


}