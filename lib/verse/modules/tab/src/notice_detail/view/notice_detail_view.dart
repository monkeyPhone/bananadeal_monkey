import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/data/notice_vo.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/method/api/model/data/canvas_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/bd_ripple_button_stack.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/canvas/bd_canvas.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/image/bd_image_binder_calculate.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_custom_pad.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_layout_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NoticeDetailView extends StatelessWidget {
  final NoticeVO noticeVO;
  const NoticeDetailView({super.key,
    required this.noticeVO,
  });

  @override
  Widget build(BuildContext context) {
    return BdCanvas(
      canvasEnum: CanvasEnum.basic,
      appbar: (noticeVO.bnTitle, TextStyle(
        color: Colors.black,
        fontSize: context.read<VerseConfig>().size.titleMain,
        fontWeight: FontWeight.w500,
      ), null, null),
      body: _Body(noticeVO: noticeVO,),
      navNullAble: true,
    );
  }
}

class _Body extends StatelessWidget {
  final NoticeVO noticeVO;
  const _Body({
    required this.noticeVO,
  });

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Column(
        children: [
          const BdCustomPad(padEnum: PadEnum.height1),
          BdLayoutPadding(
            padding: PaddingEnum.lrb16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  context.read<VerseConfig>().function.formatDateKO(noticeVO.bnRegdate.toLocal()),
                  style: TextStyle(
                      fontSize: size.sub
                  ),
                ),
              ],
            ),
          ),

          noticeVO.bnPathImg != ''
              ? _ResizingHeightImage(
            imageUrl: noticeVO.bnPathImg,
            isDownLoad: true,
            size: size,
          )
              : const SizedBox(),

          noticeVO.bnContent != ''
              ? BdLayoutPadding(
            padding: PaddingEnum.lrb16,
            child: _TitleArea(text: noticeVO.bnContent, size: size,),
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
    final CommonSize size = context.read<VerseConfig>().size;
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