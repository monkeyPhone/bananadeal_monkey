import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/data/home_banner_vo.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/method/api/model/data/canvas_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/bd_ripple_button_stack.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/canvas/bd_canvas.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/image/bd_image_binder_calculate.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_custom_pad.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_layout_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BannerNoticeView extends StatelessWidget {
  final HomeBannerVO bannerVO;
  const BannerNoticeView({super.key,
    required this.bannerVO
  });

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return BdCanvas(
      canvasEnum: CanvasEnum.basic,
      appbar: (bannerVO.bmTitle, TextStyle(
        color: Colors.black,
        fontSize: size.titleMain,
        fontWeight: FontWeight.w500,
      ), null, null),
      body: _BodyScroll(bannerVO: bannerVO,),
      navNullAble: true,
    );
  }
}


class _BodyScroll extends StatelessWidget {
  final HomeBannerVO bannerVO;
  const _BodyScroll({
    required this.bannerVO,
  });

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Column(
        children: [
          BdLayoutPadding(
            padding: PaddingEnum.lrb16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  context.read<VerseConfig>().function.formatDateKO(bannerVO.bmRegdate.toLocal()),
                  style: TextStyle(
                      fontSize: size.sub
                  ),
                ),
              ],
            ),
          ),
          bannerVO.bmNoticePathImg != ''
              ? _ResizingHeightImage(
            imageUrl: bannerVO.bmNoticePathImg,
            isDownLoad: true,
            size: size,
          )
              : const SizedBox(),
          bannerVO.bmNotice != ''
              ? BdLayoutPadding(
                  padding: PaddingEnum.lrb16,
                  child: _TitleArea(text: bannerVO.bmNotice, size: size,),
                )
              : const BdCustomPad(padEnum: PadEnum.height16,),
        ],
      ),
    );
  }
}



class _ResizingHeightImage extends StatelessWidget {
  final CommonSize size;
  final String imageUrl;
  final bool? isDownLoad;
  const _ResizingHeightImage({
    required this.size,
    required this.imageUrl,
    this.isDownLoad
  });

  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(
        builder: (context, constraints) =>
            BdRippleButtonStack(
              isDelay: true,
              onTap: (){
                context.read<VerseConfig>().browser.image.openDialog(
                    routerContext: context, currentIndex: 0,
                    imageList: [imageUrl],
                    isDownload: isDownLoad ?? false,
                    baseUrl: context.read<VerseConfig>().url.imageBananaUrl
                );
              },
              child: BdImageBinderCalculate(
                imageUrl: '${context.read<VerseConfig>().url.imageBananaUrl}$imageUrl',
                placeSize: (constraints.maxWidth, size.imageHeight),
              ),
            )

      );
  }
}


class _TitleArea extends StatelessWidget {
  final String text;
  final CommonSize size;
  const _TitleArea({
    required this.text,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.widthCommon,
      child: BdLayoutPadding(
        padding: PaddingEnum.verticalOri,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.black,
            fontSize: size.body,
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.left,
        ),
      ),
    );
  }
}