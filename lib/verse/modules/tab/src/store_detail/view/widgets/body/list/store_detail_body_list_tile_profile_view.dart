import 'package:auto_size_text_plus/auto_size_text_plus.dart';
import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_image.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_label.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/store_detail/manager/store_detail_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/store_detail/state/bloc/banana_store_detail/banana_store_detail_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/store_detail/view/components/component_store_time_line.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/bd_ripple_button_basic.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/image/svg/bd_svg_binder.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_custom_pad.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_layout_padding.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_layout_ratio58_pad32.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/text/bd_text_widget.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/ui/bd_ui_star_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoreDetailBodyListTileProfileView extends StatelessWidget {
  const StoreDetailBodyListTileProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const BdLayoutRati58Pad32(
        padding: PaddingEnum.horizontal,
        child: Column(
          children: [
            // TODO 상정 이름
            _StoreName(),
            BdCustomPad(padEnum: PadEnum.height12),
            _Score(),
            _TimeLine(),
            BdCustomPad(padEnum: PadEnum.height16),
            _Address(),
            BdCustomPad(padEnum: PadEnum.height16),
            _SdsButtonArea(),
          ],
        )
    );
  }
}


class _StoreName extends StatelessWidget {
  const _StoreName();

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: BdTextWidget(
        text: context.read<BananaStoreDetailBloc>().state.detailVO.smStoreName,
        textStyle: titleNameBold,
      ),
    );
  }
}


class _Score extends StatelessWidget {
  const _Score();

  @override
  Widget build(BuildContext context) {
    return  context.read<StoreDetailManager>().getScore(context) > 0.5
        ?
    Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
                context.read<StoreDetailManager>().getScore(context),
                    (index) => BdLayoutPadding(
                  padding: PaddingEnum.horizontal4,
                  child: BdUiStarIcon(
                    size: context.read<VerseConfig>().size.sizedBox19,
                  ),
                )
            ).toList(),
            const BdCustomPad(padEnum: PadEnum.width8),
            BdTextWidget(
              text: '(${context.read<BananaStoreDetailBloc>().state.detailVO.avgPoint})',
              textStyle: sub,
            ),
          ],
        ),
        const BdCustomPad(padEnum: PadEnum.height16),
      ],
    ) :     Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BdSvgBinder(
                color: white,
                size: context.read<VerseConfig>().size.sizedBox19, icon: iconStar),
            const BdTextWidget(
              text: '등록된 평점이 없습니다.',
              textStyle: calloutGreyBold,
            ),
            BdSvgBinder(
                color: white,
                size: context.read<VerseConfig>().size.sizedBox19, icon: iconStar),
          ],
        ),
        const BdCustomPad(padEnum: PadEnum.height16),
      ],
    );
  }
}



class _TimeLine extends StatelessWidget {
  const _TimeLine();

  @override
  Widget build(BuildContext context) {
    return  ComponentStoreTimeLine(
      size: context.read<VerseConfig>().size,
      openInfo: context.read<BananaStoreDetailBloc>().state.openInfo,
      smTimeStart:  context.read<BananaStoreDetailBloc>().state.detailVO.smTimeStart,
      smTimeEnd: context.read<BananaStoreDetailBloc>().state.detailVO.smTimeEnd,
    );
  }
}


class _Address extends StatelessWidget {
  const _Address();

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            context.read<BananaStoreDetailBloc>().state.detailVO.smAddress,
            style: TextStyle(
                fontSize: context.read<VerseConfig>().size.body
            ),
            textAlign: TextAlign.center,
            maxLines: 4,
          ),
        ],
      ),
    );
  }
}


class _SdsButtonArea extends StatelessWidget {
  const _SdsButtonArea();

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return Container(
      height: size.sizedBox65,
      decoration: BoxDecoration(
          color: white,
          border: Border(
            top: BorderSide(
                width: size.sizedBox0_7,
                color: greyD7D7D7
            ),
            bottom: BorderSide(
                width: size.sizedBox0_7,
                color: greyD7D7D7
            ),
            // bottom: BorderSide(
            //   width: widgetSize.sizedBox7_5,
            //   color: greyF4F4F4
            // )
          )
      ),
      child: Row(
        children: [
          _FlexButton(
            onTap: (){
              context.read<StoreDetailManager>().logic.makePhoneCall(context: context);
            },
            text: '전화',
            icon: Icons.phone,
          ),
          const _Pad(),
          _FlexButton(
            onTap: (){
              context.read<StoreDetailManager>().route.gotoMap(context);
            },
            text: '지도',
            icon: Icons.map_outlined,
          ),
          const _Pad(),
          _FlexButton(
            onTap: (){
              context.read<StoreDetailManager>().logic.shareStore(context);
            },
            text: '공유',
            icon: Icons.share_outlined,
          ),
          const _Pad(),
          _FlexButton(
            onTap: (){
              context.read<StoreDetailManager>().logic.inquiryStore(context: context, );
            },
            text: '문의',
            icon: Icons.chat_bubble_outline,
          ),
        ],
      ),
    );
  }
}

class _FlexButton extends StatelessWidget {
  final GestureTapCallback onTap;
  final IconData icon;
  final String text;
  const _FlexButton({
    required this.onTap,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return Flexible(
      fit: FlexFit.tight,
      child: BdRippleButtonBasic(
        onTap: onTap,
        padding: EdgeInsets.symmetric(
            vertical: size.sizedBox2_5
        ),
        child: Column(
          children: [
            const BdCustomPad(padEnum: PadEnum.heightQuarter),
            Flexible(
                fit: FlexFit.tight,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Icon(
                      icon
                  ),
                )
            ),
            const BdCustomPad(padEnum: PadEnum.heightQuarter),
            Flexible(
                fit: FlexFit.tight,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                      text
                  ),
                )
            ),
            const BdCustomPad(padEnum: PadEnum.heightQuarter),
          ],
        ),
      ),
    );
  }
}


class _Pad extends StatelessWidget {
  const _Pad();

  @override
  Widget build(BuildContext context) {
    return  Container(
      width:  context.read<VerseConfig>().size.sizedBox0_7,
      color: greyD7D7D7,
    );
  }
}