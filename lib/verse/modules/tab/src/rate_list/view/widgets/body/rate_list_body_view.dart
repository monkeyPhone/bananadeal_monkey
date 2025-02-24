import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/data/widget/bottom_sheet_vo.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_label.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/rate_list/manager/rate_list_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/rate_list/state/bloc/banana_rate_list_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/rate_list/view/components/component_rate_list_list_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/rate_list/view/components/component_rate_list_sort_bar_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/bd_ripple_button_basic.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_custom_pad.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/text/bd_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class RateListBodyView extends StatelessWidget {
  final ScrollController controller;
  const RateListBodyView({
    super.key,
    required this.controller
  });

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return BlocBuilder<BananaRateListBloc, BananaRateListState>(
        builder: (context, state) =>
            Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Flexible(
                      flex: 5,
                      child: BdRippleButtonBasic(
                          margin: EdgeInsets.symmetric(
                              horizontal:  size.sized16grid
                          ),
                          isDebounce: false,
                          color: yellow ,
                          padding: EdgeInsets.symmetric(
                            horizontal: size.sized16grid,
                          ),
                          border: Border.all(
                              width: size.sizedBox1,
                              color: yellow
                          ),
                          height: size.sizedBox45,
                          onTap: (){
                            context.read<RateListManager>().showBottomSheet(
                                isLocation: false,
                                context: context,
                                sheetList: List.generate(state.categoryList.length,
                                        (index) =>BottomSheetVO(
                                            buttonName:  state.categoryList[index].pgName,
                                            onTap: (){
                                              if(controller.hasClients){
                                                controller.jumpTo(0.0);
                                              }
                                              context.read<RateListManager>().changeCategory(context: context, index: index);
                                              Navigator.pop(context);
                                            }
                                        )

                                ).toList()
                            );
                          },
                          child: Center(
                            child: BdTextWidget(
                              text: state.categoryList[state.currentIndex].pgName,
                              textStyle: bodyBrownBold,
                            ),
                          )
                      ),
                    ),
                    const Flexible(
                        flex: 5,
                        fit: FlexFit.tight,
                        child: SizedBox()
                    ),
                  ],
                ),
                const BdCustomPad(padEnum: PadEnum.height16),
                ComponentRateListSortBarView(
                  size: size,
                  currentSort: state.currentSort,
                  onTap: [
                        (){
                      context.read<RateListManager>().changeSort(context: context, index: 0);
                    },
                        (){
                      if(state.currentSort == 1){
                        context.read<RateListManager>().changeSort(context: context, index: 2);
                      } else{
                        context.read<RateListManager>().changeSort(context: context, index: 1);
                      }
                    },
                        (){
                      context.read<RateListManager>().changeSort(context: context, index: 3);
                    },
                        (){
                      if(state.currentSort == 4){
                        context.read<RateListManager>().changeSort(context: context, index: 5);
                      } else{
                        context.read<RateListManager>().changeSort(context: context, index: 4);
                      }
                    }
                  ],
                ),
                ComponentRateListListView(
                  size: size,
                  controller: controller,
                  rateShow: state.rateShow,
                  isSearch: false,
                  routerContext: context.read<RateListManager>().routerContext,
                )
              ],
            )
    );
  }
}
