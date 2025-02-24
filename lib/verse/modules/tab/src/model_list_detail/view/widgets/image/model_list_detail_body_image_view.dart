import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/data/monkey/model/phone_spec_detail_entity.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_label.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/model_list_detail/manager/model_list_detail_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/model_list_detail/state/bloc/banana_model_list_detail/banana_model_list_detail_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/neo/bd_neo_button3.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/bd_ripple_button_stack.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/image/bd_image_binder_calculate.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_custom_pad.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_layout_side.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/text/bd_text_widget.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/ui/bd_ui_indexed_stack_animated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ModelListDetailBodyImageView extends StatelessWidget {
  const ModelListDetailBodyImageView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<BananaModelListDetailBloc, BananaModelListDetailState, PhoneSpecDetailEntity>(
        selector: (state) => state.modelDetailEntity,
        builder: (context, modelDetailEntity) =>
            Column(
              children: [
                const BdCustomPad( padEnum: PadEnum.height16),
                _ColorButtonArea(
                  modelDetailEntity: modelDetailEntity,
                ),
                const BdCustomPad( padEnum: PadEnum.height16),
                _ColorNameImageArea(
                  modelDetailEntity: modelDetailEntity,
                ),
                const BdCustomPad( padEnum: PadEnum.height16),
              ],
            )
    );
  }
}

class _ColorButtonArea extends StatelessWidget {
  final PhoneSpecDetailEntity modelDetailEntity;
  const _ColorButtonArea({required this.modelDetailEntity});

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return BdLayoutSide(
      sidePadding: SidePadding.onlyLeft,
      child: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: List.generate(modelDetailEntity.phoneImg.length,
                  (index) => BdNeoButton3(
                    size: size,
                    onPressed: (){
                      context.read<ModelListDetailManager>().changeColorIndex(context: context, index: index);
                      },
                    text: '',
                    borderRadius: 999,
                    depth: size.sizedBox2_5,
                    boxColor: Color(
                        modelDetailEntity.phoneImg[index].piColorHax.contains('#')
                            ? int.parse( modelDetailEntity.phoneImg[index].piColorHax.replaceFirst(RegExp(r'#'), '0xFF'))
                            : int.parse('0xFF${modelDetailEntity.phoneImg[index].piColorHax}')
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


class _ColorNameImageArea extends StatelessWidget {
  final PhoneSpecDetailEntity modelDetailEntity;
  const _ColorNameImageArea({
    required this.modelDetailEntity
  });

  @override
  Widget build(BuildContext context) {
    return BlocSelector<BananaModelListDetailBloc, BananaModelListDetailState, int>(
        selector: (state) => state.currentColor,
        builder: (context, current)=>
            Expanded(
              child: Column(
                children: [
                  BdTextWidget(text: modelDetailEntity.phoneImg[current].piColorName,
                    textStyle: titleButtonBold,
                  ),
                  const BdCustomPad(padEnum: PadEnum.height16),
                  Expanded(
                      child: _ImageArea(
                        currentIndex: current,
                        imageList: modelDetailEntity.phoneImg,
                      ))
                ],
              ),
            )
    );
  }
}


class _ImageArea extends StatelessWidget {
  final List<PhoneImg> imageList;
  final int currentIndex;
  const _ImageArea({
    required this.imageList,
    required this.currentIndex
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(
          context.read<VerseConfig>().size.sized16grid
      ),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints){
          double expandedWidth = constraints.maxWidth;
          double expandedHeight = constraints.maxHeight;
          return Center(
            child: BdUiIndexedStackAnimated(
              index: currentIndex,
              children: List.generate(
                  imageList.length,
                  (index) => BdRippleButtonStack(
                    isDelay: true,
                    onTap: (){
                      context.read<ModelListDetailManager>().openDialog(
                          context: context,
                          currentIndex: currentIndex,
                          imageList:  imageList.map((e) => e.piPath).toList()
                      );
                    },
                    child: BdImageBinderCalculate(
                      imageUrl: imageList[currentIndex].piPath,
                      placeSize: (expandedWidth, expandedHeight),
                    ),
                  )
              ),
            ),
          );
        },
      ),
    );
  }
}