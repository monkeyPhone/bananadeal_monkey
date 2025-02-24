import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

import '../../../../../../css/size.dart';
import '../../../../../../css/style.dart';


class PhotoWidget extends StatelessWidget {
  final AssetEntity asset;
  final int size;
  final Widget Function(Uint8List) builder;
  const PhotoWidget(
      {
        required this.asset,
        required this.size,
        required this.builder,
        Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: asset.thumbnailDataWithSize(ThumbnailSize(size, size)), builder: (_,AsyncSnapshot<Uint8List?> snapshot){
      if(snapshot.hasData){
        return builder(snapshot.data!);
      } else {
        return Container();
      }
    });
  }
}

class PhotoPreviewWidget extends StatelessWidget{
  final AssetEntity asset;
  final int size;
  final Widget Function(Uint8List) builder;
  const PhotoPreviewWidget(
      {
        required this.asset,
        required this.size,
        required this.builder,
        Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: asset.thumbnailDataWithSize(ThumbnailSize(size, size)), builder: (_,AsyncSnapshot<Uint8List?> snapshot){
      if(snapshot.hasData){
        if(asset.width < 4096 && asset.height < 4096){
          return builder(snapshot.data!);
        } else{
          return Stack(
            children: [
              Positioned.fill(child:
              builder(snapshot.data!),),
              Positioned.fill(
                  child: Container(
                    color: Colors.white70,
                    padding: EdgeInsets.all(WidgetSize(context).sizedBox16),
                    child:  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.sick_outlined, size: WidgetSize(context).sizedBox48, color: Style.red,),
                            SizedBox(
                              width: WidgetSize(context).sizedBox16,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('NO IMAGE',
                                  style: TextStyle(
                                      color: Style.red,
                                      fontWeight: FontWeight.w700,
                                      fontSize: WidgetSize(context).sizedBox22
                                  ),
                                ),
                                Text('AVAILABLE',
                                  style: TextStyle(
                                      color: Style.red,
                                      fontWeight: FontWeight.w700,
                                      fontSize: WidgetSize(context).sizedBox22
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        SizedBox(
                          height: WidgetSize(context).sizedBox16,
                        ),
                        Text('해당 이미지는 편집에 허용된',
                          style: TextStyle(
                              color: Style.blackWrite,
                              fontWeight: FontWeight.w700,
                              fontSize: WidgetSize(context).sizedBox20
                          ),
                        ),
                        Text('최대 사이즈를 초과했습니다.',
                          style: TextStyle(
                              color: Style.blackWrite,
                              fontWeight: FontWeight.w700,
                              fontSize: WidgetSize(context).sizedBox20
                          ),
                        ),
                        SizedBox(
                          height: WidgetSize(context).sizedBox16,
                        ),
                        Text('허용 사이즈 : 4096 x 4096',
                          style: TextStyle(
                              color: Style.blackWrite,
                              fontWeight: FontWeight.w400,
                              fontSize: WidgetSize(context).sizedBox14
                          ),
                        ),
                        Text('선택 이미지 : ${asset.width} x ${asset.height}',
                          style: TextStyle(
                              color: Style.blackWrite,
                              fontWeight: FontWeight.w400,
                              fontSize: WidgetSize(context).sizedBox14
                          ),
                        )
                      ],
                    ),
                  )
              )
            ],
          );
        }
      } else {
        return Container();
      }
    });
  }
}
