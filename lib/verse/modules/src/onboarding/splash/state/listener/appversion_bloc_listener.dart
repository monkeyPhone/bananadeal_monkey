import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/onboarding/splash/manager/splash_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/onboarding/splash/state/bloc/banana_appversion/banana_appversion_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppversionBlocListener extends StatelessWidget {
  const AppversionBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<BananaAppversionBloc, BananaAppversionState>(
      listener: (context, state) {

        if(state.splashVO.statusEnum == StatusEnum.later) {
          String url = context.read<VerseConfig>().cache.mainCache.isIos
              ? state.splashVO.contents!.auAppStore
              : state.splashVO.contents!.auGoogleStore;

          if(state.splashVO.contents!.auIsUpdate == 'Y'){
            context.read<SplashManager>().openDialogOneButton(url: url, context: context);

          }
          else{
            context.read<SplashManager>().openDialogTwoButton(url: url, context: context);
          }
        }
        if(state.splashVO.statusEnum == StatusEnum.success) {
          context.read<SplashManager>().authRouting(context);
        }
      },
      child: const SizedBox(),
    );
  }
}