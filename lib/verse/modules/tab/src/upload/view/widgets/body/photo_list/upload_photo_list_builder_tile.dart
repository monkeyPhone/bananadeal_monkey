import 'dart:typed_data';
import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/upload/manager/upload_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/upload/state/bloc/banana_upload_set/banana_upload_set_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_manager/photo_manager.dart';

class UploadPhotoListBuilderTile extends StatelessWidget {
  final AssetEntity asset;
  final CommonSize size;
  const UploadPhotoListBuilderTile({super.key,
    required this.asset,
    required this.size
  });

  @override
  Widget build(BuildContext context) {
    return _PhotoWidget(
        photo: asset,
        size: size.sizedBox181.toInt(),
        builder: (data) {
          return BlocSelector<BananaUploadSetBloc, BananaUploadSetState, AssetEntity?>(
              selector: (state) => state.currentImage,
              builder: (context, photo) =>
                  GestureDetector(
                      onTap: () {
                        if(photo == null){
                          context.read<UploadManager>().selectImage(photo: asset, context: context);
                        } else {
                          if(asset == photo){
                            context.read<UploadManager>().selectImage(context: context);
                          } else {
                            context.read<UploadManager>().selectImage(photo: asset, context: context);
                          }
                        }
                      },
                      child: Opacity(
                        opacity: photo == null ? 1 : asset == photo ? 0.4 : 1,
                        child: Image.memory(
                          data,
                          fit: BoxFit.cover,
                        ),
                      )
                  )
          );
        }
    );
  }
}


class _PhotoWidget extends StatelessWidget {
  final AssetEntity? photo;
  final int size;
  final Widget Function(Uint8List) builder;
  const _PhotoWidget({
    required this.photo,
    required this.size,
    required this.builder,});

  @override
  Widget build(BuildContext context) {
    try{
      return switch(photo){
        null => const SizedBox(),
        _ => FutureBuilder(future: photo!.thumbnailDataWithSize(ThumbnailSize(size, size)), builder: (_,AsyncSnapshot<Uint8List?> snapshot){
          if(snapshot.hasData){
            return builder(snapshot.data!);
          } else {
            return const SizedBox();
          }
        })
      };
    } catch(_){
      return const SizedBox();
    }
  }
}
