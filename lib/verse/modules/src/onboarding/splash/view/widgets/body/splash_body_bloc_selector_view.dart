import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/json_error.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/onboarding/splash/manager/splash_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/onboarding/splash/state/bloc/banana_appversion/banana_appversion_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/error/common_error_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'animated_widget/splash_animated_character.dart';

class SplashBodyBlocSelectorView extends StatelessWidget {
  const SplashBodyBlocSelectorView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<BananaAppversionBloc, BananaAppversionState, JsonError?>(
        selector: (state) => state.splashVO.error,
        builder: (context, error) =>
        switch(error) {
          null => const _Success(),
          _ => CommonErrorPage(
            size: context.read<VerseConfig>().size,
            error: error,
            onTap: () {
              context.read<SplashManager>().versionFetched(context);
            },
          )
        }
    );
  }
}

class _Success extends StatelessWidget {
  const _Success();

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return SizedBox(
      width: size.widthCommon,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top:size.sizedBox30),
            child: Stack(
              children: [
                const SplashAnimatedCharacter(),
                Positioned(
                    bottom: -size.sizedBox10,
                    child: const SplashAnimatedString()

                )
              ],
            ),
          ),
          SizedBox(
            height: size.splashPad,
          ),
          Padding(
            padding: EdgeInsets.only(bottom: size.sizedBox30),
            child: const SplashUiBodyAnimatedProgressbar(),
          ),

        ],
      ),
    );
  }
}

