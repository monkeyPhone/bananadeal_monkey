import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/onboarding/splash/manager/helper/splash_manager_helper.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/onboarding/splash/state/bloc/banana_appversion/banana_appversion_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashManager {
  final SplashManagerHelper _helper;

  const SplashManager({
    required SplashManagerHelper helper,
  }) : _helper = helper;

  void openDialogOneButton({
    required BuildContext context,
    required String url,
  }) => _helper.openDialogOneButton(
      context: context, url: url,
      conFirmOnTap: (){
        context.read<VerseConfig>().route.closeDialog(context);
        authRouting(context);
      }, cancelOnTap: () {

  });

  void openDialogTwoButton({
    required BuildContext context,
    required String url,
  }) => _helper.openDialogTwoButton(
      context: context,
      url: url,
      conFirmOnTap: (){
        context.read<VerseConfig>().route.closeDialog(context);
        authRouting(context);
      },
      cancelOnTap: (){
        context.read<VerseConfig>().route.closeDialog(context);
        authRouting(context);
      }
  );



  void authRouting(BuildContext context) => context.read<VerseConfig>().route.authRouting(context);

  void versionFetched (BuildContext context) =>
      context.read<BananaAppversionBloc>().add(const VersionFetched());

}