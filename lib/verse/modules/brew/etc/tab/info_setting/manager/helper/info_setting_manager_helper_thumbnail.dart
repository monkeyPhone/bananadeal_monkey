import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/api/upload/model/action/upload_action.dart';
import 'package:banana_deal_by_monkeycompany/package/data/widget/bottom_sheet_vo.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/etc/tab/info_setting/state/bloc/banana_info_thumbnail/banana_info_thumbnail_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/route/state/cubit/banana_route/banana_route_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class InfoSettingManagerHelperThumbnail {
  final UploadAction _action;
  const InfoSettingManagerHelperThumbnail({
    required UploadAction action
  }) : _action = action;

  void initThumbNail(BuildContext context) => context.read<BananaInfoThumbnailBloc>().add(const InitThumbNail());
  void fetchThumbNailUrl(BuildContext context) => context.read<BananaInfoThumbnailBloc>().add(FetchThumbNailUrl(
      mPathImg: context.read<BananaRouteCubit>().state.userVO.mPathImg,
      mEmail: context.read<BananaRouteCubit>().state.userVO.mEmail
  ));

  void updateThumbnail({
    required BuildContext context,
    required String url
  }) => context.read<BananaInfoThumbnailBloc>().add(UpdateThumbNailUrl(url: url));

  void gotoUploadView(BuildContext context) =>
      context.read<VerseConfig>().tab.gotoUploadView(
          isIntro: true,
          context: context, caseUpload: UploadEnum.thumbnail,
          callBack: (String thumbNail){
            updateThumbnail(
                context: context,
                url: thumbNail
            );
          }
      );

  void takePicture(BuildContext context) =>
      switch(kIsWeb){
        false => _getCropCamera(context),
        true => context.read<VerseConfig>().browser.snackBar.showSnackBar(text: '웹에서는 이용할 수 없는 기능입니다.', context: context)
      };

  Future<XFile?> _getCamera() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    return image;
  }

  void _getCropCamera(BuildContext context) {
    _getCamera().then((res)async{
      if(res != null){
        _action.cropImage(caseUpload: UploadEnum.userInfo, selectImagePath: res.path, crop: ImageCropper()).then(
                (image) {
              if(context.mounted){
                if(image.isCanUpload){
                  updateThumbnail(context: context, url: image.imageUrl);
                } else{
                  if(image.msg != ''){
                    context.read<VerseConfig>().browser.snackBar.showSnackBar(text: image.msg, context: context);
                  }
                }
              }
            }
        );
      }
    }
    );

  }

  void showNetworkSheet(BuildContext context){
    final BottomSheetVO gallery = BottomSheetVO(
        buttonName: '갤러리에서 업로드',
        onTap:   (){
          context.read<VerseConfig>().route.closeDialog(context);
          gotoUploadView(context);
        }
    );

    final BottomSheetVO camera = BottomSheetVO(
        buttonName: '카메라에서 바로 찍기',
        onTap: (){
          context.read<VerseConfig>().route.closeDialog(context);
          takePicture(context);
        }
    );

    final BottomSheetVO delete = BottomSheetVO(
        buttonName: '삭제하기',
        onTap: (){
          context.read<VerseConfig>().route.closeDialog(context);
          updateThumbnail(context: context, url: 'delete');
        }
    );

    context.read<VerseConfig>().browser.sheet.showSheet(
        routerContext: context,
        sheetList:
        [
          gallery, camera, delete
        ]

    );
  }

}