import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/auth/auth/view/auth_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/auth/intro/state/bloc/banana_intro/banana_intro_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IntroManager {

  const IntroManager();

  void gotoLogin(BuildContext context) =>
      context.read<VerseConfig>().route.createRoute(
        context: context,
        isIntro: true,
        routerWidget: const AuthView(isCanPop: true,),
      );


  void eventImageFetched(BuildContext context) =>
      context.read<BananaIntroBloc>().add(const BananaIntroImageFetched());

  void eventImageIndex({
    required BuildContext context,
    required int index
  }) =>
      context.read<BananaIntroBloc>().add(BananaIntroImageIndex(index: index));


}