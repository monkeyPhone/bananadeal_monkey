import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/data/broad/my_deal_detail_vo.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_image.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_label.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/neo/bd_neo_button_free.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/bd_ripple_button_basic.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/image/bd_asset_image_binder.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/image/bd_image_binder.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_custom_pad.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/text/bd_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BrowserBottomSheetOption {
  const BrowserBottomSheetOption();

  void showSheet({
    required BuildContext routerContext,
    required MyDealDetailVO myDealDetail,
  }){
    showModalBottomSheet<void>(
        useSafeArea: true,
        isScrollControlled: true,
        context: routerContext,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(routerContext.read<VerseConfig>().size.sized24grid),
              topRight: Radius.circular(routerContext.read<VerseConfig>().size.sized24grid)),
        ),
        showDragHandle: true,
        builder: (BuildContext context) =>
            _BottomSheet(
                size: context.read<VerseConfig>().size,
                myDealDetail: myDealDetail
            )

    );
  }

}

class _BottomSheet extends StatelessWidget {
  final CommonSize size;
  final MyDealDetailVO myDealDetail;
  const _BottomSheet({
    required this.size,
    required this.myDealDetail,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.symmetric(horizontal: size.sized16grid),
      constraints: BoxConstraints(
        maxHeight: size.introImage,
      ),
      decoration: const BoxDecoration(
        color: white,
      ),
      child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const BdCustomPad(padEnum: PadEnum.height8),
              _ImageArea(
                myDealDetail: myDealDetail,
                size: size,
              ),

              _Content(
                myDealDetail: myDealDetail,
                size: size,
              ),

              _SubButton(
                myDealDetail: myDealDetail,
                size: size,
              ),

              BdNeoButtonFree(
                  radius: size.sized12grid,
                  height: size.sizedButton,
                  width: size.widthCommon,
                  size: size,
                  onPressed: (){
                    context.read<VerseConfig>().route.closePage(context);
                  },
                  child: const Center(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: BdTextWidget(
                          text:  '확인',
                          textStyle: bodyBrownBold,
                        ),
                      )
                  )
              ),
              const BdCustomPad(padEnum: PadEnum.height8),
            ],
          )
      ),
    );
    }
  }

  class _ImageArea extends StatelessWidget {
    final CommonSize size;
    final MyDealDetailVO myDealDetail;
    const _ImageArea({
      required this.size,
      required this.myDealDetail,
    });

    @override
    Widget build(BuildContext context) {
      return Column(
        children: [
          SizedBox(
            height: size.sizedSheet,
            child: Row(
              children: [
                myDealDetail.diHopePhoneImg != ''
                    ?
                BdImageBinder(
                    imageWidth: size.sizedSheet,
                    imageHeight: size.sizedSheet,
                    imageUrl: myDealDetail.diHopePhoneImg,
                    errUrl: defaultPhone,
                    imageLabel: 'carousel'
                )
                    :
                BdAssetImageBinder(
                    boxFit: BoxFit.contain,
                    imageWidth: size.sizedSheet,
                    imageHeight: size.sizedSheet,
                    imageUrl: defaultPhone
                ),
                const BdCustomPad(padEnum: PadEnum.width16),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                          fit: BoxFit.scaleDown,
                          child: BdTextWidget(text: myDealDetail.diHopePhone, textStyle: titleLittleBold,)
                      ),
                      myDealDetail.diHopePhoneModel == ''
                          ? const SizedBox()
                          : FittedBox(
                          fit: BoxFit.scaleDown,
                          child: BdTextWidget(text: myDealDetail.diHopePhoneModel, textStyle: subGreyBold,)
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      );
    }
  }


  class _Content extends StatelessWidget {
    final CommonSize size;
    final MyDealDetailVO myDealDetail;
    const _Content({
      required this.size,
      required this.myDealDetail,
    });

    @override
    Widget build(BuildContext context) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: size.sized16grid),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const BdCustomPad(padEnum: PadEnum.height32),
            _RowArea(title: '가입유형', content: myDealDetail.diJoinType),
            _RowArea(
                title: '통신사',
                content: context.read<VerseConfig>().function.convertTelecom(
                    currentAgency: myDealDetail.diBeforeTkIdx == '' ? '0' : myDealDetail.diBeforeTkIdx,
                    requestAgency: myDealDetail.diAfterTkIdx == '' ? '0' : myDealDetail.diAfterTkIdx
                )
            ),
            _RowArea(title: '가입연령', content: myDealDetail.diAgeType),
            _RowArea(title: '요금제', content: myDealDetail.diHopePlan),
            _RowArea(title: '할부개월', content: context.read<VerseConfig>().function.convertInstallment(myDealDetail.diMaxInstallmentMonth)),
            _RowArea(title: '통신사할인', content: context.read<VerseConfig>().function.convertTelecomSupport(myDealDetail.diSupportType)),
          _RowArea(title: '결합', content: myDealDetail.diCombination == '' ? '해당없음' : myDealDetail.diCombination),
          _RowArea(title: '복지', content: myDealDetail.diWelfare == '' ? '해당없음' : myDealDetail.diWelfare, isPad: false,),
          const BdCustomPad(padEnum: PadEnum.height32),
        ],
      ),
    );
  }
}


