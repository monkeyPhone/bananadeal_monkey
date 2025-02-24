import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/info/info_user/manager/info_user_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/info/info_user/state/bloc/banana_info_user/banana_info_user_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/neo/bd_neo_button.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/text/address_result/bd_text_address_result.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/text/bd_top_text_area.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InfoUserLocationView extends StatelessWidget {
  const InfoUserLocationView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _LocationBar(),
        _LocationSelect(),
      ],
    );
  }
}


class _LocationBar extends StatelessWidget {
  const _LocationBar();

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return BlocBuilder<BananaInfoUserBloc, BananaInfoUserState>(
      builder: (BuildContext context, BananaInfoUserState state)=>
          Padding(
            padding: EdgeInsets.only(
                bottom: size.sized16grid
            ),
            child: switch(state.addressVO.dong){
              '' =>
                  BdTopTextArea(
                    size: size,
                    text1: '반가워요. ${state.nickname}님!',
                    text2: '위치를 설정해주세요.',
                    text3: '가까운 매장을 찾기 위해서 위치 설정이 필요해요.',
                  ),
              _ =>
                  BdTextAddressResult(dong: state.addressVO.dong, road: state.addressVO.address, size: size,)

            },
          ),

    );
  }
}


class _LocationSelect extends StatelessWidget {
  const _LocationSelect();

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return Column(
      children: [
        ...List.generate(
            switch(kIsWeb){
              true => 1,
              _ => 2
            }, (index) =>
            _Button(
              padding: switch(index){
                0 => EdgeInsets.symmetric(vertical: size.sizedBox28),
                _ => EdgeInsets.only(bottom: size.sizedBox28)
              },
              icon: switch(index){
                0 => Icons.apartment,
                _ => Icons.map_outlined
              },
              boxColor: switch(index){
                0 => nattierBlue,
                _ => pistachio
              },
              text: switch(index){
                0 => '검색으로 위치 찾기',
                _ => '지도에서 위치 찾기'
              },
              onPressed: (){
                context.read<InfoUserManager>().locationSelect(context: context, index: index);
              },
            )
        ).toList(),

      ],
    );
  }
}


class _Button extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final Color? boxColor;
  final IconData icon;
  final String text;
  final VoidCallback onPressed;

  const _Button({
    this.padding,
    this.boxColor,
    required this.icon,
    required this.text,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return Padding(
      padding: padding ?? const EdgeInsets.all(0),
      child: BdNeoButton(
        size: size,
        width: size.widthCommon,
        height: size.height60px,
        text: '',
        boxColor: boxColor,
        radius: size.sizedBox12,
        onPressed: onPressed,
        textWidget: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: size.sizedBox48*0.43,
              color: white,
            ),
            Expanded(
                child: Center(
                    child: Text(
                      text,
                      style: TextStyle(
                          fontSize: size.sizedBox48*0.43,
                          color: white,
                          fontWeight: FontWeight.w400
                      ),
                    )
                )
            )
          ],
        ),
      ),
    );
  }
}
