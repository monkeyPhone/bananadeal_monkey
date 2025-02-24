import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/data/broad/my_deal_list_vo.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_deal.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_image.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/deal/manager/deal_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/bd_ripple_button_basic.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/image/bd_asset_image_binder.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/image/bd_image_binder.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_custom_pad.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DealBodyListTileView extends StatelessWidget {
  final MyDealListVO dealVO;
  final Color color;

  const DealBodyListTileView({
    super.key,
    required this.dealVO,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return BdRippleButtonBasic(
      onTap: (){
        context.read<DealManager>().gotoEstimateView(context: context, myDeal: dealVO);
      },
      color: color,
      margin: EdgeInsets.only(right: size.sized8grid, bottom: size.sizedBox8),
      width: size.widthCommon,
      height: size.ratio58/1.85,
      padding: EdgeInsets.all(size.sized12grid),
      child: Row(
        children: [
          _ImageArea(
            dealVO: dealVO,
            borderGap: size.sizedBox1_5,
            borderRadius: BorderRadius.circular(size.sized8grid),
            widgetSize: size,
          ),
          const BdCustomPad(padEnum: PadEnum.width8),
          Container(
            color: Colors.transparent,
            padding: EdgeInsets.symmetric(
              horizontal: size.sizedBox5,
              vertical: size.sizedBox8,
            ),
            width: size.sizedBox119_2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _DealListText(
                    text: dealVO.diHopePhone,
                    style22: TextStyle(
                        fontSize: size.titleButton,
                        fontWeight: FontWeight.w700,
                        color: blackWrite
                    ),
                    style18:TextStyle(
                        fontSize: size.titleLittle,
                        fontWeight: FontWeight.w700,
                        color: blackWrite
                    )
                ),
                Row(
                  children: [
                    Text('받은 견적  ', style: TextStyle(
                        fontSize: size.body,
                        fontWeight: FontWeight.w600,
                        color: blackWrite
                    )),
                    Text(dealVO.diEstimateCnt.toString(), style:TextStyle(
                        fontSize: size.body,
                        fontWeight: FontWeight.w600,
                        color: red
                    ),),
                    Text('건 ', style: TextStyle(
                        fontSize: size.body,
                        fontWeight: FontWeight.w600,
                        color: blackWrite
                    ),),
                  ],
                ),
              ],
            ),
          ),
          const BdCustomPad(padEnum: PadEnum.width12),
          const Expanded(
              child: Center(
                child: Icon(Icons.arrow_forward_ios),
              )
          ),
          const BdCustomPad(padEnum: PadEnum.width16),
        ],
      ),
    );
  }
}



class _ImageArea extends StatelessWidget {
  final CommonSize widgetSize;
  final MyDealListVO dealVO;
  final double borderGap;
  final BorderRadius borderRadius;
  const _ImageArea({
    required this.widgetSize,
    required this.dealVO,
    required this.borderGap,
    required this.borderRadius,
   });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constrains){
              double size = constrains.maxHeight;
              double minus = widgetSize.sized12grid*2;
              return Padding(
                padding: EdgeInsets.all(widgetSize.sized12grid),
                child: dealVO.diHopePhoneImg != ''
                    ?
                BdImageBinder(
                    imageWidth: size-minus,
                    imageHeight: size,
                    imageUrl: '${context.read<VerseConfig>().url.monkeyImageUrl}${dealVO.diHopePhoneImg}',
                    errUrl: defaultPhone,
                    imageLabel: 'carousel'
                )
                    :
                BdAssetImageBinder(
                    imageWidth: size-minus,
                    imageHeight: size,
                    imageUrl: defaultPhone
                ),
              );
            }
        ),

        Positioned.fill(
            child: dealVO.diStatus != '진행중'
                ?
            Container(
              margin: EdgeInsets.all(borderGap),
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: borderRadius,
              ),
              child:  Center(
                  child: Text(
                    dealVO.diStatus,
                    style: TextStyle(
                        color: switch(dealVO.diStatus){
                          dealStatusAcp => white,
                          dealStatusOpen => yellow,
                          _ => specPink
                        },

                        fontSize: widgetSize.titleMain,
                        fontWeight: FontWeight.w700),
                  )
              ),
            )
                : const SizedBox()
        )
      ],
    );
  }
}


class _DealListText extends StatelessWidget {
  final String text;
  final TextStyle style22;
  final TextStyle style18;
  const _DealListText({
    required this.text,
    required this.style22,
    required this.style18,
    });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        text == '프리미엄폰' || text == '보급폰' || text == '효도폰' || text == '공부폰' || text == '어린이폰'
            ? _ResizeText(text: '추천단말기', textStyle: style22, )
            : const SizedBox(),
        const BdCustomPad(padEnum: PadEnum.height8),
        _ResizeText(
          text: text == '프리미엄폰' || text == '보급폰' || text == '효도폰' || text == '공부폰' || text == '어린이폰'
              ? '($text)'
              : text,
          textStyle: text == '프리미엄폰' || text == '보급폰' || text == '효도폰' || text == '공부폰' || text == '어린이폰' || text.length > 24
              ? style18
              : style22,
        ),
      ],
    );
  }
}

class _ResizeText extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  const _ResizeText({
    required this.text,
    required this.textStyle,

  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle,
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
    );
  }
}