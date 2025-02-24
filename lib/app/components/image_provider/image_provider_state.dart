import 'package:banana_deal_by_monkeycompany/app/components/text_class/text_class.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../css/style.dart';
import '../../routes/const_element.dart';

class ImageProviderState extends StatefulWidget {
  final double imageWidth;
  final double? imageHeight;
  final String imageUrl;
  final String errUrl;
  final String aspectRatio;
  const ImageProviderState({
    required this.imageUrl,
    required this.errUrl,
    required this.imageWidth,
    this.imageHeight,
    required this.aspectRatio,
    Key? key}) : super(key: key);

  @override
  State<ImageProviderState> createState() => _ImageProviderStateState();
}

class _ImageProviderStateState extends State<ImageProviderState> {
  int? getWidth;
  int? getHeight;
  double? widgetHeight;
  double? imageAspectRatio;
  double? widgetAspectRatio;
  BoxFit boxFit = BoxFit.cover;

  @override
  void initState() {
    super.initState();

    // CachedNetworkImageProvider로 이미지 정보 가져오기
    CachedNetworkImageProvider(widget.imageUrl).resolve(const ImageConfiguration())
        .addListener(ImageStreamListener((ImageInfo imageInfo, bool synchronousCall) {
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
    }));
  }

  @override
  Widget build(BuildContext context) {
    Widget errorWidget(){
      return SizedBox(
        width: widget.imageWidth,
        height:  widgetHeight ?? (widget.aspectRatio == AppElement.caseThumb ? widget.imageWidth :  (widget.imageWidth * 9) / 16),
        child: const Center(
          child: CustomTextWidget(text: '해당 이미지를 불러올 수 없습니다.', color: Style.white,),
        ),
      );
    }

    Widget placeHolder(){
      return SizedBox(
        width: widget.imageWidth,
        height:  widgetHeight ?? (widget.aspectRatio == AppElement.caseThumb ? widget.imageWidth :  (widget.imageWidth * 9) / 16),
        child: const Center(
          child: CircularProgressIndicator(
            color: Style.progressBar,
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

class ImageProviderStateChat extends StatefulWidget {
  final String imageNetworkUrl;
  final String errortAssetUrl;
  final double widgetWidth1;
  final double widgetWidth2;
  final BoxFit fit;

  const ImageProviderStateChat({
    Key? key,
    required this.imageNetworkUrl,
    required this.errortAssetUrl,
    required this.widgetWidth1,
    required this.widgetWidth2,
    required this.fit,
  }) : super(key: key);

  @override
  State<ImageProviderStateChat> createState() => _ImageProviderStateChatState();

}

class _ImageProviderStateChatState extends State<ImageProviderStateChat> {
  int? imageWidth;
  int? imageHeight;
  double? width;
  double? height;
  double? aspectRatio;

  @override
  void initState() {
    super.initState();
    final ImageStream stream =  CachedNetworkImageProvider(widget.imageNetworkUrl).resolve(const ImageConfiguration());
    late ImageStreamListener listener;
    listener = ImageStreamListener((ImageInfo imageInfo, bool synchronousCall) {
      if (mounted) {
        setState(() {
          imageWidth = imageInfo.image.width;
          imageHeight = imageInfo.image.height;
          aspectRatio = imageWidth! / imageHeight!;
          width = imageWidth! <= imageHeight!
              ? widget.widgetWidth1
              : widget.widgetWidth2;
          height = width!/aspectRatio!;
        });
      }
      stream.removeListener(listener);
    });
    stream.addListener(listener);

//     // CachedNetworkImageProvider로 이미지 정보 가져오기

  }


  @override
  Widget build(BuildContext context) {

    if (imageWidth != null && imageHeight != null) {
      Widget errorWidget(){
        return _ErrorWidget(
            imageUrl: widget.errortAssetUrl,
            size: widget.widgetWidth1,
            fit: widget.fit
        );
      }


      return CachedNetworkImage(
        imageUrl: widget.imageNetworkUrl,
        imageBuilder: (context, imageProvider) {
          try{
            return Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: widget.fit,
                ),
              ),
            );
          } catch(_){
            return errorWidget();
          }
        },
        placeholder: (context, url) => _LoadingWidget(size: widget.widgetWidth1),
        errorWidget: (context, url, error) => _ErrorWidget(
            imageUrl: widget.errortAssetUrl,
            size: widget.widgetWidth1,
            fit: widget.fit
        ),
      );
    } else {
      return _LoadingWidget(size: widget.widgetWidth1);

    }
  }
}


class _ErrorWidget extends StatelessWidget {
  final String imageUrl;
  final double size;
  final BoxFit fit;
  const _ErrorWidget({
    required this.imageUrl,
    required this.size,
    required this.fit
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imageUrl,
      height: size,
      width: size,
      fit: fit,
    );
  }
}

class _LoadingWidget extends StatelessWidget {
  final double size;
  const _LoadingWidget({
    required this.size,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Style.white,
      height: size,
      width: size,
      child: const Center(
        child: CircularProgressIndicator(
          color: Style.progressBar,
        ),
      ),
    );
  }
}