class _RowArea extends StatelessWidget {
  final String title;
  final String content;
  final bool? isPad;
  const _RowArea({
    required this.title,
    required this.content,
    this.isPad
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            BdTextWidget(text: title, textStyle: bodyBold,),
            const BdCustomPad(padEnum: PadEnum.width16),
            BdTextWidget(text: content),
          ],
        ),
        isPad == false ? const SizedBox() : const BdCustomPad(padEnum: PadEnum.height16)
      ],
    );
  }
}

class _SubButton extends StatelessWidget {
  final CommonSize size;
  final MyDealDetailVO myDealDetail;
  const _SubButton({
  required this.size,
  required this.myDealDetail});

  @override
  Widget build(BuildContext context) {
    return myDealDetail.diHopePhoneIdx != '' || myDealDetail.diHopePlanIdx != ''
      ? Column(
      children: [
        const BdCustomPad(padEnum: PadEnum.height12),
        SizedBox(
          height: size.sizedCategory,
          child: Row(
            children: [
              Expanded(
                  child: myDealDetail.diHopePhoneIdx != ''
                      ? _SubB(
                          splashColor: Colors.blue.shade50,
                          size: size,
                          onTap: (){
                            context.read<VerseConfig>().tab.gotoModelListDetailView(
                                context: context,
                                isIntro: true,
                                psIdx: myDealDetail.diHopePhoneIdx,
                                name: myDealDetail.diHopePhone
                            );
                          },
                          color: specBlue,
                          text: '단말기 상세보기'
                        )
                      : const SizedBox()
              ),
              const BdCustomPad(padEnum: PadEnum.width16),
              Expanded(
                  child: myDealDetail.diHopePlanIdx != ''
                      ? _SubB(
                      splashColor: Colors.pink.shade50,
                      size: size,
                      onTap: (){
                        context.read<VerseConfig>().tab.gotoRateDetailDialog(
                            context: context, pIdx: myDealDetail.diHopePlanIdx,
                            baseUrl: context.read<VerseConfig>().url.monkeyUrl
                        );
                      },
                      color: specPink,
                      text: '요금제 상세보기'
                  )
                      : const SizedBox()
              )
            ],
          ),
        ),
        const BdCustomPad(padEnum: PadEnum.height24),
      ],
    )
      : const SizedBox();
  }
}


class _SubB extends StatelessWidget {
  final CommonSize size;
  final GestureTapCallback onTap;
  final Color color;
  final Color? splashColor;
  final Color? highlightColor;
  final String text;
  const _SubB({
    required this.size,
    required this.onTap,
    required this.color,
    this.splashColor,
    this.highlightColor,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return BdRippleButtonBasic(
        highlightColor: highlightColor,
        splashColor: splashColor,
        borderRadius: BorderRadius.circular(size.sized12grid),
        padding: EdgeInsets.symmetric(horizontal: size.sized4grid),
        border: Border.all(
          width: size.sizedBox1,
          color: color
        ),
        onTap: onTap,
        child: Center(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              text,
              style: TextStyle(
                fontSize: size.sub,
                color: color,
                fontWeight: FontWeight.w500
              ),
            ),
          ),
        )
    );
  }
}
