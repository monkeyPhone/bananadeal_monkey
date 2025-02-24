import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/data/store_vo.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_image.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_label.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_string.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/app_data/bd_rich_text_element.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/bd_ripple_button_basic.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/image/bd_image_binder.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_custom_pad.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_layout_padding.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/text/bd_rich_text.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/text/bd_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BdUiStoreListTile extends StatelessWidget {
  final StoreVO storeVO;
  final CommonSize size;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final GestureTapCallback onTapF;
  final GestureTapCallback onTap;
  final Color? color;
  final bool? isCheck;
  final bool? isStatus;
  const BdUiStoreListTile({super.key,
    required this.storeVO,
    required this.size,
    this.margin,
    this.padding,
    required this.onTapF,
    required this.onTap,
    this.color,
    this.isCheck,
    this.isStatus,
  });

  @override
  Widget build(BuildContext context) {
    return _StoreTile(
      onTapF: onTapF,
      onTap: onTap,
      size: size,
      storeVO: storeVO,
      color: color,
      margin: margin,
      padding: padding,
      isCheck: isCheck,
      isStatus: isStatus,
    );
  }
}

class _StoreTile extends StatelessWidget {
  final GestureTapCallback onTap;
  final GestureTapCallback onTapF;
  final CommonSize size;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final StoreVO storeVO;
  final Color? color;
  final bool? isCheck;
  final bool? isStatus;
  const _StoreTile({
    required this.onTap,
    required this.onTapF,
    this.margin,
    this.padding,
    required this.size,
    required this.storeVO,
    this.color,
    this.isCheck,
    this.isStatus
  });

  @override
  Widget build(BuildContext context) {
    return BdRippleButtonBasic(
        color: color,
        padding: padding ?? EdgeInsets.only(
          left: size.sized8grid,
        ),
        border: Border(
            bottom: BorderSide(width: size.sizedBox1, color: greyDDDDDD)
        ),
        key: key,
        margin: margin,
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const BdCustomPad(padEnum: PadEnum.height20),
            _ProfileBox(
              onTap: onTapF,
              size: size,
              storeVO: storeVO,
              isCheck: isCheck,
              isStatus: isStatus,
            ),
            const BdCustomPad(padEnum: PadEnum.height20),
            // _IntroduceBox(
            //   size: size,
            //   introduce: storeVO.smStoreIntroduce,
            // ),
            // const BdCustomPad(padEnum: PadEnum.height20),
          ],
        )
    );
  }
}

class _ProfileBox extends StatelessWidget {
  final CommonSize size;
  final StoreVO storeVO;
  final GestureTapCallback onTap;
  final bool? isCheck;
  final bool? isStatus;
  const _ProfileBox({
    required this.size,
    required this.storeVO,
    required this.onTap,
    this.isCheck,
    this.isStatus
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _ImageArea(
          size: size,
          imageUrl: storeVO.smPathImg0,
          openInfo: context.read<VerseConfig>().function.calculateTime(
              smTimeStart: storeVO.smTimeStart,
              smTimeEnd: storeVO.smTimeEnd,
              smConsultationTime: storeVO.smConsultationTime,
          ),
          isStatus: isStatus,
        ),
        const BdCustomPad(padEnum: PadEnum.width12),
        _InfoArea(
          size: size,
          storeVO: storeVO,
          onTap: onTap,
          isCheck: isCheck,
        ),
      ],
    );
  }
}


class _InfoArea extends StatelessWidget {
  final CommonSize size;
  final StoreVO storeVO;
  final GestureTapCallback onTap;
  final bool? isCheck;
  const _InfoArea({
    required this.size,
    required this.storeVO,
    required this.onTap,
    this.isCheck,

  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _InfoString(
            size: size,
            storeVO: storeVO,
          ),
          const BdCustomPad(padEnum: PadEnum.width8),
          _BookMarkButton(
            size: size,
            isBookMark: storeVO.favoriteStore != 0,
            onTap: onTap,
            isCheck: isCheck,
          )
        ],
      ),
    );
  }
}



class _InfoString extends StatelessWidget {
  final CommonSize size;
  final StoreVO storeVO;
  const _InfoString({
    required this.size,
    required this.storeVO

  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const BdCustomPad(padEnum: PadEnum.height8),
          LayoutBuilder(
              builder: (context, constraints){
                return  SizedBox(
                  width: constraints.maxWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: BdTextWidget(
                          text: storeVO.smStoreName,
                          maxLines: 3,
                          textStyle: titleLittleBold,
                        ),
                      ),
                      const BdCustomPad(padEnum: PadEnum.width12),
                      _Distance(size: size, smRange: storeVO.smRange,),
                      const BdCustomPad(padEnum: PadEnum.width8),
                    ],
                  ),
                );
              }

          ),
          const BdCustomPad(padEnum: PadEnum.height8),
          _RowArea(
            title: '참여',
            content: '${storeVO.sendDeal}건/${storeVO.inviteDeal}건',
          ),
          const BdCustomPad(padEnum: PadEnum.height1),
          _RowArea(
            title: '수락',
            content: '${storeVO.openDeal} 건',
          ),
          const BdCustomPad(padEnum: PadEnum.height1),
          _RowArea(
            title: '후기',
            content: '${storeVO.reviewCnt} 건',
          ),
          const BdCustomPad(padEnum: PadEnum.height1),
          _RowArea(
            title: '평점',
            icon: Icon(Icons.star,color: yellow, size: size.sized16grid,),
            content: storeVO.avgPoint == '' ? '0.0' : storeVO.avgPoint,
          ),
        ],
      ),
    );
  }
}

