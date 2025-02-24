import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/method/api/model/data/canvas_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_image.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_label.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/create_deal/step/finish_deal/manager/finish_deal_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/neo/bd_neo_button.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/canvas/bd_canvas.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/image/bd_asset_image_binder.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_custom_pad.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_layout_padding.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/text/bd_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FinishDealView extends StatelessWidget {
  const FinishDealView({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<FinishDealManager>(
      create: (BuildContext context) =>
      const FinishDealManager(),
      child: const _Canvas(),
    );
  }
}

class _Canvas extends StatelessWidget {
  const _Canvas();

  @override
  Widget build(BuildContext context) {
    return const BdCanvas(
      canvasEnum: CanvasEnum.finishDeal,
      appbar: ('' , null, null, null),
      body: _Body(),
      navbarWidget: _Navbar(),
    );
  }
}



class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return const BdLayoutPadding(
        padding: PaddingEnum.horizontal,
        child: SingleChildScrollView(
          child: Column(
            children: [
              _Image(),
              _Alert()
            ],
          ),
        ),
    );
  }
}


class _Image extends StatelessWidget {
  const _Image();

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BdAssetImageBinder(
            imageHeight: size.sizedBox182,
            imageWidth: size.sizedBox220_5,
            imageUrl: completeDeal),
        const BdCustomPad(padEnum: PadEnum.height32),
        const BdTextWidget(text: '견적 요청 완료', textStyle: titleMainGreenBold,),
        const BdCustomPad(padEnum: PadEnum.height32),
        const BdTextWidget(text: '초대한 매장에서 고객님이 요청한 견적을 확인하여,', textStyle: titleButtonBold,),
        const BdTextWidget(text: "'48시간 이내'에 딜을 보내드릴 예정입니다.", textStyle: titleButtonBold,),
        const BdCustomPad(padEnum: PadEnum.height16),
        const BdTextWidget(text: "* 영업시간 외에는 확인이 늦을 수 있으니 기다려주세요.",),
        const BdCustomPad(padEnum: PadEnum.height32),
        const BdCustomPad(padEnum: PadEnum.height32),
      ],
    );
  }
}


class _Alert extends StatelessWidget {
  const _Alert();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        BdTextWidget(text:'혹시 매장 초대를 깜빡하셨더라도,', textStyle: titleLittleGreyBold,),
        BdTextWidget(text:"'동네매장 상세보기'에서 초대가 가능합니다.", textStyle: titleLittleGreyBold,),
        BdCustomPad(padEnum: PadEnum.height8),
      ],
    );
  }
}




class _Navbar extends StatelessWidget {
  const _Navbar();

  @override
  Widget build(BuildContext context) {
    return BdNeoButton(
      fontSize: context.read<VerseConfig>().size.titleLittle,
      onPressed: () {
       context.read<FinishDealManager>().closePage(context);
      }, text: '확인', size: context.read<VerseConfig>().size,);
  }
}


