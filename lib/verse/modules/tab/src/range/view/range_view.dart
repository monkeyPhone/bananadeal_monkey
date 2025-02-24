import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/method/api/model/data/canvas_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/range/manager/range_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/range/state/bloc/banana_range_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/neo/bd_neo_button.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/normal/bd_disabled_button.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/bd_ripple_select_box.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/canvas/bd_canvas.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/text/address_result/bd_text_address_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RangeView extends StatelessWidget {
  final (String, String, int) address;
  final void Function(int range) callBack;
  const RangeView({super.key,
    required this.callBack,
    required this.address
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BananaRangeBloc>(
          create: (BuildContext context) => BananaRangeBloc(
          )..add(FetchCurrent(currentRange: address.$3)),
        ),
      ],
      child: RepositoryProvider<RangeManager>(
          create: (BuildContext context) => RangeManager(
              callBack: callBack,
              address: address,
          ),
          child: const _Canvas()
      ),
    );
  }
}


class _Canvas extends StatelessWidget {
  const _Canvas();

  @override
  Widget build(BuildContext context) {

    return const BdCanvas(
      canvasEnum: CanvasEnum.basic,
      isCanPop: true,
      appbar: ('범위 설정', null, null, null),
      body: _Body(),
      navbarWidget: _CanvasButton(),
    );
  }
}

class _CanvasButton extends StatelessWidget {
  const _CanvasButton();

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return BlocSelector<BananaRangeBloc, BananaRangeState, int>(
        selector: (state) => state.selectRange,
        builder: (context, selectRange) =>
        selectRange == context.read<RangeManager>().address.$3
            ? BdDisabledButton(text: '현재 저장된 범위: ${context.read<RangeManager>().address.$3}km')
            : BdNeoButton(
                size: size,
                text: '설정하기',
                onPressed: () {
                    context.read<RangeManager>().rangeSet(
                        context: context,
                        range: selectRange
                    );
          },
        )
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return Column(
      children: [
        BdTextAddressResult(
          size: size,
          padding: EdgeInsets.all(size.sized16grid),
          dong: context.read<RangeManager>().address.$1,
          road: context.read<RangeManager>().address.$2,
        ),
        const _Pad(),
        const _BoxText(),
        Expanded(
          child: BlocSelector<BananaRangeBloc, BananaRangeState, int >(
              selector: (state) => state.selectIndex,
              builder: (context, range) =>
                  BdRippleSelectBox(
                      padding: EdgeInsets.all(size.sized16grid),
                      buttonList: [
                        ('1km', '', (){
                          context.read<RangeManager>().fetchSelect(selectIndex: 0, context: context);
                        }),
                        ('3km', '', (){
                          context.read<RangeManager>().fetchSelect(context: context, selectIndex: 1);
                        }),
                        ('5km', '', (){
                          context.read<RangeManager>().fetchSelect(context: context, selectIndex: 2);
                        }),
                        ('10km', '', (){
                          context.read<RangeManager>().fetchSelect(context: context, selectIndex: 3);
                        }),
                        ('15km', '', (){
                          context.read<RangeManager>().fetchSelect(context: context, selectIndex: 4);
                        }),
                      ],
                      currentIndex: range
                  )
          ),
        )
      ],
    );
  }
}


class _Pad extends StatelessWidget {
  const _Pad();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.read<VerseConfig>().size.sized16grid,
    );
  }
}


class _BoxText extends StatelessWidget {
  const _BoxText();

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: size.sized16grid),
      width: size.widthCommon,
      color: Colors.transparent,
      child: Text('매장 검색 범위',
        style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: size.titleButton
        ),
      ),
    );
  }
}
