import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_image.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/auth/auth/state/bloc/banana_auth/banana_auth_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/auth/login/manager/login_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/neo/bd_neo_button.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/normal/bd_disabled_button.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/image/svg/bd_svg_binder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginSnsButtonSelector extends StatelessWidget {
  const LoginSnsButtonSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return BlocSelector<BananaAuthBloc, BananaAuthState, StatusEnum>(
        selector: (state) => state.dataDto.statusEnum,
        builder: (context, status) =>
        status == StatusEnum.success
            ? const _Default()
            :
            Column(
              children: List.generate(
                  2, (index) =>
              !context.read<VerseConfig>().cache.mainCache.isIos && index == 1
                  ? const SizedBox()
                  : Container(
                margin: EdgeInsets.only(bottom: size.sizedBox28),
                child: BdNeoButton(
                  size: size,
                  width: size.widthCommon,
                  height: size.sizedBox48,
                  text: '',
                  boxColor:  switch(index){
                    0 => kakaoYellow,
                    _ => Colors.black
                  },
                  radius: size.sizedBox12,
                  textWidget: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      BdSvgBinder(
                        icon: switch(index){
                          0 => kakaoSvg,
                          _ => appleSvg
                        },
                        size: size.sizedBox48*0.43,
                        color:  switch(index){
                          0 => kakaoSymbol,
                          _ => white
                        },
                      ),
                      Expanded(
                          child: Center(
                              child: Text(
                                switch(index){
                                  0 => 'Kakao로 계속하기',
                                  _ => 'Apple로 계속하기'
                                },
                                style: TextStyle(
                                    fontSize: size.sizedBox48*0.43,
                                    color: switch(index){
                                      0 => kakaoLable,
                                      _ => white
                                    },
                                    fontWeight: FontWeight.w400
                                ),
                              )
                          )
                      )
                    ],
                  ),
                  onPressed: (){
                    context.read<LoginManager>().snsLoginButton(context: context, index: index);
                  },
                ),
              )
              ),
            )
    );
  }
}


class _Default extends StatelessWidget {
  const _Default();

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return BdDisabledButton(text: '잠시만 기다려주세요...',
      width: size.widthCommon,
      height: size.sizedBox48,
      borderRadius: size.sizedBox12,
    );
  }
}

