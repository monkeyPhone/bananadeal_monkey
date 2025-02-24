import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_label.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/store/state/bloc/banana_store_option/banana_store_option_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/route/state/cubit/banana_route/banana_route_cubit.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/bd_ripple_button_basic.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_custom_pad.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_layout_width.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/text/bd_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum StoreSortEnum {
  store
}

class BdUiStoreSortBar extends StatelessWidget {
  final StoreSortEnum sortEnum;
  final GestureTapCallback onTap;
  final int index;
  const BdUiStoreSortBar({super.key,
    required this.sortEnum,
    required this.onTap,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return BdLayoutWidth(
      child: Row(
        children: [
          const BdCustomPad(padEnum: PadEnum.width16),
          _SortButton(
            isSort: true,
            onTap: onTap,
            text: context.read<VerseConfig>().function.sortName(index),
          ),
          const BdCustomPad(padEnum: PadEnum.width16),
          _AlertBox(
            sortEnum: sortEnum,
          ),

        ],
      ),
    );
  }
}

class _AlertBox extends StatelessWidget {
  final StoreSortEnum sortEnum;
  const _AlertBox({
    required this.sortEnum
  });

  @override
  Widget build(BuildContext context) {
    return Builder(
        builder: (BuildContext context){
          final sort = switch(sortEnum){
            StoreSortEnum.store => context.select((
                BananaStoreOptionBloc bloc
                ) => bloc.state.currentSort),
          };
          final dong = context.select((
              BananaRouteCubit cubit
              ) => cubit.state.userVO.mAddDong );
          return BdTextWidget(
            text: '$dong ${switch(sort){
              0 => '가까운 순',
              1 => '평점 순',
              2 => '참여 순',
              3 => '단골매장 순',
              _ => ''
            }}의 매장목록입니다.',
            textStyle: sub,
          );
        }
    );
  }
}

class _SortButton extends StatelessWidget {
  final GestureTapCallback onTap;
  final String text;
  final bool isSort;
  const _SortButton({
    required this.onTap,
    required this.text,
    required this.isSort,
  });

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return BdRippleButtonBasic(
      onTap: onTap,
      margin: EdgeInsets.only(
        right: size.sized12grid,
      ),
      borderRadius: BorderRadius.circular(999),
      border: Border.all(
          width: size.sizedBox1_5,
          color: isSort ? yellow : greyAAAAAA
      ),
      padding: EdgeInsets.symmetric(
          horizontal: size.sizedBox12,
          vertical: size.sizedBox6_5
      ),
      color: isSort ? yellow : white,
      child: BdTextWidget(
        text: text,
        textStyle: isSort ? subBrown : subGrey,
      ),
    );
  }
}