class _RowArea extends StatelessWidget {
  final String title;
  final String content;
  final Widget? icon;
  const _RowArea({
    required this.title,
    required this.content,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BdTextWidget(
          text: title,
          textStyle: subGrey,
        ),
        const BdCustomPad(padEnum: PadEnum.width8),
        icon ?? const SizedBox(),
        BdTextWidget(
          text: content,
          textStyle: sub,
        ),
      ],
    );
  }
}


class _Distance extends StatelessWidget {
  final CommonSize size;
  final double smRange;
  const _Distance({
    required this.size,
    required this.smRange,
  });

  @override
  Widget build(BuildContext context) {
    return  Container(
        padding: EdgeInsets.symmetric(
            horizontal: size.sizedBox3,
            vertical: size.sizedBox1
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size.sizedBox6_5),
          color: ultimateGrey,
        ),
        child: Text(
          smRange < 1.0
              ?
          '${(smRange*1000).roundToDouble().toInt()}m'
              :
          '${(smRange).toStringAsFixed(1)}km',
          style: TextStyle(
            fontSize: size.sub,
            fontWeight: FontWeight.w400,
            color: white,
          ),
        )


    );
  }
}



class _BookMarkButton extends StatelessWidget {
  final CommonSize size;
  final bool isBookMark;
  final GestureTapCallback onTap;
  final bool? isCheck;
  const _BookMarkButton({
    required this.size,
    required this.isBookMark,
    required this.onTap,
    this.isCheck
  });

  @override
  Widget build(BuildContext context) {
    return
    //   BdRippleIconsButton(
    //   onTap: onTap,
    //   backColor: Colors.transparent,
    //   iconColor:  !isBookMark
    //       ? yellow : bananaBack,
    //   widgetSize: widgetSize,
    //   icon:  !isBookMark
    //       ? Icons.bookmark
    //       : Icons.bookmark_border,
    // );
    Column(
      children: [
        SizedBox(
            width: size.sizedBox32,
            height: size.sizedBox32,
            child: FittedBox(
                child:

                isBookMark
                    ? const Icon(Icons.bookmark, color: yellow)
                    : const SizedBox()
            )
        ),

        const BdCustomPad(padEnum: PadEnum.height16),
        isCheck == null
        ? const SizedBox()
        : SizedBox(
            width: size.sizedBox30,
            height: size.sizedBox30,
            child: FittedBox(
                child:

                isCheck!
                    ? const Icon(Icons.check_box, color: yellow)
                    : const Icon(Icons.check_box_outline_blank, color: greyWrite)
            )
        ),
      ],
    );
  }
}


class _ImageArea extends StatelessWidget {
  final CommonSize size;
  final String imageUrl;
  final (bool isReg, bool isOpen, String dayPas) openInfo;
  final bool? isStatus;
  const _ImageArea({
    required this.size,
    required this.imageUrl,
    required this.openInfo,
    this.isStatus
  });

  @override
  Widget build(BuildContext context) {
    final BorderRadiusGeometry borderRadius = BorderRadius.circular(size.sizedBox15);
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: borderRadius
      ),
      elevation: size.sizedBox2,
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Stack(
          children: [
            BdImageBinder(
                imageRadius: borderRadius,
                imageWidth: size.sizedBox110,
                imageHeight: size.sizedBox110,
                imageUrl: '${context.read<VerseConfig>().url.imageBananaUrl}$imageUrl',
                errUrl: defaultStore,
                imageLabel: caseThumb
            ),
            isStatus != false
            && (!openInfo.$1 || !openInfo.$2)
                ? Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius:borderRadius,
                    color: Colors.black45,
                  ),
                  child: const Center(
                    child: BdTextWidget(
                      text: '상담 대기',
                      textStyle: calloutWhiteBold,
                      maxLines: 4,
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
            )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}




class _IntroduceBox extends StatelessWidget {
  final CommonSize size;
  final String introduce;
  const _IntroduceBox({
    required this.size,
    required this.introduce
  });

  @override
  Widget build(BuildContext context) {
    return BdLayoutPadding(
      padding: PaddingEnum.horizontal8,
      child: SizedBox(
        width: size.widthCommon,
        child:
        introduce == ''
            ?  Text('  ', style: TextStyle( fontWeight: FontWeight.w400, fontSize: size.sizedBox12,), )
            :  BdRichText(
            children: [
              BdRichTextElement(
                text: '♯',
                style: TextStyle(
                  color:introduce == '' ? greyWrite : Colors.blue,
                  fontWeight: FontWeight.w600, fontSize: size.sizedBox12,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              BdRichTextElement(
                text: '   ',
                style: TextStyle(
                  color:introduce == '' ? greyWrite : blackWrite,
                  fontWeight: FontWeight.w400, fontSize: size.sizedBox12,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              BdRichTextElement(
                  text: introduce == '' ? '등록된 매장 소개글이 없습니다.' : introduce,
                  style: TextStyle(
                  color:introduce == '' ? greyWrite : blackWrite,
                  fontWeight: FontWeight.w400, fontSize: size.sizedBox12,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ]
        )
      ),
    );
  }
}

// Row(
// children: [
// Icon(Icons.mode_comment_outlined),
// Expanded(
// child: Text( introduce == '' ? '등록된 매장 소개글이 없습니다.' : introduce,
// style: TextStyle(
// color:introduce == '' ? greyWrite : blackWrite,
// fontWeight: FontWeight.w400, fontSize: size.sizedBox12,
// overflow: TextOverflow.ellipsis,
// ),
// maxLines: 1,
// textAlign: TextAlign.start,
// ),
// )
// ],
// )