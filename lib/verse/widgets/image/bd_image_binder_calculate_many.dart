import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_label.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_string.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/text/bd_text_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


class BdImageBinderCalculateMany extends StatefulWidget {
  final double imageWidth;
  final double? imageHeight;
  final String imageUrl;
  final String errUrl;
  final String aspectRatio;
  const BdImageBinderCalculateMany({super.key,
    required this.imageUrl,
    required this.errUrl,
    required this.imageWidth,
    this.imageHeight,
    required this.aspectRatio,
  });

  @override
  State<BdImageBinderCalculateMany> createState() => _BdImageBinderCalculateManyState();
}

class _BdImageBinderCalculateManyState extends State<BdImageBinderCalculateMany> {
  late final ImageStream _stream;
  late ImageStreamListener _listener;

  int? getWidth;
  int? getHeight;
  double? widgetHeight;
  double? imageAspectRatio;
  double? widgetAspectRatio;
  BoxFit boxFit = BoxFit.cover;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _stream =  CachedNetworkImageProvider(widget.imageUrl).resolve(const ImageConfiguration());
    _listener = ImageStreamListener((ImageInfo imageInfo, bool synchronousCall) {
      if(mounted){
        setState(() {

          switch(widget.aspectRatio) {
            case 'dialog':
              if (widget.imageHeight != null) {
                getWidth = imageInfo.image.width;
                getHeight = imageInfo.image.height;
                imageAspectRatio = getWidth! / getHeight!;
                widgetAspectRatio = widget.imageWidth / widget.imageHeight!;
                widgetHeight = widget.imageHeight!;

                if (imageAspectRatio! > widgetAspectRatio!) {
                  double ratio = getHeight! / widget.imageHeight!;
                  double scaledWidth = getWidth! / ratio;
                  if (scaledWidth <= widget.imageWidth) {
                    boxFit = BoxFit.fitHeight;
                  } else {
                    boxFit = BoxFit.fitWidth;
                  }
                } else if (imageAspectRatio! < 1.0) {
                  boxFit = BoxFit.fitHeight;
                } else {
                  boxFit = BoxFit.fitWidth;
                }
              } else {

                boxFit = BoxFit.fitWidth;
              }
              break;
            case 'notice':
              getWidth = imageInfo.image.width;
              getHeight = imageInfo.image.height;
              imageAspectRatio = getWidth! / getHeight!;
              widgetHeight = widget.imageWidth / imageAspectRatio!;
              boxFit = BoxFit.fill;
              break;
            case 'noticeDialog':
              getWidth = imageInfo.image.width;
              getHeight = imageInfo.image.height;
              widgetHeight = widget.imageWidth;
              boxFit = BoxFit.cover;
              break;
            case 'free':
              getWidth = imageInfo.image.width;
              getHeight = imageInfo.image.height;
              widgetHeight = (getHeight!/getWidth!)*widget.imageWidth;
              boxFit = BoxFit.contain; // 원본 비율에 맞추어 크기 조절
              break;
            case 'carousel':
              getWidth = imageInfo.image.width;
              getHeight = imageInfo.image.height;
              if(getWidth! > getHeight!)
              {
                if(getWidth! / getHeight! > 1.7){
                  boxFit = BoxFit.fitWidth;
                } else {
                  boxFit = BoxFit.fitHeight;
                }

              }
              else if(getWidth! < getHeight!)
              {
                if((getHeight! / getWidth! > 1.7))
                {
                  boxFit = BoxFit.fitHeight;
                } else {
                  boxFit = BoxFit.fitWidth;
                }
              }
              else{
                boxFit = BoxFit.fitHeight;
              }
              break;
            default:
              getWidth = imageInfo.image.width;
              getHeight = imageInfo.image.height;
              if(getWidth! > getHeight!)
              {
                boxFit = BoxFit.fitWidth;
              }
              else if(getWidth! < getHeight!)
              {
                boxFit = BoxFit.fitHeight;
              }
              else{
                boxFit = BoxFit.fill;
              }

              // imageAspectRatio = getWidth! / getHeight!;
              // widgetHeight = widget.imageWidth / imageAspectRatio!;

              break;
          }
        });
      }
      _stream.removeListener(_listener);
    });
    _stream.addListener(_listener);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    try{
      _stream.removeListener(_listener);
    } catch(_){

    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    Widget errorWidget(){
      return SizedBox(
        width: widget.imageWidth,
        height:  widgetHeight ?? (widget.aspectRatio == caseThumb ? widget.imageWidth :  (widget.imageWidth * 9) / 16),
        child: const Center(
          child: BdTextWidget(text: '해당 이미지를 불러올 수 없습니다.',textStyle: bodyWhite,),
        ),
      );
    }

    Widget placeHolder(){
      return SizedBox(
        width: widget.imageWidth,
        height:  widgetHeight ?? (widget.aspectRatio == caseThumb ? widget.imageWidth :  (widget.imageWidth * 9) / 16),
        child: const Center(
          child: CircularProgressIndicator(
            color: progressBar,
          ),
        ),
      );
    }

    return CachedNetworkImage(
      width: widget.imageWidth,
      height: widgetHeight,
      imageUrl: widget.imageUrl,
      imageBuilder: (context, imageProvider) {
        return Container(
          width: widget.imageWidth,
          height: widgetHeight,
          decoration: BoxDecoration(
            color: Colors.transparent,
            image: DecorationImage(
              image: imageProvider,
              fit: boxFit,
            ),
          ),
        );

      },
      placeholder: (context, url) => placeHolder(),
      errorWidget: (context, url, error) => errorWidget(),
    );
  }
}
