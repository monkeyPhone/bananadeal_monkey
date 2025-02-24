import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/auth/auth/manager/auth_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/auth/auth/state/bloc/banana_auth_route/banana_auth_route_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/auth/login/view/login_provider_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/auth/sign/view/sign_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/bd_ripple_button_basic.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_layout_view_insets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthProgressSrcSelector extends StatelessWidget {
  const AuthProgressSrcSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<BananaAuthRouteBloc, BananaAuthRouteState, AuthProgressEnum>(
        selector: (state) => state.authProgressEnum,
        builder: (context, progress) =>
            Column(
              children: [
                _TapButton(progress),
                switch(progress){
                  AuthProgressEnum.login => const LoginProviderView(),
                  AuthProgressEnum.sign => const SignProviderView(),
                }
              ],
            )
    );
  }
}


class _TapButton extends StatelessWidget {
  final AuthProgressEnum progress;
  const _TapButton(this.progress);

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return BdLayoutViewInsets(
        child: Container(
          margin: EdgeInsets.only(
            top: size.sizedBox18,),
          color: white,
          width: size.widthCommon,
          height: size.height60px,
          child: Row(
            children: List.generate(
              2, (index) =>
                Expanded(
                    child: BdRippleButtonBasic(
                        onTap: () {
                          context.read<AuthManager>().tabClick(context: context, index: index);
                        },
                        color: progress.index == index
                            ? white
                            : greyEAEAEA,
                        child: Center(
                          child: Text(
                            index == 0 ? '로그인' : '회원가입',
                            style: TextStyle(
                                fontSize: size.titleButton,
                                color: progress.index == index
                                    ? blackWrite
                                    : ultimateGrey,
                                fontWeight: FontWeight.w400
                            ),
                          ),
                        )
                    )
                ),
            ),
          ),
        )
    );
  }
}