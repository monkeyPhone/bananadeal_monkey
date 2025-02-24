import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/method/api/model/data/canvas_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_image.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/canvas/bd_canvas.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/image/bd_image_binder_calculate_many.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_layout_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class BannerImageView extends StatefulWidget {
  final String imageUrl;
  const BannerImageView({super.key,
    required this.imageUrl
  });

  @override
  State<BannerImageView> createState() => _BannerImageViewState();
}

class _BannerImageViewState extends State<BannerImageView> {
  late final ScrollController _scrollController;
  late final TransformationController _transformationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();
    _transformationController = TransformationController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
    _transformationController.dispose();
  }

  void _resetTransformation() {
    _transformationController.value = Matrix4.identity();
  }

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return BdCanvas(
      canvasEnum: CanvasEnum.basic,
      appbar: ('', null, null, null),
      body: _ImageArea(
        size: size,
        imageUrl: widget.imageUrl,
        transformationController: _transformationController,
        scrollController: _scrollController,
      ),
      onDoubleTap: (){
        _resetTransformation();
      },
    );
  }
}


class _ImageArea extends StatelessWidget {
  final String imageUrl;
  final CommonSize size;
  final TransformationController transformationController;
  final ScrollController scrollController;
  const _ImageArea({
    required this.imageUrl,
    required this.size,
    required this.transformationController,
    required this.scrollController
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      physics: const ClampingScrollPhysics(),
      child: BdLayoutPadding(
        padding: PaddingEnum.horizontal8,
        child: Center(
          child: InteractiveViewer(
              transformationController: transformationController,
              maxScale: 3.0,
              minScale: 1.0,
              child: BdImageBinderCalculateMany(
                  imageUrl: '${context.read<VerseConfig>().url.imageBananaUrl}$imageUrl',
                  imageWidth: size.widthCommon,
                  errUrl: defaultNotice,  aspectRatio: 'notice'
              )
          ),
        ),
      ),
    );
  }
}