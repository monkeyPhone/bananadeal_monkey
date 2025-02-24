import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/estimate/manager/estimate_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/estimate/state/bloc/banana_estimate_option/banana_estimate_option_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/bd_ripple_button_basic.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_custom_pad.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_layout_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EstimateBodySortBarView extends StatelessWidget {
  const EstimateBodySortBarView({super.key});

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;

    return BdLayoutPadding(
      padding: PaddingEnum.home,
      child: SizedBox(
        width: size.widthCommon,
        height: size.sizedBox32,
        child: BlocSelector<BananaEstimateOptionBloc, BananaEstimateOptionState, int>(
          selector: (state) => state.current,
          builder: (context, current) =>
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _Button(
                    index: 0,
                    current: current,
                  ),
                  const BdCustomPad(padEnum: PadEnum.width12),
                  _Button(
                    index: 1,
                    current: current,
                  ),
                  const BdCustomPad(padEnum: PadEnum.width12),
                  _Button(
                    index: 2,
                    current: current,
                  ),
                ],
              ),
        ),
      ),
    );
  }
}


class _Button extends StatelessWidget {
  final int current;
  final int index;
  const _Button({
    required this.current,
    required this.index
  });

  @override
  Widget build(BuildContext context) {
    final List<String> sortList = context.read<EstimateManager>().sortName;
    final CommonSize size = context.read<VerseConfig>().size;
    return Flexible(
      fit: FlexFit.tight,
      child: BdRippleButtonBasic(
          onTap: (){
            context.read<EstimateManager>().sortEstimate(context: context, index: index);
          },
          padding: EdgeInsets.symmetric(
            horizontal: size.sized8grid
          ),
          color: current == index
              ? yellow
              : white,
          border: Border.all(
              color: current == index
                  ? yellow
                  : greyAAAAAA,
              width: size.sizedBox1
          ),
          borderRadius: BorderRadius.circular(999),
          child: Center(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(sortList[index],
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: size.sub,
                      color: current == index
                          ? brown
                          : greyAAAAAA
                  ),
                ),
              )
          )
      ),
    );
  }
}
