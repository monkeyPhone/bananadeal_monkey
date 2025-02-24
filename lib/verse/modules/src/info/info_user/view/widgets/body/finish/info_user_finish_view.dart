import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_image.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_label.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/image/svg/bd_svg_binder2.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_custom_pad.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/text/bd_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class InfoUserFinishView extends StatelessWidget {
  const InfoUserFinishView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        BdCustomPad(padEnum: PadEnum.height8,),
        _TopTextArea(),
        _PicAreaSvg()
      ],
    );
  }
}


class _TopTextArea extends StatelessWidget {
  const _TopTextArea();

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return Padding(
      padding: size.paddingBodyWhole,
      child: SizedBox(
        width: size.widthCommon,
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BdTextWidget(text: '바나나딜과 함께 하는', textStyle: title27Bold, ),
                BdTextWidget(text: '스마트한 견적 상담', textStyle: title27Bold,)
              ],
            ),
            BdCustomPad(padEnum: PadEnum.height16),
            BdTextWidget(text:'지금부터 시작하세요 !', textStyle: titleLargeBold,)
          ],
        ),
      ),
    );
  }
}

class _PicAreaSvg extends StatelessWidget {
  const _PicAreaSvg();

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return BdSvgBinder2(
      width: size.widthCommon,
      height: size.widthCommon,
      padding: EdgeInsets.all(size.sizedBox45),
      imageUrl: signSvg,
    );
  }
}