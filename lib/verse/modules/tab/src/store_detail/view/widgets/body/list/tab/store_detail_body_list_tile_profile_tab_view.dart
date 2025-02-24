import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_label.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/store_detail/manager/store_detail_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/store_detail/state/bloc/banana_store_detail_option/banana_store_detail_option_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/store_detail/view/widgets/body/list/tab/home/store_detail_body_list_tile_tab_home.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/store_detail/view/widgets/body/list/tab/review/store_detail_body_list_tile_tab_review.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/bd_ripple_button_basic.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_custom_pad.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/text/bd_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoreDetailBodyListTileProfileTabView extends StatelessWidget {
  const StoreDetailBodyListTileProfileTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        _DefaultTapBar(
          value: ['홈', '후기'],
        ),
        BdCustomPad(padEnum: PadEnum.height32),
        _Content()
      ],
    );
  }
}


class _DefaultTapBar extends StatelessWidget {
  final List<String> value;

  const _DefaultTapBar({
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return BlocSelector<BananaStoreDetailOptionBloc, BananaStoreDetailOptionState, int>(
        selector: (state) => state.currentIndex,
        builder: (context, currentIndex) =>
            SizedBox(
              width: size.widthCommon,
              height: size.sizedAppbar,
              child: Row(
                children: List.generate(
                    value.length, (index) =>
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: BdRippleButtonBasic(
                          inerMargin: EdgeInsets.symmetric(
                              horizontal: size.sizedAppbar+size.sizedBox3_5
                          ),
                          color: white,
                          isDebounce: false,
                          onTap: (){
                            context.read<BananaStoreDetailOptionBloc>().add(ChangeTap(index: index));
                          },
                          onLongPress: (){
                            context.read<BananaStoreDetailOptionBloc>().add(ChangeTap(index: index));
                            context.read<StoreDetailManager>().getController(context).jumpTo(0);

                          },
                          onDoubleTap: (){
                            context.read<BananaStoreDetailOptionBloc>().add(ChangeTap(index: index));
                            context.read<StoreDetailManager>().jumpToMiddle(context: context, size: size);
                          },
                          border: Border(
                            bottom: BorderSide(
                                width: size.sizedBox3_5,
                                color:  currentIndex == index ? yellow : Colors.transparent
                            ),
                          ) ,
                          child: Center(
                            child: BdTextWidget(
                              text: value[index],
                              textStyle: currentIndex == index ? titleLittle : titleLittleGrey,
                            ),
                          )
                      ),
                    )
                ),
              ),
            )
    );
  }
}


class _Content extends StatelessWidget {
  const _Content();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<BananaStoreDetailOptionBloc, BananaStoreDetailOptionState, int>(
        selector: (state) => state.currentIndex,
        builder: (context, currentIndex) =>
        currentIndex == 0
            ? const StoreDetailBodyListTileTabHome()
            : const StoreDetailBodyListTileTabReview()
    );
  }
}