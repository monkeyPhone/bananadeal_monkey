import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_label.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/estimate_detail/manager/estimate_detail_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/bd_ripple_button_basic.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_custom_pad.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_layout_padding.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/text/bd_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EstimateDetailNav extends StatelessWidget {
  const EstimateDetailNav({super.key});

  @override
  Widget build(BuildContext context) {
    return const _Navbar();
  }
}

class _Navbar extends StatelessWidget {
  const _Navbar();

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    final bool isActive = context.read<EstimateDetailManager>().estimate.dStatus == 'PARTICIPATE';
    return SizedBox(
      width: size.widthCommon,
      height: size.sizedAppbar+size.sizedNav,
      child: Column(
        children: [
          const _TotalRate(),
          SizedBox(
            height: size.sizedAppbar,
            child:  isActive
                       ? const _Active()
                       : const _InActive()
          ),
        ],
      ),
    );
  }
}

class _TotalRate extends StatelessWidget {
  const _TotalRate();

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: context.read<VerseConfig>().size.sizedNav,
      child: BdLayoutPadding(
        padding: PaddingEnum.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const BdTextWidget(
              text: '월 납부요금',
              textStyle: titleButtonRedBold,
            ),
            const BdCustomPad(padEnum: PadEnum.width32),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const BdTextWidget(
                  text: '(VAT 포함)',
                  textStyle: bodyRedBold,
                ),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerRight,
                  child: BdTextWidget(
                    text: ' 월 ${
                        context.read<EstimateDetailManager>().func.switchEstimatePrice(
                            price: context.read<EstimateDetailManager>().estimate.deMonthTotalPrice
                        )
                    }',
                    textStyle: titleButtonRedBold,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _InActive extends StatelessWidget {
  const _InActive();

  @override
  Widget build(BuildContext context) {
    final String result = context.read<EstimateDetailManager>().convertStatus();
    return Center(
        child: BdTextWidget(
            text: '$result된 딜입니다.',
          textStyle: titleLittleGreyBold,
        )
    );
  }
}


class _Active extends StatelessWidget {
  const _Active();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        BdCustomPad(padEnum: PadEnum.width16),
        _ChatButton(),
        BdCustomPad(padEnum: PadEnum.width24),
        _Accept(),
        BdCustomPad(padEnum: PadEnum.width16),
      ],
    );
  }
}

class _ChatButton extends StatefulWidget {
  const _ChatButton();

  @override
  State<_ChatButton> createState() => _ChatButtonState();
}

class _ChatButtonState extends State<_ChatButton> {
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return
      context.read<EstimateDetailManager>().isChatView
          ? _NavButton(
        onTap: (){},
        text: '사용중',
        isFirst: null,
      )
          :
      !_loading
        ? _NavButton(
            onTap: () async{
              setState(() {
                _loading = true;
              });
              await context.read<EstimateDetailManager>().gotoChatLogView(context);
              setState(() {
                _loading = false;
              });
              },
            text: '채팅상담',
            isFirst: true,
          )
        : _NavButton(
      onTap: (){},
      text: '로딩중',
      isFirst: null,
    );
  }
}


class _Accept extends StatelessWidget {
  const _Accept();

  @override
  Widget build(BuildContext context) {
    return _NavButton(
      onTap: (){

      },
      text: '딜 수락하기',
      isFirst: false,
    );
  }
}



class _NavButton extends StatelessWidget {
  final bool? isFirst;
  final String text;
  final GestureTapCallback onTap;
  const _NavButton({
    required this.isFirst,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BdRippleButtonBasic(
          borderRadius: BorderRadius.circular(999),
          color: isFirst == null ? greyButtonDisable : isFirst! ? brown : yellow,
          onTap: onTap,
          child: Center(
            child: BdTextWidget(
              text: text,
              textStyle: isFirst == null ? titleLittleGreyBold : isFirst! ? titleLittleYellowBold : titleLittleBrownBold,
            ),
          )
      ),
    );
  }
}
