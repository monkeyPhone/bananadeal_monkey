import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/method/api/model/data/canvas_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_image.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/broad/manager/broad_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/broad/state/bloc/banana_broad_nav/banana_broad_nav_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/broad/state/listener/broad_listener.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/chat/view/chat_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/deal/view/deal_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/etc/view/etc_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/home/view/home_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/store/view/store_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/bd_ripple_button_basic.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/canvas/bd_canvas.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_custom_pad.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/ui/bd_ui_indexed_stack_animated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BroadView extends StatelessWidget {
  const BroadView({super.key});

  @override
  Widget build(BuildContext context) {
    return const BdCanvas(
      canvasEnum: CanvasEnum.home,
      isCanPop: false,
      listener: BroadListener(),
      navNullAble: true,
      body:  _Body(),
      // HomeUi(),
      navbarWidget: _BottomNav(),
    );
  }
}


class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<BananaBroadNavBloc, BananaBroadNavState, NavEnum>(
        selector: (state) => state.currentPage,
        builder: (context, page) =>
            BdUiIndexedStackAnimated(
              index: page.index,
              children: const [
                HomeView(),
                StoreView(),
                DealView(),
                ChatView(),
                EtcView(),
              ],
            )
            // IndexedStack(
            //   index: page.index,
            //   children: const [
            //     HomeView(),
            //     StoreView(),
            //     DealView(),
            //     ChatView(),
            //     EtcView(),
            //   ],
            // )
    );
  }
}


class _BottomNav extends StatelessWidget {
  const _BottomNav();

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return SizedBox(
      width: size.widthCommon,
      height: size.sizedButton,
      child: Column(
        children: [
          Container(
            color: greyEAEAEA,
            height: size.sizedBox0_5,
          ),
          const Expanded(child: _NavIconArea()),
        ],
      ),
    );
  }
}



class _NavIconArea extends StatelessWidget {
  const _NavIconArea();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(5, (index) =>
          BlocSelector<BananaBroadNavBloc, BananaBroadNavState, NavEnum>(
            selector: (state) => state.currentPage,
            builder: (context, currentPage) =>
                _NavIcon(
                    onTap: (){
                      context.read<BroadManager>().changePage(context: context, page: NavEnum.values[index]);
                    },
                    currentPage: currentPage.index == index,
                    iconName: switch(index){
                      0 => homeOn,
                      1 => storeOn,
                      2 => dealOn,
                      3 => chatOn,
                      _ => other,
                    },
                    buttonName: switch(index){
                      0 => '홈',
                      1 => '동네매장',
                      2 => 'My딜',
                      3 => '채팅',
                      _ => '더보기'
                    }
                ),
          )
      ),
    );
  }
}


class _NavIcon extends StatelessWidget {
  final GestureTapCallback onTap;
  final bool currentPage;
  final String iconName;
  final String buttonName;
  const _NavIcon({
    required this.onTap,
    required this.currentPage,
    required this.iconName,
    required this.buttonName,
  });

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return Flexible(
      fit: FlexFit.tight,
      child: BdRippleButtonBasic(
        isDebounce: false,
        onTap: onTap,
        borderRadius: BorderRadius.circular(size.sizedBox16),
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: size.sizedBox8
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                flex: 5,
                fit: FlexFit.tight,
                child: SvgPicture.asset(
                  iconName,
                  width: size.sizedBox57,
                  height: size.sizedBox57,
                  fit: BoxFit.contain,
                  colorFilter: ColorFilter.mode(
                      currentPage ? crowdFlower2 : bananaBack,
                      BlendMode.srcIn
                  ),
                ),
              ),
              const BdCustomPad(padEnum: PadEnum.height2),
              Flexible(
                  flex: 4,
                  fit: FlexFit.tight,
                  child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        buttonName,
                        style: TextStyle(
                            fontWeight:  FontWeight.w500,
                            color: currentPage ?  crowdFlower2 : bananaBack
                          // ? Style.crowdFlower2 : Style.grey999999
                        ),
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}

