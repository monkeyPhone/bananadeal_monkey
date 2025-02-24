import 'package:banana_deal_by_monkeycompany/banana/src/redirect/provider/banana_redirect_provider.dart';
import 'package:banana_deal_by_monkeycompany/banana/ui/app/view/frame/web_frame.dart';
import 'package:css/css.dart';
import 'package:data_repository_provider/data_repository_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../src/redirect/banana_redirect.dart';

class App extends StatelessWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DataRepositoryProvider(
      child: CssProvider(
          widthCommon: MediaQuery.of(context).size.width,
          heightCommon: MediaQuery.of(context).size.height,
          origin: MediaQuery.of(context).size.width < 600 ? MediaQuery.of(context).size.width : (((MediaQuery.of(context).size.height)*440)/956
          ),
          child: BananaRedirectProvider(
          child: !kIsWeb
              ? const _BananaDeal()
              : FlutterWebFrame(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              enabled: true,
              builder: (BuildContext context) =>  const _BananaDeal(),
              maximumSize:
              Size(
                  context.read<CssSizeImpl>().heightCommon*0.56,
                  context.read<CssSizeImpl>().heightCommon
              )
          ),
        ),
      )
    );
  }
}

class _BananaDeal extends StatelessWidget {
  const _BananaDeal();

  @override
  Widget build(BuildContext context) {

    return MaterialApp.router(
      builder: (context, child) {
        return MediaQuery.withNoTextScaling(
            child: child!
        );
      },
      routerConfig: bananaDealRouter,
      debugShowCheckedModeBanner: false,
      color: const Color(0xffFFC939),
      title: '바나나딜 개발모드',
      theme: CssTheme(
          size: context.read<CssSizeImpl>()
      ).themeLight,
    );
  }
}