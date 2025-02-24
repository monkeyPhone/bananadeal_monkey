import 'dart:io';
import 'dart:typed_data';
import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/upload/state/bloc/banana_upload_crop/banana_upload_crop_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/upload/state/bloc/banana_upload_set/banana_upload_set_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_manager/photo_manager.dart';


class UploadBodyPreviewSelector extends StatelessWidget {
  const UploadBodyPreviewSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return Container(
      width: size.widthCommon,
      height: size.height05,
      color: greyD3D3D3,
      child: BlocSelector<BananaUploadSetBloc, BananaUploadSetState, AssetEntity?>(
        selector: (state) => state.currentImage,
        builder: (BuildContext context, AssetEntity? photo) =>
        photo == null
            ? const SizedBox()
            : _PhotoWidget(photo: photo,),

      ),
    );
  }

}

class _PhotoWidget extends StatelessWidget {
  final AssetEntity? photo;
  const _PhotoWidget({required this.photo});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BananaUploadCropBloc, BananaUploadCropState>(
      builder: (context, state) =>
      state.canSize == false
          ? _PhotoPreviewWidget(
        photo: photo!,
        size: context.read<VerseConfig>().size.widthCommon.toInt(),
        builder: (data){
          return Image.memory(data, fit: BoxFit.cover,);
        },)
          : Image.file(File(state.croppedFilePath), fit: BoxFit.cover,),

    );
  }
}

class _PhotoPreviewWidget extends StatelessWidget {
  final AssetEntity? photo;
  final int size;
  final Widget Function(Uint8List) builder;
  const _PhotoPreviewWidget({
    required this.photo,
    required this.size,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return switch(photo){
      null => const SizedBox(),
      _ => FutureBuilder(
          future: photo!.thumbnailDataWithSize(ThumbnailSize(size, size)),
          builder: (_,AsyncSnapshot<Uint8List?> snapshot){
            if(snapshot.hasData){
              return  builder(snapshot.data!);
            } else {
              return const SizedBox();
            }
          })
    };
  }
}

