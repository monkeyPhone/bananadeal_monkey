import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/method/api/model/data/canvas_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_label.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/onboarding/splash/state/bloc/banana_appversion/banana_appversion_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/onboarding/splash/state/listener/appversion_bloc_listener.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/onboarding/splash/view/widgets/body/splash_body_bloc_selector_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/canvas/bd_canvas.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/text/bd_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const BdCanvas(
      canvasEnum: CanvasEnum.basic,
      listener: AppversionBlocListener(),
      body: SplashBodyBlocSelectorView(),
      navbarWidget: _Nav(),
      isCanPop: false,
    );
  }
}

class _Nav extends StatelessWidget {
  const _Nav();

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            BdTextWidget(text: '현재 버전 : ', textStyle: footGreyBold,),
            _NavTextBuilder(isCurrent: true),
          ],
        ),
        SizedBox(height: size.sizedBox5,),
        const Row(
          children: [
            BdTextWidget(text: '최신 버전 : ', textStyle: footGreyBold,),
            _NavTextBuilder(isCurrent: false),
          ],
        )
      ],
    );
  }
}


class _NavTextBuilder extends StatelessWidget {
  final bool isCurrent;
  const _NavTextBuilder({
    required this.isCurrent,
  });

  @override
  Widget build(BuildContext context) {
    return Builder(
        builder: (BuildContext context){
          final bloc = context.watch<BananaAppversionBloc>();
          final BananaAppversionState state = bloc.state;
          final String text =
          switch(state.splashVO.statusEnum){
            StatusEnum.later => isCurrent == true ? state.splashVO.currentVersion : state.splashVO.contents!.auVersion,
            StatusEnum.success => '잠시만 기다려주세요.',
            _ => ' ---'
          };
          return BdTextWidget(
            text: text,
            textStyle: footGreyBold,);
        }
    );
  }
}