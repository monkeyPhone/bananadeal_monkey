import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/store_search/manager/store_search_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/store_search/state/bloc/banana_store_search_option/banana_store_search_option_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/bd_ripple_icons_button.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/special/bd_ripple_icon_on_button.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_layout_side.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/text/bd_text_form_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoreSearchAppbarView extends StatefulWidget {
  const StoreSearchAppbarView({super.key});

  @override
  State<StoreSearchAppbarView> createState() => _StoreSearchAppbarViewState();
}

class _StoreSearchAppbarViewState extends State<StoreSearchAppbarView> {
  late TextEditingController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TextEditingController();

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
    return BdLayoutSide(
      sidePadding: SidePadding.canvasAppbar,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BlocSelector<BananaStoreSearchOptionBloc, BananaStoreSearchOptionState, bool>(
            selector: (state) => state.isFavorite,
            builder: (state, favorite)=>
                BdRippleIconOnButton(
                  size: size,
                  onTap: (){
                    if(MediaQuery.of(context).viewInsets.bottom > 0){
                      FocusScope.of(context).unfocus();
                    } else{
                      context.read<StoreSearchManager>().closePage(context: context, isFavorite: favorite);
                    }
                  },

                  icon: Icons.arrow_back_ios,
                ),

          ),
          Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  right: size.sizedPaddingHalf,
                  top: size.sizedBox1_5,
                  bottom: size.sizedBox1_5,
                ),
                child: BdTextFormCustom(
                  size: size,
                  // onChanged: context.read<VerseConfig>().func.helper.commonFunction.debounceText(
                  //         (val){
                  //           context.read<StoreSearchManager>().updateKeyword(context: context, keyword: val);
                  //     }
                  // ),
                  contentPadding: EdgeInsets.only(
                    left: size.sizedPaddingHalf,
                    top: size.sizedPaddingOnlyAppBar,
                  ),
                  inputBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: karajeck,
                          width: size.sizedBox1_5
                      )
                  ),
                  enabled: true,
                  fontSize: size.body,
                  hintText: '주변 매장 검색',
                  textController: _controller,
                  suffixIcon: Padding(
                    padding: EdgeInsets.only(
                        top: size.sizedBox7_5,

                        bottom: size.sizedBox7_5
                    ),
                    child: BdRippleIconsButton(
                      size: size,
                      onTap: (){
                        _controller.clear();
                        context.read<StoreSearchManager>().deleteKeyword(context);
                      },
                      icon: Icons.cancel,
                      iconColor: ultimateGrey
                    ),
                  )
                ),
              )
          ),
          BdRippleIconOnButton(
            onTap: context.read<VerseConfig>().function.debounce(callback: (){
              context.read<StoreSearchManager>().updateKeyword(context: context, keyword: _controller.text);
            }),
            padding: EdgeInsets.all(size.sizedBox11),
            icon: Icons.search, size: size,
          ),
        ],
      ),
    );
  }
}
