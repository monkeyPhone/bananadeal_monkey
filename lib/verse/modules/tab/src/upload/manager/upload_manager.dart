import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/upload/src/upload_repository_impl.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/upload/state/bloc/banana_upload/banana_upload_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/upload/state/bloc/banana_upload_crop/banana_upload_crop_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/upload/state/bloc/banana_upload_set/banana_upload_set_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_manager/photo_manager.dart';

class UploadManager {
  final UploadEnum caseUpload;
  final void Function(String thumbNail) callBack;
  const UploadManager({
    required this.caseUpload,
    required this.callBack,
  });


  void selectImage({
    required BuildContext context,
    AssetEntity? photo,
  }) => context.read<BananaUploadSetBloc>().add(BananaUploadSetSelectImage(photo));

  void selectAlbum({
    required BuildContext context,
    required AssetPathEntity album,
  }) => context.read<BananaUploadBloc>().add(BananaUploadSelectAlbum(album: album,));

  void cropImage({
    required BuildContext context,
    required String currentImagePath,
  }) => context.read<BananaUploadCropBloc>().add(BananaUploadCropCropImage(caseUpload: caseUpload, currentImagePath: currentImagePath));

  void cropInit(BuildContext context,) =>
      context.read<BananaUploadCropBloc>().add(const BananaUploadCropCropInit());


  Future<void> morePhoto({
    required BuildContext context,
    required AssetPathEntity album,
    required int currentPage
  }) async {
    (List<AssetEntity>, bool) result =  await context.read<UploadRepositoryImpl>().morePhoto(album: album, currentPage: currentPage);
    if(result.$2){
      if(context.mounted){
        morePhotoResult(context: context, entities: result.$1);
      }
    }
  }

  void morePhotoResult({
    required BuildContext context,
    required List<AssetEntity> entities
  }) =>
      context.read<BananaUploadBloc>().add(BananaUploadFetchMoreImageList(album: entities));

  void showSnackBar({
    required BuildContext context,
    required String text,
  }) => context.read<VerseConfig>().browser.snackBar.showSnackBar(text: text, context: context);

  void removeSnack(BuildContext context) => context.read<VerseConfig>().browser.snackBar.removeSnack(context);

  void crackPhoto(BuildContext context) {
    PhotoManager.presentLimited().then((value) =>
        context.mounted ? context.read<BananaUploadBloc>().add(const BananaUploadCrackImage()) : null
    );

  }

}