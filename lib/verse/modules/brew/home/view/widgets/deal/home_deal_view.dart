import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_image.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_label.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/neumorphic/flutter_neumorphic.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/broad/manager/broad_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/broad/state/bloc/banana_broad_deal/banana_broad_deal_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/error/bd_refresh_button.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/image/bd_asset_image_binder.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_layout_padding.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_layout_ratio_padding_box.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/loading/spin/bd_loading_spin.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/text/bd_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomeDealView extends StatelessWidget {
  const HomeDealView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BananaBroadDealBloc, BananaBroadDealState>(
      builder: (context, state) =>
      switch(state.statusEnum){
        StatusEnum.initial || StatusEnum.loading => const _Loading(),
        StatusEnum.success =>
        switch(state.estimateList1.isNotEmpty){
          true => const _Nab3(),
          _ => const _Nab2(),

        },
        StatusEnum.later => const _Nab1(),
        _ => const _Default()
      },
    );
  }
}

class _Default extends StatelessWidget {
  const _Default();

  @override
  Widget build(BuildContext context) {
    return BdRefreshButton(
      onTap: (){
        context.read<BroadManager>().refreshDealData(context);
      },
    );
  }
}

class _Loading extends StatelessWidget {
  const _Loading();

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return BdLayoutRatioPaddingBox(
        color: greyEAEAEA,
        paddingEnum: PaddingRatioEnum.grid1616,
        child: _NeoButton(
          onPressed: () {

          },
          boxColor: white,
          size: size,
          child: const BdLoadingSpin(),
        )
    );
  }
}


class _Nab1 extends StatelessWidget {
  const _Nab1();

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return BdLayoutRatioPaddingBox(
        color: greyEAEAEA,
        paddingEnum: PaddingRatioEnum.grid1616,
        child: _NeoButton(
          onPressed: () {
            context.read<BroadManager>().gotoCreateDealView(context: context);
          },
          boxColor: white,
          size: size,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icon(Icons.add_circle_outline, color: Style.greyWrite, size: WidgetSize(context).sizedBox37,),
              // SizedBox(height: WidgetSize(context).sizedBox5,),
              const BdTextWidget(text: '딜 목록이 비어있어요.', textStyle: bodyGreyBold, ),
              const BdTextWidget(text: '새로운 딜을 등록해보세요.', textStyle: bodyGreyBold,),
              Container(
                  margin: EdgeInsets.only(top: size.sized16grid),
                  padding: EdgeInsets.symmetric(
                      vertical: size.sizedPaddingHalf,
                      horizontal: size.sized16grid
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(width: size.sizedBox2, color: grey999999),
                      borderRadius: BorderRadius.circular(size.sizedBox10)
                  ),
                  child: const BdTextWidget(text: 'CONTINUE BANANADEAL', textStyle: titleButtonGreyBold,))
            ],
          ),
        )
    );
  }
}

class _Nab2 extends StatelessWidget {
  const _Nab2();

  @override
  Widget build(BuildContext context) {
    return const BdLayoutRatioPaddingBox(
      paddingEnum: PaddingRatioEnum.grid1632,
      color: greyEAEAEA,
      child: _Nb2Button(),
    );
  }
}

class _Nb2Button extends StatelessWidget {
  const _Nb2Button();

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return _NeoButton(
      onPressed: () {
        context.read<BroadManager>().refreshDealData(context);
      },
      size: size,
      boxColor: white,
      child: BdLayoutPadding(
        padding: PaddingEnum.all,
        child: Stack(
          alignment: Alignment.center,
          children: [
            BdAssetImageBinder(
              boxFit: BoxFit.contain,
              imageHeight: size.ratio58,
              imageWidth: size.ratio58,
              imageUrl: defaultList,
            ),
            Positioned.fill(
              bottom: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      margin: EdgeInsets.only(top: size.sized16grid),
                      padding: EdgeInsets.symmetric(
                          vertical: size.sizedPaddingHalf,
                          horizontal: size.sized16grid
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(width: size.sizedBox1_5, color: Colors.black54),
                          borderRadius: BorderRadius.circular(size.sizedBox10)
                      ),
                      child: Text('아직 참여한 매장이 없습니다.',
                        style: TextStyle(
                            fontSize: size.titleLittle,
                            fontWeight: FontWeight.w600,
                            color: Colors.black54
                        ),
                      )
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class _Nab3 extends StatelessWidget {
  const _Nab3();

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return Container(
      width: size.widthCommon,
      color: greyEAEAEA,
      padding: EdgeInsets.symmetric(
          horizontal: size.sized16grid,
          vertical: size.sized32grid
      ),
      child: Neumorphic(
        style: NeumorphicStyle(
          border: NeumorphicBorder( color: yellow, width: size.sized2grid),
          shadowLightColor: Colors.yellow.shade200,
          shadowDarkColor: Colors.grey.shade600,
          color: white,
          depth: 2.5,
          intensity: 0.86,
          surfaceIntensity: 0.5,
          shape: NeumorphicShape.flat,
          boxShape:
          NeumorphicBoxShape.roundRect(BorderRadius.circular(size.sizedBox13)),
        ),
        child: Container(
          color: white,
          padding: EdgeInsets.all(size.sized8grid),
          child: const SizedBox(),
        ),
      ),
    );
  }
}


class _NeoButton extends StatelessWidget {
  final CommonSize size;
  final VoidCallback onPressed;
  final bool? isDebounce;
  final Color? boxColor;
  final Color? textColor;
  final Widget? child;
  final double? width;
  final double? radius;
  final double? height;
  final double? depth;
  final double? intensity;
  final double? surfaceIntensity;
  final Color? shadowColor;
  const _NeoButton({
    required this.size,
    this.isDebounce,
    required this.onPressed,
    this.boxColor,
    this.textColor,
    this.child,
    this.width,
    this.height,
    this.radius,
    this.depth,
    this.intensity,
    this.surfaceIntensity,
    this.shadowColor,
  });

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
        onPressed: isDebounce == null ?
        context.read<VerseConfig>().function.debounce(callback: onPressed) : onPressed,
        style: NeumorphicStyle(
          // depth: Get.width*0.01,
          // surfaceIntensity: 0,
          // intensity: 0.75,
          // shadowLightColor: Style.grey,
          shadowDarkColor: bananaBack,
          depth: 3,//Get.width*0.0187,
          intensity: intensity ?? 0.5,//0.86,
          surfaceIntensity: surfaceIntensity ?? 0,//0.5,
          shape: NeumorphicShape.flat,
          color: boxColor ?? yellow,
          boxShape:
          NeumorphicBoxShape.roundRect(BorderRadius.circular(size.sizedBox10)),
        ),
        child: child
    );
  }
}