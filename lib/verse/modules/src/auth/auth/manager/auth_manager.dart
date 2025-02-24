import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/auth/auth/state/bloc/banana_auth/banana_auth_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/auth/auth/state/bloc/banana_auth_route/banana_auth_route_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthManager {
  final bool isCanPop;
  const AuthManager({
    required this.isCanPop
  });


  void backSpace(BuildContext context){
    if(MediaQuery
        .of(context)
        .viewInsets
        .bottom > 0){
      FocusScope.of(context).unfocus();
    } else{
      context.read<BananaAuthRouteBloc>().add(BackSpace(isCanPop: isCanPop, context: context));
    }
  }


  void tabClick({
    required BuildContext context,
    required int index,
  }){
    context.read<BananaAuthRouteBloc>().add(
        TabClick(
            context: context,
            index: index
        )
    );
  }


  void postEmailLogin({
    required BuildContext context,
    required String email,
    required String pw
  }) => context.read<BananaAuthBloc>().add(PostEmailLogin(email: email, pw: pw));


  void snsLoginButton({
    required BuildContext context,
    required int index,
  }){
    switch(index){
      case 0:
        context.read<BananaAuthBloc>().add(const PostKakaoLogin());
      default:
        context.read<BananaAuthBloc>().add(const PostAppleLogin());
    }
  }


  void listenerCaseSuccess(BuildContext context) => context.read<VerseConfig>().route.authRouting(context);

  void listenerError({
    required BuildContext context,
    required String text,
  }) => context.read<VerseConfig>().browser.snackBar.showSnackBar(context: context, text: text);



}