import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_label.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/model_list/manager/model_list_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/model_list/state/bloc/banana_model_list/banana_model_list_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/model_list/view/widgets/body/model_list/model_list_body_spec_mobile_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/bd_ripple_button_basic.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/text/bd_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ModelListBodyView extends StatefulWidget {
  const ModelListBodyView({super.key});

  @override
  State<ModelListBodyView> createState() => _ModelListBodyViewState();
}

class _ModelListBodyViewState extends State<ModelListBodyView> {
  late ScrollController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = ScrollController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return  BlocBuilder<BananaModelListBloc, BananaModelListState>(
      builder: (context, state) =>
          Expanded(
            child: Column(
              children: [
                _RippleCategory(
                  size: size,
                  margin: EdgeInsets.only(
                      bottom: size.sizedPaddingHalf
                  ),
                  categoryList: List.generate(
                      state.makerList.length,
                          (index) => (state.makerList[index].mkName, (){
                        context.read<ModelListManager>().changeIndex(
                            context: context,
                            index: index
                        );
                        if(_controller.hasClients){
                          _controller.jumpTo(0.0);
                        }
                      })
                  ),
                  currentIndex: state.currentIndex,
                ),
                _ModelListSortButton(
                    isSpec: state.tkIdx == '0',
                    currentSort: state.currentSort),
                // const _DividerTop(),


                state.tkIdx == '0'
                    ? ModelListBodySpecView(
                  size: size,
                  specView: state.specView, controller: _controller, routerContext: context.read<ModelListManager>().routerContext,)
                    : ModelListBodyMobileView(
                    size: size,
                    mobileView: state.mobileView, controller: _controller, routerContext: context.read<ModelListManager>().routerContext),
              ],
            ),
          ),

    );
  }
}




class _RippleCategory extends StatelessWidget {
  final CommonSize size;
  final EdgeInsetsGeometry? margin;
  final List<(String, GestureTapCallback)> categoryList;
  final int currentIndex;
  const _RippleCategory({
    required this.size,
    this.margin,
    required this.categoryList,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.widthCommon,
      margin: margin,
      child:  Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.sized16grid),
        child: Row(
          children: List.generate(categoryList.length,
                  (index) =>
                      Flexible(
                        child: BdRippleButtonBasic(
                            isDebounce: false,
                            // borderRadius: BorderRadius.only(
                            //   topRight: Radius.circular(WidgetSize(context).sizedBox12),
                            //   topLeft: Radius.circular(WidgetSize(context).sizedBox12),
                            // ),
                            color:  index == currentIndex ? yellow : white,
                            padding: EdgeInsets.symmetric(
                              horizontal: size.sizedBox40,
                            ),
                            height: size.sizedBox45,
                            border:  switch(index){
                              0 => Border.all(
                                  width: size.sizedBox1,
                                  color: index == currentIndex ? yellow : greyD7D7D7
                              ),
                              _ => Border(
                                right: BorderSide(
                                    width: size.sizedBox1,
                                    color: index == currentIndex ? yellow : greyD7D7D7
                                ),
                                top: BorderSide(
                                    width: size.sizedBox1,
                                    color: index == currentIndex ? yellow : greyD7D7D7
                                ),
                                bottom: BorderSide(
                                    width: size.sizedBox1,
                                    color: index == currentIndex ? yellow : greyD7D7D7
                                ),
                              )
                            },
                            onTap: categoryList[index].$2,
                            child: Center(
                              child: BdTextWidget(
                                text: categoryList[index].$1,
                                textStyle: index == currentIndex ? bodyBrownBold : body,
                              ),
                            )
                        ),
                      )
          ).toList(),
        ),
      ),
    );
  }
}



class _ModelListSortButton extends StatelessWidget {
  final bool isSpec;
  final int currentSort;
  const _ModelListSortButton({
    required this.isSpec,
    required this.currentSort
  });

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return Container(
      margin: EdgeInsets.only(
          top: size.sizedPaddingHalf,
          bottom: size.sized16grid
      ),
      width: size.widthCommon,
      child: Padding(
        padding: EdgeInsets.only(
            left: size.sized16grid),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child:
          isSpec ?
          Row(
            children: [
              _SortButton(
                text: '기본순',
                isSort: currentSort == 0,
                onTap: (){
                  context.read<ModelListManager>().changeSort(context: context,index: 0);
                },
              ),
              _SortButton(
                text: '최신순',
                isSort: currentSort == 1,
                onTap: (){
                  context.read<ModelListManager>().changeSort(context:context, index: 1);
                },
              ),
              _SortButton(
                text: currentSort == 3 ? '이름순 ↑' : '이름순 ↓',
                isSort: currentSort == 2 || currentSort == 3,
                onTap: (){
                  if(currentSort == 2){
                    context.read<ModelListManager>().changeSort(context: context, index: 3);
                  } else{
                    context.read<ModelListManager>().changeSort(context: context, index: 2);
                  }
                },
              ),
            ],
          )

              : Row(
            children: [
              _SortButton(
                text: '기본순',
                isSort: currentSort == 0,
                onTap: (){
                  context.read<ModelListManager>().changeSort(context: context, index: 0);
                },
              ),
              _SortButton(
                text:  currentSort == 2 ? '출고가순 ↑' : '출고가순 ↓',
                isSort: currentSort == 1 || currentSort == 2,
                onTap: (){
                  if(currentSort == 1){
                    context.read<ModelListManager>().changeSort(context: context, index: 2);
                  } else{
                    context.read<ModelListManager>().changeSort(context: context, index: 1);
                  }
                },
              ),
              _SortButton(
                text: '최신순',
                isSort: currentSort == 3,
                onTap: (){
                  context.read<ModelListManager>().changeSort(context: context, index: 3);
                },
              ),
              _SortButton(
                text: currentSort == 5 ? '이름순 ↑' : '이름순 ↓',
                isSort: currentSort == 4 || currentSort == 5,
                onTap: (){
                  if(currentSort == 4){
                    context.read<ModelListManager>().changeSort(context: context, index: 5);
                  } else{
                    context.read<ModelListManager>().changeSort(context: context, index: 4);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class _SortButton extends StatelessWidget {
  final String text;
  final bool isSort;
  final GestureTapCallback onTap;
  const _SortButton({
    required this.text,
    required this.isSort,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return  BdRippleButtonBasic(
        height: size.sizedBox35,
        margin: EdgeInsets.only(
          right: size.sizedPaddingHalf,
        ),
        isDebounce: false,
        borderRadius: BorderRadius.circular(999),
        color: white,
        // isSort ? Style.yellow :Style.white,
        padding: EdgeInsets.symmetric(
            horizontal: size.sizedPaddingW,
            vertical: size.sizedPaddingHalfDouble
        ),
        border:  Border.all(
            width: size.sizedBox1,
            color: isSort ? brown : greyD7D7D7
        ),
        onTap: onTap,
        child: Center(
          child: BdTextWidget(
            text: text,
            textStyle: isSort ? subBrown : subGrey,
          ),
        )
    );
  }
}

